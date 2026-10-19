# 📓 Apuntes LaTeX — Plantilla estándar

Plantilla reutilizable para tomar apuntes en LaTeX con VS Code (LaTeX Workshop),
con estilos bonitos, paletas de color y bloques listos para usar.

## ✨ Qué incluye

- `bibliotecas_latex/estilo.tex` — la librería de estilos: paletas de color,
  ~17 estilos de título, cajas, listas, tablas, fichas y mucho más.
- `bibliotecas_latex/fonts/` — fuentes tipográficas usadas por la plantilla.
- `plantilla_apuntes.tex` — plantilla de ejemplo lista para copiar.
- `compilar.sh` — script de compilación (XeLaTeX) con salida configurable.
- `.vscode/` — configuración de VS Code (LaTeX Workshop) lista para usar.

## 🚀 Requisitos

- TeX Live con **XeLaTeX** (`sudo apt install texlive-xetex texlive-latex-extra texlive-pictures texlive-fonts-recommended latexmk`)
- VS Code con la extensión **LaTeX Workshop** (`james-yu.latex-workshop`)

> Se usa **XeLaTeX** (no pdflatex) porque la plantilla carga fuentes `.ttf` con `fontspec`.

## 📖 Cómo usar

1. Abre la carpeta en VS Code.
2. Copia `plantilla_apuntes.tex` como base de cada tema nuevo.
3. Elige paleta: `\paletaBosque`, `\paletaCoral`, `\paletaLavanda`, `\paletaOceano`.
4. Elige título: `\tituloA` … `\tituloQ`.
5. Compila con **Ctrl+Alt+B** (o guarda y compila solo con Ctrl+S).

## 📚 De dónde salen la librería y las fuentes

El `.tex` puede leer `estilo.tex` y `fonts/` de dos sitios, a tu elección.
Se pone en la cabecera del `.tex` (solo lo que necesites):

```latex
% @fuente repo                 % usa la copia del repo clonada en ~/.cache/apuntes-latex/repo
% @fuente local /ruta/carpeta  % usa una carpeta local (debe tener estilo.tex y fonts/)
```

Si **no** pones `@fuente`, el script busca `bibliotecas_latex` subiendo desde la
carpeta del `.tex` (funciona desde `temas/`, `examenes/`, etc.); si no la
encuentra, usa el clon del repo.

> No se descarga nada al compilar: se leen los archivos que ya tengas.
> Para clonar por primera vez (o actualizar) el repo:

```bash
compilar.sh --actualizar archivo.tex   # clona si no existe y hace git pull
```

El clon vive en `~/.cache/apuntes-latex/repo`.

## 📂 Elegir dónde se guarda el PDF

En la cabecera del `.tex` puedes poner solo lo que necesites:

```latex
% @salida /ruta/a/la/carpeta   % copia el PDF a esa carpeta
% @copiar-tex                  % copia también el .tex ahí
```

O desde VS Code: `Ctrl+Shift+P` → **Tasks: Run Task** →
**"Apuntes: compilar y elegir carpeta…"** (abre un selector gráfico y recuerda
la última carpeta elegida).

## 📝 Licencia de las fuentes

Las fuentes en `bibliotecas_latex/fonts/` pertenecen a sus respectivos autores.
Revisa sus licencias antes de redistribuirlas.
