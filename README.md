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

El propio `.tex` **descarga `estilo.tex` y `fonts/` desde GitHub en cada
compilación**, a una carpeta temporal (`/tmp/apuntes-latex-lib-<nombre>`).
La usa para compilar y, al terminar, **la borra sola**: no queda nada ni en
el proyecto ni en tu equipo.

Como se baja la última versión cada vez, **si cambias algo en GitHub, la
próxima compilación ya lo coge** (no hay que borrar ninguna caché).
Solo necesita `-shell-escape` (ya está activado en la config de VS Code)
e internet.

Repo: **https://github.com/nataliagamezbarea/apuntes-latex**

```latex
% Descarga la librería de GitHub a una carpeta temporal...
\immediate\write18{rm -rf "/tmp/apuntes-latex-lib-\jobname" && \
  mkdir -p "/tmp/apuntes-latex-lib-\jobname" && \
  curl -fsSL https://codeload.github.com/nataliagamezbarea/apuntes-latex/tar.gz/refs/heads/main \
  | tar -xz -C "/tmp/apuntes-latex-lib-\jobname" --strip-components=1}

% ...y al terminar de compilar, la borra (en 2º plano, tras generar el PDF)
\AtEndDocument{\immediate\write18{(sleep 3; rm -rf "/tmp/apuntes-latex-lib-\jobname") >/dev/null 2>&1 &}}

\newcommand{\bibliotecasDir}{/tmp/apuntes-latex-lib-\jobname/bibliotecas_latex}
\input{\bibliotecasDir/estilo}
```

> Cada compilación **necesita internet** (baja siempre la última versión).
> No se guarda ninguna copia: lo descargado se elimina al terminar.

## 📝 Licencia de las fuentes

Las fuentes en `bibliotecas_latex/fonts/` pertenecen a sus respectivos autores.
Revisa sus licencias antes de redistribuirlas.
