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
3. Elige título: `\titulo{TEMA 01}{Tu título}`.
4. Compila con **Ctrl+Alt+B** (o guarda y compila solo con Ctrl+S).
   El PDF sale **junto al .tex** y los auxiliares (`.log` incluido) se borran solos.

## ✍️ Modo fácil (escribes menos)

No hace falta escribir `\begin{...}...\end{...}`. Los items se separan con **`|`**
y la **negrita** se pone con **`**texto**`**:

| Quieres... | Escribes |
|---|---|
| **Apartado** (separa y colorea todo lo de debajo) | `\titulo{TEMA 02}{Teoria de la Gestalt}` |
| ...del mismo apartado pero en otro color | `\titulo[rojoA]{APARTADO 3}{Canvi}` |
| Subtítulo de sección | `\seccion{Percebre no és rebre}` |
| Párrafo con fondo | `\parrafo{Segons la psicologia...}` |
| Lista con viñetas | `\lista{Buscar|Seleccionar|Relacionar}` |
| Lista con negrita | `\lista{**Buscar**|Seleccionar|**Recordar**}` |
| Lista de tareas | `\tareas{Leer el artículo|Resumir las técnicas}` |
| Pasos numerados | `\pasos{Primero mirar|Luego escribir}` |
| Ideas / estrellas | `\estrellas{Idea muy importante}` |
| Avisos | `\alertas{Cuidado con esto}` |
| Preguntas de repaso | `\preguntas{¿Qué es la Gestalt?}` |
| Secuencia con flechas | `\flechas{Estímulo|Percepción|Interpretación}` |
| Caja de información | `\caja{**Idea clave:** texto.}` |
| Nota lateral | `\nota{Para el examen}{Diferencia bien...}` |
| Caja resumen | `\resumen{Resumen del tema...}` |
| Definición (título + texto) | `\definicion{Gestalt}{Corrient psicològica...}` |
| Dos definiciones juntas | `\definicionpar{A}{texto}{B}{texto}` |
| Dato grande | `\dato{70\%}{Del examen}` |
| Resaltar dentro del texto | `\hl{esto queda resaltado}` |

### 🎨 Color por apartado

`\titulo` (el apartado) **colorea todo lo que venga debajo**: secciones, cajas,
notas, definiciones... hasta que pongas otro `\titulo` con otro color.

```latex
\titulo{TEMA 02}{Percebre}          % todo lo de aquí abajo: paleta actual
\caja{Caja del color del tema}       % (secondary de la paleta)

\titulo[rojoA]{APARTADO 3}{Canvi}   % cambio de color
\caja{Ahora roja}                    % automática
\nota{Examen}{Esto cae seguro}       % también roja

\colorapartado{mentA}                % cambio a mitad de página
```

Los comandos "largos" (`\tituloE`, `\sectionheader`, `\infobox`, `\tipbox`,
`\shadowbox`, `\begin{bulletlist}`...) siguen funcionando igual.

## 🌐 Emojis y símbolos

Puedes escribir emojis directamente en el texto y **se ven solos**, sin envolver
nada: `🌐 📚 ✅ ⚠️ ★ ♥ →`. La librería detecta el carácter y usa la fuente
`Symbola.ttf` solo para ese glifo, volviendo a la fuente normal al instante.
(Viene incluida en `bibliotecas_latex/fonts/`, no hay que instalar nada.)

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
