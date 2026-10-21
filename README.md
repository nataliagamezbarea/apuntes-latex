# Apuntes en LaTeX

Librería de estilos para apuntes: portada de apartado, secciones, cajas,
tarjetas, viñetas, tablas y pies de página, todo con colores automáticos.

La librería se **descarga de GitHub al compilar** (y se borra al terminar),
así que siempre tienes la última versión. Compila con **XeLaTeX** y
`-shell-escape` (ya configurado en VS Code con LaTeX Workshop).

Cada bloque va con su código (para copiar) y con una captura de cómo queda.

---

## Títulos

**Apartado** — el título grande que abre cada tema (cambia el color de todo
lo que viene debajo):

```latex
\titulo{ETIQUETA}{Título}
```

```latex
\titulo[rosaA]{ETIQUETA}{Título}      % con otro color
```

<img src="capturas/bloque-apartado.png" width="240">

**Estilos alternativos** (A-Q), cada uno con su propio aspecto:

```latex
\tituloA{...}{...}   \tituloB{...}{...}   \tituloC{...}
\tituloD{...}        \tituloE{...}{...}   \tituloF{...}
\tituloG{...}{...}   \tituloH{...}        \tituloI{...}
\tituloJ{...}{...}   \tituloK{...}        \tituloL{...}
\tituloM{...}        \tituloN{...}        \tituloO{...}{...}
\tituloP{...}{...}   \tituloQ{...}
```

<img src="capturas/bloque-titulos.png" width="240">

---

## Secciones

```latex
\seccion{Título}              % sección normal
\secciongrande{Título}        % sección grande
\seccion[rosaA]{Título}       % con otro color
```

<img src="capturas/bloque-secciones.png" width="240">

---

## Texto y párrafos

```latex
\parrafo{Texto con **negrita** y \hl{resaltado}.}
\resalta{Texto solo resaltado}
```

`**negrita**` sale en negrita automáticamente, en cualquier bloque.

<img src="capturas/bloque-parrafos.png" width="240">

---

## Cajas

```latex
\caja{**Idea clave:** caja de información.}
\cajadual{Texto de la izquierda}{Texto de la derecha}
\nota{Título}{Texto de la nota}
\dato{Título}{Dato destacado}
\resumen{**Resumen:** la única caja con el color pleno del apartado.}
\pill{Etiqueta}
```

<img src="capturas/bloque-cajas.png" width="240">

---

## Tarjetas

```latex
\definicion{Título}{Texto}              % una tarjeta
\definicionpar{Título}{Texto}            % una tarjeta más compacta
\rectangulosdoble{T1}{X1}{T2}{X2}         % dos en fila
```

```latex
\rectangulos{                             % 2, 3, 4... en fila
  {Primera}{Texto de la primera.}
  {Segunda}{Texto de la segunda.}
  {Tercera}{Texto de la tercera.}
  {Cuarta}{Texto de la cuarta.}
}
```

Las tarjetas de una misma fila miden **todas la altura de la más alta**.

<img src="capturas/bloque-tarjetas.png" width="240">

---

## Viñetas y listas

Los items se separan con `|`.

```latex
\lista{**Negrita** en el item.|Otro item.|Un último item.}
\marcas{Uno|Dos|Tres}
\tareas{Tarea 1.|Tarea 2.}
\pasos{Paso 1.|Paso 2.|Paso 3.}
\estrellas{Una estrella}
\alertas{Cuidado}
\preguntas{¿Una pregunta?}
\flechas{Flecha 1|Flecha 2}
```

<img src="capturas/bloque-listas.png" width="240">

---

## Tablas

```latex
\begin{tablaminimal}{lcc}          % sin líneas verticales
  \tablacab{Técnica} & \tablacab{Resolución} \\
  \midrule
  fMRI  & Espacial alta & No \\
\end{tablaminimal}
```

```latex
\begin{tablacabecera}{ll}         % cabecera de color
  \rowcolor{primary}
  \tablacabb{Concepto} & \tablacabb{Definición} \\
  \midrule
  Marca & Lo que el consumidor recuerda \\
\end{tablacabecera}
```

```latex
\begin{tablacuadricula}{|l|c|}    % rejilla completa
  \tablacab{Producto} & \tablacab{Precio} \\ \hline
  Manzana & 1,20€ \\ \hline
\end{tablacuadricula}
```

```latex
\begin{fichaclave}{4cm}           % ficha de clave/valor
  \fichaitem{Paleta}{Oceano}
  \fichaitem{Tema}{Introducción}
\end{fichaclave}
```

```latex
\si  \no                        % sí / no
```

<img src="capturas/bloque-tablas.png" width="240">

---

## Tabla de foto (filas)

```latex
\filaimagen{0.32\linewidth}{imagenes/ejemplo.png}
{Texto a la derecha de la imagen.}

\filaimagender{0.32\linewidth}{imagenes/ejemplo.png}
{Texto a la izquierda de la imagen.}

\filacontenido{0.4\linewidth}
{Contenido de la izquierda.}{Contenido de la derecha.}
```

