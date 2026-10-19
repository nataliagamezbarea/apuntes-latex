#!/usr/bin/env bash
# =====================================================================
#  compilar.sh — Compila un apunte con XeLaTeX leyendo la configuración
#  desde la cabecera del propio archivo .tex
# =====================================================================
#  DIRECTIVAS (pon solo las que necesites, en la cabecera del .tex):
#
#    % @fuente repo                 -> usa la librería del clon de GitHub
#    % @fuente local /ruta/carpeta  -> usa una librería local (esa carpeta
#                                      debe contener estilo.tex y fonts/)
#    % @salida /ruta/carpeta        -> copia el PDF a esa carpeta
#    % @salida elegir               -> abre un selector de carpeta
#    % @copiar-tex                  -> copia también el .tex a esa carpeta
#
#  Si no pones @fuente: usa ./bibliotecas_latex si existe; si no, el repo.
#  NO descarga nada al compilar: lee del clon local que ya tengas.
#  Los auxiliares (.log, .fls, .aux...) se borran siempre al terminar.
# =====================================================================
set -uo pipefail

# --- Rutas fijas -----------------------------------------------------
REPO_URL="${APUNTES_REPO_URL:-https://github.com/nataliagamezbarea/apuntes-latex.git}"
REPO_CACHE="$HOME/.cache/apuntes-latex/repo"
MEMO_DIR="$HOME/.config/apuntes-latex"
MEMO_FILE="$MEMO_DIR/ultima_salida"

# --- Argumentos ------------------------------------------------------
DOC=""
ELEGIR="no"
ACTUALIZAR="no"
for arg in "$@"; do
  case "$arg" in
    -e|--elegir)      ELEGIR="si" ;;
    -u|--actualizar)  ACTUALIZAR="si" ;;
    *) DOC="$arg" ;;
  esac
done

if [ -z "$DOC" ]; then
  echo "[apuntes] Uso: compilar.sh [--elegir] [--actualizar] archivo.tex" >&2
  exit 2
fi
case "$DOC" in
  *.tex) ;;
  *) DOC="$DOC.tex" ;;
esac
DOC="$(realpath "$DOC")"
SRCDIR="$(dirname "$DOC")"
BASE="$(basename "${DOC%.tex}")"

# --- Leer directivas de la cabecera ----------------------------------
leer() { grep -m1 -E "^%[[:space:]]*@$1([[:space:]]|\$)" "$DOC" \
         | sed -E "s/^%[[:space:]]*@$1[[:space:]]*//" \
         | sed -E 's/[[:space:]]+$//'; }

FUENTE_LINE="$(leer fuente)"
SALIDA_LINE="$(leer salida)"
COPYTEX="no"
grep -qE '^%[[:space:]]*@copiar-tex([[:space:]]|$)' "$DOC" && COPYTEX="si"

# --- Expandir ~ ------------------------------------------------------
expandir() { case "$1" in
  "~")   printf '%s' "$HOME" ;;
  "~/"*) printf '%s' "$HOME/${1#~/}" ;;
  *)     printf '%s' "$1" ;;
esac; }

# =====================================================================
#  1) RESOLVER LA LIBRERÍA (estilo.tex + fonts/): repo o local
# =====================================================================
MODO="$(printf '%s' "$FUENTE_LINE" | awk '{print $1}')"
RUTA_LOCAL="$(printf '%s' "$FUENTE_LINE" | sed -E 's/^[^[:space:]]+[[:space:]]*//')"
RUTA_LOCAL="$(expandir "$RUTA_LOCAL")"

usar_repo() {
  if [ ! -f "$REPO_CACHE/bibliotecas_latex/estilo.tex" ]; then
    echo "[apuntes] Primera vez: clonando el repo en $REPO_CACHE …"
    mkdir -p "$(dirname "$REPO_CACHE")"
    if ! git clone -q "$REPO_URL" "$REPO_CACHE" 2>/dev/null; then
      echo "[apuntes] ❌ No se pudo clonar el repo. Usa '@fuente local /ruta'." >&2
      exit 3
    fi
  fi
  if [ "$ACTUALIZAR" = "si" ]; then
    echo "[apuntes] Actualizando el repo…"
    git -C "$REPO_CACHE" pull -q --ff-only 2>/dev/null || \
      echo "[apuntes] ⚠️ No se pudo actualizar (¿sin conexión?). Uso la copia local." >&2
  fi
  LIB="$REPO_CACHE/bibliotecas_latex"
}

