# 📓 Apuntes LaTeX — Plantilla estándar

Plantilla reutilizable para tomar apuntes en LaTeX con VS Code (LaTeX Workshop),
con estilos bonitos, paletas de color y bloques listos para usar.

Repo de GitHub: **https://github.com/nataliagamezbarea/apuntes-latex**

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

El propio `.tex` **descarga `estilo.tex` y `fonts/` desde GitHub** la primera
vez y los guarda en caché (`~/.cache/apuntes-latex`). Las siguientes veces
reutiliza la caché, sin volver a descargar. Solo necesita `-shell-escape`
(ya está activado en la config de VS Code).

Repo: **https://github.com/nataliagamezbarea/apuntes-latex**

```latex
% Descarga la librería de GitHub si no está en caché:
\immediate\write18{mkdir -p /home/natalia/.cache/apuntes-latex && \
  [ -f /home/natalia/.cache/apuntes-latex/bibliotecas_latex/estilo.tex ] || \
  ( cd /home/natalia/.cache/apuntes-latex && curl -fsSL \
    https://codeload.github.com/nataliagamezbarea/apuntes-latex/tar.gz/refs/heads/main \
    | tar -xz --strip-components=1 )}

\newcommand{\bibliotecasDir}{/home/natalia/.cache/apuntes-latex/bibliotecas_latex}
\input{\bibliotecasDir/estilo}
```

> La 1.ª vez **sí descarga** (necesita internet); después trabaja con la caché.
> Para actualizar la librería: borra `~/.cache/apuntes-latex` y recompila.

## 📝 Licencia de las fuentes

Las fuentes en `bibliotecas_latex/fonts/` pertenecen a sus respectivos autores.
Revisa sus licencias antes de redistribuirlas.