<img src="capturas/bloque-filas.png" width="240">

---

## Emojis y símbolos

Salen solos, sin envolver nada:

```latex
\caja{🌐 Web  📚 Apuntes  ✅ Hecho  ⚠️ Cuidado  ★ Destacado  ♥ Importante  → Flecha}
```

<img src="capturas/bloque-emojis.png" width="240">

---

## Paletas (el color del apartado)

```latex
\paletaOceano      % una de las 24
\paletaRosa
\paletaLavanda
```

```latex
\mipaleta{#E75480}{#B23A63}{#2B2226}   % tu propio color
\colorapartado{rosaA}                    % forzar el color de un bloque
```

Las 24: `paletaAmarillo` `paletaArena` `paletaAzul` `paletaBosque`
`paletaBurdeos` `paletaCafe` `paletaCeleste` `paletaCiruela` `paletaCoral`
`paletaFucsia` `paletaGris` `paletaLavanda` `paletaLila` `paletaLima`
`paletaMelocoton` `paletaMenta` `paletaNaranja` `paletaOceano` `paletaOliva`
`paletaRojo` `paletaRosa` `paletaTurquesa`.

<img src="capturas/bloque-paletas.png" width="240">

---

## Fondo y pie de página

```latex
\usarfondo                 % fondo de cuaderno (puntos)
\pagefoot{Apuntes -- Tema 01}   % pie (píldora centrada)
```

<img src="capturas/bloque-fondo.png" width="240">

---

## Cómo se ordenan tus apuntes

```
apuntes/
  Tema 2/                     <- la asignatura (una carpeta por asignatura)
    tema2.tex                 <- el documento que une TODOS sus apartados
    carga.tex                 <- descarga la librería de GitHub y la enlaza
    Tema2.1/                  <- un tema (una carpeta por tema)
      1.1-apartado.tex        <- los apartados, numerados (1.1, 1.2...)
      1.2-apartado.tex
      imagenes/               <- las imágenes de este tema
    Tema2.2/                  <- el siguiente tema
      2.1-apartado.tex
```

La numeración es la académica: **TEMA 2 → TEMA 2.1 → apartado 1.1**, y el
número va en el nombre del archivo. Si un apartado tiene varias partes, se
puede partir en `1.1.1`, `1.1.2`... (cada uno en su propio archivo).

Para unir los apartados de un tema no hace falta escribir un `\input` por
cada archivo: `\inputcarpeta` mete **todos los `.tex` de una carpeta (y de
sus subcarpetas) en orden**:

```latex
\inputcarpeta{Tema2.1}      % mete 1.1, 1.2... de golpe
```

Las rutas se cuentan **desde la raíz del documento** (la carpeta donde
compilas). En la carpeta `ejemplo/` tienes un ejemplo completo:

```
ejemplo/
  carga.tex
  temas.tex                          <- el documento principal
  apuntes/
    asignatura/
      Temas.tex                      <- la asignatura
      Tema X/                        <- un tema
        Tema X.X/                    <- sus apartados (1.1, 1.2...)
          1.1-apartado.tex
          1.2-apartado.tex
          imagenes/
```

---

## La librería de estilos, dividida

`bibliotecas_latex/estilo.tex` es solo el **cargador**: cada cosa está en
su propio archivo dentro de `bibliotecas_latex/estilo/`.

```
estilo/
  carga/       paquetes, fuentes, emojis
  paletas/     24 paletas (una por archivo)
  colores/     variables, paleta propia, pool de secciones, color actual
  titulos/     un archivo por estilo de título (A-Q) + titulo, seccion
  parrafos/    realce, resaltado, parrafo, resalta
  cajas/       un archivo por caja (caja, nota, dato, resumen...)
  tarjetas/    un archivo por tarjeta (typecard, definicion, rectangulos)
  vinetas/     un archivo por tipo de viñeta
  tablas/      un archivo por tipo de tabla
  filas/       un archivo por tipo de fila
  fondo/       fondo de página, usarfondo, pie
  utilidades/  \inputcarpeta (entrada de carpetas)
```

`bibliotecas_latex/cabecera.tex` es la **plantilla aparte**: contiene la
carga de la librería, el español y la limpieza al terminar. Cada documento
solo hace `\input{carga.tex}` (la copia local) o enlaza la cabecera
descargada.

El catálogo completo, con el código de cada cosa, está en
[`plantilla_apuntes.tex`](plantilla_apuntes.tex) (compílalo para verlo todo).

---

## Los colores de cada bloque

- El **apartado** es el único que lleva el color **pleno**.
- Las **cajas** (caja, nota, dato) llevan el color del apartado.
- Las **tarjetas** llevan un **tono** del color del apartado (más oscuro),
  para que no se confundan con el título.
- Cada **sección** puede cambiar de color con `\colorapartado{rosaA}`.
