#!/usr/bin/env bash
# =====================================================================
#  compilar.sh — Compila un apunte con XeLaTeX leyendo su configuración
#  de salida desde la cabecera del propio archivo .tex
# =====================================================================
#  En el .tex puedes poner (solo lo que necesites):
#     % @salida /ruta/a/la/carpeta      -> copia el PDF ahí
#     % @salida elegir                  -> abre un selector de carpeta
#                                          (y recuerda la última elegida)
#     % @copiar-tex                     -> copia también el .tex ahí
#  Si no pones @salida, el PDF queda junto al .tex como siempre.
#  Los auxiliares (.log, .fls, .aux...) se borran siempre al terminar.
# =====================================================================
set -uo pipefail

# Archivo donde se recuerda la última carpeta elegida con el selector
MEMO_DIR="$HOME/.config/apuntes-latex"
MEMO_FILE="$MEMO_DIR/ultima_salida"

DOC=""
ELEGIR="no"
for arg in "$@"; do
  case "$arg" in
    -e|--elegir) ELEGIR="si" ;;
    *) DOC="$arg" ;;
  esac
done

if [ -z "$DOC" ]; then
  echo "[apuntes] Uso: compilar.sh [--elegir] archivo.tex" >&2
  exit 2
fi
case "$DOC" in
  *.tex) ;;
  *) DOC="$DOC.tex" ;;
esac
DOC="$(realpath "$DOC")"
SRCDIR="$(dirname "$DOC")"
BASE="$(basename "${DOC%.tex}")"

# --- Leer configuración de la cabecera -------------------------------
OUTDIR="$(grep -m1 -E '^%[[:space:]]*@salida[[:space:]]' "$DOC" \
          | sed -E 's/^%[[:space:]]*@salida[[:space:]]+//' \
          | sed -E 's/[[:space:]]+$//')"
COPYTEX="no"
grep -qE '^%[[:space:]]*@copiar-tex([[:space:]]|$)' "$DOC" && COPYTEX="si"

# Expandir ~ al inicio
case "$OUTDIR" in
  "~")   OUTDIR="$HOME" ;;
  "~/"*) OUTDIR="$HOME/${OUTDIR#~/}" ;;
esac

# --- Selector gráfico de carpeta (@salida elegir / --elegir) ---------
if [ "$OUTDIR" = "elegir" ] || [ "$ELEGIR" = "si" ]; then
  # Carpeta por defecto del selector: la última usada, o la del .tex
  DEFECTO="$(cat "$MEMO_FILE" 2>/dev/null || true)"
  [ -z "$DEFECTO" ] && DEFECTO="$SRCDIR"

  if command -v zenity >/dev/null 2>&1; then
    OUTDIR="$(zenity --file-selection --directory \
              --title="Elige dónde guardar el PDF ($BASE)" \
              --filename="$DEFECTO/" 2>/dev/null)"
  else
    echo "[apuntes] No hay selector gráfico (zenity). Usando: $DEFECTO" >&2
    OUTDIR="$DEFECTO"
  fi

  # Si el usuario cancela el selector, se usa la carpeta por defecto
  [ -z "$OUTDIR" ] && OUTDIR="$DEFECTO"

  # Recordar la elección para la próxima vez
  mkdir -p "$MEMO_DIR"
  printf '%s\n' "$OUTDIR" > "$MEMO_FILE"
fi

[ -z "$OUTDIR" ] && OUTDIR="$SRCDIR"

BUILD="$SRCDIR/build"
cd "$SRCDIR" || exit 2

# --- Compilar --------------------------------------------------------
echo "[apuntes] Compilando $BASE.tex con XeLaTeX…"
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error \
        -outdir="$BUILD" -auxdir="$BUILD" "$BASE.tex"
STATUS=$?

if [ $STATUS -ne 0 ]; then
  echo "[apuntes] ❌ Error al compilar. Revisa: $BUILD/$BASE.log"
  exit $STATUS
fi

# --- Colocar el PDF --------------------------------------------------
cp -f "$BUILD/$BASE.pdf" "$SRCDIR/$BASE.pdf"

if [ "$OUTDIR" != "$SRCDIR" ]; then
  mkdir -p "$OUTDIR"
  cp -f "$BUILD/$BASE.pdf" "$OUTDIR/$BASE.pdf"
  echo "[apuntes] 📄 PDF copiado a: $OUTDIR/$BASE.pdf"
  if [ "$COPYTEX" = "si" ]; then
    cp -f "$DOC" "$OUTDIR/$BASE.tex"
    echo "[apuntes] 📝 Copia del .tex en: $OUTDIR/$BASE.tex"
  fi
fi

# --- Limpieza total: fuera logs/fls/aux ------------------------------
rm -rf "$BUILD"

echo "[apuntes] ✅ Listo: $SRCDIR/$BASE.pdf"
