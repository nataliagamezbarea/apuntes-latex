#!/usr/bin/env bash
# =====================================================================
#  sincronizar.sh — Guarda los apuntes en GitHub automáticamente
#  Hace: commit de los cambios + traer lo remoto + subir a GitHub
# =====================================================================
set -uo pipefail

REPO="/home/natalia/Escritorio/APUNTES"
cd "$REPO" || exit 0

# Nada que hacer si no hay cambios
if [ -z "$(git status --porcelain)" ]; then
  # Aun así, intentamos subir por si hay commits pendientes
  git push -q origin main 2>/dev/null || true
  exit 0
fi

git add -A
git commit -q -m "Auto-guardado: $(date '+%Y-%m-%d %H:%M')"
git pull --rebase --autostash -q origin main 2>/dev/null || true
git push -q origin main 2>/dev/null || echo "[sync] No se pudo subir (¿sin conexión?)" >&2
