# 📓 Apuntes LaTeX — Plantilla estándar

Plantilla reutilizable para tomar apuntes en LaTeX con VS Code (LaTeX Workshop),
con estilos bonitos, paletas de color y bloques listos para usar.

## ✨ Qué incluye

- `bibliotecas_latex/estilo.tex` — la librería de estilos: paletas de color,
  ~17 estilos de título, cajas, listas, tablas, fichas y mucho más.
- `bibliotecas_latex/fonts/` — fuentes tipográficas usadas por la plantilla.
- `plantilla_apuntes.tex` — plantilla de ejemplo lista para copiar.

## 🚀 Requisitos

- TeX Live con **XeLaTeX**
  (`sudo apt install texlive-xetex texlive-latex-extra texlive-pictures texlive-fonts-recommended`)
- VS Code con la extensión **LaTeX Workshop** (`james-yu.latex-workshop`)

> Se usa **XeLaTeX** (no pdflatex) porque la plantilla carga fuentes `.ttf` con `fontspec`.

## 📖 Cómo usar

1. Copia `plantilla_apuntes.tex` como base de cada tema nuevo.
2. Elige paleta: `\paletaBosque`, `\paletaCoral`, `\paletaLavanda`, `\paletaOceano`.
3. Elige título: `\tituloA` … `\tituloQ`.
4. Compila con **Ctrl+Alt+B** (o guarda y compila solo con Ctrl+S).
   El PDF sale **junto al .tex** y los auxiliares (`.log` incluido) se borran solos.

## 📚 De dónde salen la librería y las fuentes

El propio `.tex` decide de qué carpeta lee `estilo.tex` y `fonts/` con la línea
`\bibliotecasDir`, justo antes del `\input`. Basta con esa ruta: LaTeX ya busca
todo dentro de ella.

```latex
% La carpeta del repo (la que subes a GitHub), vía el enlace /ruta_github:
\newcommand{\bibliotecasDir}{/ruta_github/bibliotecas_latex}
\input{\bibliotecasDir/estilo}

% U otra carpeta cualquiera (debe contener estilo.tex y fonts/):
\newcommand{\bibliotecasDir}{/ruta/a/tu/carpeta}
\input{\bibliotecasDir/estilo}
```

> No se clona ni se descarga nada al compilar: se leen los archivos que ya
> tienes en el disco.

## 📝 Licencia de las fuentes

Las fuentes en `bibliotecas_latex/fonts/` pertenecen a sus respectivos autores.
Revisa sus licencias antes de redistribuirlas.
