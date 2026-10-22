#!/bin/sh
# =====================================================================
#  BUSCARIMAGEN.SH — busca un fichero por su nombre y lo copia.
#
#  uso:  sh buscarimagen.sh <nombre> <destino>
#
#  Busca <nombre> en este orden:
#    1. en la carpeta "imagenes_explicativas" del proyecto (y sus
#       subcarpetas), empezando por la raiz del proyecto
#    2. en el resto del proyecto (carpeta actual y las de arriba)
#
#  Si lo encuentra, lo copia a <destino> (que es un fichero).
#  Este script existe porque en TeX el ";" es un caracter de comentario:
#  un \write18 con ";" se cortaba a la mitad.
# =====================================================================

nombre="$1"
destino="$2"

if [ -z "$nombre" ] || [ -z "$destino" ]; then
  exit 1
fi

# --- los espacios de mas se ignoran (\imagen{ nube.png } funciona) ---
nombre=$(echo "$nombre" | sed 's,^ *,,; s, *$,,')

# el destino se borra antes: si no, un fichero viejo haria que TeX
# creyese que la imagen existe
rm -f "$destino"

# --- 1) la carpeta "imagenes_explicativas" (y subcarpetas) ---
for d in ../.. . .. ../../..; do
  if [ -d "$d/imagenes_explicativas" ]; then
    f=$(find "$d/imagenes_explicativas" -type f -name "$nombre" 2>/dev/null | head -n 1)
    if [ -n "$f" ]; then
      cp "$f" "$destino"
      exit 0
    fi
  fi
done

# --- 2) el resto del proyecto ---
f=$(find . .. ../.. -type f -name "$nombre" -not -path "*/.git/*" 2>/dev/null | head -n 1)
if [ -n "$f" ]; then
  cp "$f" "$destino"
  exit 0
fi

exit 1