case "$MODO" in
  repo)  usar_repo ;;
  local) LIB="$RUTA_LOCAL" ;;
  *)
    # Sin @fuente: busca bibliotecas_latex subiendo desde la carpeta del .tex
    # (así funciona desde temas/, examenes/, etc.). Si no hay, usa el repo.
    LIB=""
    d="$SRCDIR"
    while [ "$d" != "/" ] && [ -n "$d" ]; do
      if [ -f "$d/bibliotecas_latex/estilo.tex" ]; then
        LIB="$d/bibliotecas_latex"; break
      fi
      d="$(dirname "$d")"
    done
    [ -z "$LIB" ] && usar_repo
    ;;
esac

if [ ! -f "$LIB/estilo.tex" ]; then
  echo "[apuntes] ❌ No encuentro la librería en: $LIB" >&2
  echo "[apuntes]    Añade en la cabecera: % @fuente repo   (o local /ruta)" >&2
  exit 3
fi
LIB="$(realpath "$LIB")"
PARENT="$(dirname "$LIB")"

# =====================================================================
#  2) RESOLVER DÓNDE SE COPIA EL PDF (@salida)
# =====================================================================
OUTDIR="$(expandir "$SALIDA_LINE")"

if [ "$OUTDIR" = "elegir" ] || [ "$ELEGIR" = "si" ]; then
  DEFECTO="$(cat "$MEMO_FILE" 2>/dev/null || true)"
  [ -z "$DEFECTO" ] && DEFECTO="$SRCDIR"
  if command -v zenity >/dev/null 2>&1; then
    OUTDIR="$(zenity --file-selection --directory \
              --title="Elige dónde guardar el PDF ($BASE)" \
              --filename="$DEFECTO/" 2>/dev/null)"
  else
    OUTDIR="$DEFECTO"
  fi
  [ -z "$OUTDIR" ] && OUTDIR="$DEFECTO"
  mkdir -p "$MEMO_DIR"
  printf '%s\n' "$OUTDIR" > "$MEMO_FILE"
fi
[ -z "$OUTDIR" ] && OUTDIR="$SRCDIR"

# =====================================================================
#  3) COMPILAR
# =====================================================================
# Carpeta TEMPORAL fuera del proyecto: así NO aparece nada (ni .log, ni .aux,
# ni build/) en tu carpeta. Se borra SIEMPRE al salir (trap), pase lo que pase.
BUILD="$(mktemp -d "${TMPDIR:-/tmp}/apuntes-latex.XXXXXX")"
trap 'rm -rf "$BUILD"' EXIT

# Archivo que le dice a estilo.tex dónde está la librería
printf '\\def\\bibliotecasDir{%s}\n' "$LIB" > "$BUILD/_fuente.tex"

# Buscar _fuente.tex en $BUILD y bibliotecas_latex en la carpeta elegida.
# La carpeta elegida va ANTES que "." para que la librería escogida gane
# aunque exista una copia local suelta.
export TEXINPUTS="$BUILD:$PARENT//:.:"
export BIBINPUTS="$SRCDIR//:.:"
export BSTINPUTS="$SRCDIR//:.:"

cd "$SRCDIR" || exit 2
echo "[apuntes] Compilando $BASE.tex con XeLaTeX (librería: $LIB)…"
latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error \
        -outdir="$BUILD" -auxdir="$BUILD" "$BASE.tex"
STATUS=$?

if [ $STATUS -ne 0 ]; then
  echo "[apuntes] ❌ Error al compilar:"
  grep -nE '^!|:[0-9]+:|Emergency|Fatal error|LaTeX Error' "$BUILD/$BASE.log" 2>/dev/null | head -40
  exit $STATUS
fi

# =====================================================================
#  4) COLOCAR EL PDF (los auxiliares se borran solos con el trap)
# =====================================================================
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

echo "[apuntes] ✅ Listo: $SRCDIR/$BASE.pdf"
