# ✏️ Apuntes en LaTeX

> Librería de estilos para apuntes: apartados, secciones, párrafos, cajas,
> tarjetas, viñetas, tablas y pies de página, todo con colores automáticos.
> Se **descarga de GitHub al compilar**, así que siempre tienes la última
> versión. Compila con **XeLaTeX** y `-shell-escape` (ya configurado en VS Code).

## 📋 Todo lo que puedes usar

### 📥 Carga

| | | Código |
|---|---|---|
| **Carga** | <img src="imagenes_explicativas/carga/carga.png" width="420"> | |
| | | `\input{carga.tex}` |

### 🎨 Paletas

| | | Código |
|---|---|---|
| **Paleta Amarillo** | <img src="imagenes_explicativas/paletas/paleta-amarillo.png" width="420"> | |
| | | `\paletaAmarillo` |
| **Paleta Arena** | <img src="imagenes_explicativas/paletas/paleta-arena.png" width="420"> | |
| | | `\paletaArena` |
| **Paleta Azul** | <img src="imagenes_explicativas/paletas/paleta-azul.png" width="420"> | |
| | | `\paletaAzul` |
| **Paleta Bosque** | <img src="imagenes_explicativas/paletas/paleta-bosque.png" width="420"> | |
| | | `\paletaBosque` |
| **Paleta Burdeos** | <img src="imagenes_explicativas/paletas/paleta-burdeos.png" width="420"> | |
| | | `\paletaBurdeos` |
| **Paleta Cafe** | <img src="imagenes_explicativas/paletas/paleta-cafe.png" width="420"> | |
| | | `\paletaCafe` |
| **Paleta Celeste** | <img src="imagenes_explicativas/paletas/paleta-celeste.png" width="420"> | |
| | | `\paletaCeleste` |
| **Paleta Ciruela** | <img src="imagenes_explicativas/paletas/paleta-ciruela.png" width="420"> | |
| | | `\paletaCiruela` |
| **Paleta Coral** | <img src="imagenes_explicativas/paletas/paleta-coral.png" width="420"> | |
| | | `\paletaCoral` |
| **Paleta Fucsia** | <img src="imagenes_explicativas/paletas/paleta-fucsia.png" width="420"> | |
| | | `\paletaFucsia` |
| **Paleta Gris** | <img src="imagenes_explicativas/paletas/paleta-gris.png" width="420"> | |
| | | `\paletaGris` |
| **Paleta Lavanda** | <img src="imagenes_explicativas/paletas/paleta-lavanda.png" width="420"> | |
| | | `\paletaLavanda` |
| **Paleta Lila** | <img src="imagenes_explicativas/paletas/paleta-lila.png" width="420"> | |
| | | `\paletaLila` |
| **Paleta Lima** | <img src="imagenes_explicativas/paletas/paleta-lima.png" width="420"> | |
| | | `\paletaLima` |
| **Paleta Melocoton** | <img src="imagenes_explicativas/paletas/paleta-melocoton.png" width="420"> | |
| | | `\paletaMelocoton` |
| **Paleta Menta** | <img src="imagenes_explicativas/paletas/paleta-menta.png" width="420"> | |
| | | `\paletaMenta` |
| **Paleta Naranja** | <img src="imagenes_explicativas/paletas/paleta-naranja.png" width="420"> | |
| | | `\paletaNaranja` |
| **Paleta Oceano** | <img src="imagenes_explicativas/paletas/paleta-oceano.png" width="420"> | |
| | | `\paletaOceano` |
| **Paleta Oliva** | <img src="imagenes_explicativas/paletas/paleta-oliva.png" width="420"> | |
| | | `\paletaOliva` |
| **Paleta Rojo** | <img src="imagenes_explicativas/paletas/paleta-rojo.png" width="420"> | |
| | | `\paletaRojo` |
| **Paleta Rosa** | <img src="imagenes_explicativas/paletas/paleta-rosa.png" width="420"> | |
| | | `\paletaRosa` |
| **Paleta Turquesa** | <img src="imagenes_explicativas/paletas/paleta-turquesa.png" width="420"> | |
| | | `\paletaTurquesa` |

### 🌈 Colores

| | | Código |
|---|---|---|
| **Tu propio color** | <img src="imagenes_explicativas/colores/color-propio.png" width="420"> | |
| | | `\mipaleta{#E75480}{#B23A63}{#2B2226}` |
| **Forzar color** | <img src="imagenes_explicativas/colores/color-forzado.png" width="420"> | |
| | | `\colorapartado{rosaA}` |

### 🏷️ Títulos

| | | Código |
|---|---|---|
| **Apartado** | <img src="imagenes_explicativas/titulos/apartado.png" width="420"> | |
| | | `\titulo{ETIQUETA}{Título}` |
| **Sección** | <img src="imagenes_explicativas/titulos/seccion.png" width="420"> | |
| | | `\seccion{Título de sección}` |
| **Sección grande** | <img src="imagenes_explicativas/titulos/seccion-grande.png" width="420"> | |
| | | `\secciongrande{Título de sección}` |
| | | Las secciones grandes se añaden automáticamente al índice. Por defecto aparecen como secciones; para mostrarlas como subsecciones dentro de bloques temáticos, usa `\renewcommand{\secciongrandeindice}{subsection}` antes del contenido. Puedes ajustar su estilo con `\renewcommand{\secciongrandeestilo}{\large}` y `\renewcommand{\secciongrandelongitud}{0.4cm}`. Para mostrar el índice, incluye `\tableofcontents`. |
| **Título A** | <img src="imagenes_explicativas/titulos/tituloA.png" width="420"> | |
| | | `\tituloA{Texto}` |
| **Título B** | <img src="imagenes_explicativas/titulos/tituloB.png" width="420"> | |
| | | `\tituloB{Texto}` |
| **Título C** | <img src="imagenes_explicativas/titulos/tituloC.png" width="420"> | |
| | | `\tituloC{Texto}` |
| **Título D** | <img src="imagenes_explicativas/titulos/tituloD.png" width="420"> | |
| | | `\tituloD{Texto}` |
| **Título E** | <img src="imagenes_explicativas/titulos/tituloE.png" width="420"> | |
| | | `\tituloE{Texto}` |
| **Título F** | <img src="imagenes_explicativas/titulos/tituloF.png" width="420"> | |
| | | `\tituloF{Texto}` |
| **Título G** | <img src="imagenes_explicativas/titulos/tituloG.png" width="420"> | |
| | | `\tituloG{Texto}` |
| **Título H** | <img src="imagenes_explicativas/titulos/tituloH.png" width="420"> | |
| | | `\tituloH{Texto}` |
| **Título I** | <img src="imagenes_explicativas/titulos/tituloI.png" width="420"> | |
| | | `\tituloI{Texto}` |
| **Título J** | <img src="imagenes_explicativas/titulos/tituloJ.png" width="420"> | |
| | | `\tituloJ{Texto}` |
| **Título K** | <img src="imagenes_explicativas/titulos/tituloK.png" width="420"> | |
| | | `\tituloK{Texto}` |
| **Título L** | <img src="imagenes_explicativas/titulos/tituloL.png" width="420"> | |
| | | `\tituloL{Texto}` |
| **Título M** | <img src="imagenes_explicativas/titulos/tituloM.png" width="420"> | |
| | | `\tituloM{Texto}` |
| **Título N** | <img src="imagenes_explicativas/titulos/tituloN.png" width="420"> | |
| | | `\tituloN{Texto}` |
| **Título O** | <img src="imagenes_explicativas/titulos/tituloO.png" width="420"> | |
| | | `\tituloO{Texto}` |
| **Título P** | <img src="imagenes_explicativas/titulos/tituloP.png" width="420"> | |
| | | `\tituloP{Texto}` |
| **Título Q** | <img src="imagenes_explicativas/titulos/tituloQ.png" width="420"> | |
| | | `\tituloQ{Texto}` |

### ✏️ Párrafos y texto

| | | Código |
|---|---|---|
| **Párrafo** | <img src="imagenes_explicativas/parrafos/parrafo.png" width="420"> | |
| | | `\parrafo{Texto del párrafo con **negrita** y \hl{resaltado}.}` |
| **Resaltado** | <img src="imagenes_explicativas/parrafos/resaltado.png" width="420"> | |
| | | `\hl{Texto resaltado}` |
| **Resalta** | <img src="imagenes_explicativas/parrafos/resalta.png" width="420"> | |
| | | `\resalta{Texto resaltado}` |

### 📦 Cajas

| | | Código |
|---|---|---|
| **Caja** | <img src="imagenes_explicativas/cajas/caja.png" width="420"> | |
| | | `\caja{**Idea clave:** caja de información.}` |
| | | `\recuadro{...}` (sinónimo de `\caja`) |
| **Dos cajas** | <img src="imagenes_explicativas/cajas/dos-cajas.png" width="420"> | |
| | | `\cajadual{Texto de la izquierda}{Texto de la derecha}` |
| **Nota** | <img src="imagenes_explicativas/cajas/nota.png" width="420"> | |
| | | `\nota{Para el examen}{Caja de nota con borde de color.}` |
| **Dato** | <img src="imagenes_explicativas/cajas/dato.png" width="420"> | |
| | | `\dato{2024}{Dato destacado}` |
| **Resumen** | <img src="imagenes_explicativas/cajas/resumen.png" width="420"> | |
| | | `\resumen{**Resumen:** la única caja con el color pleno del apartado.}` |
| **Píldora** | <img src="imagenes_explicativas/cajas/pildora.png" width="420"> | |
| | | `\pill{Etiqueta}` |

### 🃏 Tarjetas

| | | Código |
|---|---|---|
| **Tarjeta** | <img src="imagenes_explicativas/tarjetas/tarjeta.png" width="420"> | |
| | | `\definicion{Título de la tarjeta}{Texto de la tarjeta.}` |
| **Tarjeta compacta** | <img src="imagenes_explicativas/tarjetas/tarjeta-compacta.png" width="420"> | |
| | | `\definicionpar{Título de la tarjeta}{Texto de la tarjeta.}` |
| **Dos tarjetas en fila** | <img src="imagenes_explicativas/tarjetas/dos-tarjetas.png" width="420"> | |
| | | `\rectangulosdoble{Primera}{Texto de la primera.}{Segunda}{Texto de la segunda.}` |
| **Cuatro tarjetas en fila** | <img src="imagenes_explicativas/tarjetas/cuatro-tarjetas.png" width="420"> | |
| | | `\rectangulos{{Una}{Texto de la primera.}{Dos}{Texto de la segunda.}{Tres}{Texto de la tercera.}{Cuatro}{Texto de la cuarta.}}` |

### 🔸 Viñetas y listas

Los items se separan con `|` (barra vertical). **La `|` del final es
opcional**: cuando terminas el item, ya está. También vale una **línea en
blanco** para separar items. Y la negrita se pone con `**doble
asterisco**`, sin escribir `\textbf`.

```latex
\lista{Primero|**Segundo** en negrita|Tercero}

\lista{
  Primero
|
  **Segundo** en negrita

  Tercero
}
```

| | | Código |
|---|---|---|
| **Lista** | <img src="imagenes_explicativas/vinetas/lista.png" width="420"> | |
| | | `\lista{**Negrita** en el item.\|Otro item.\|Un último item.}` |
| **Viñeta de rombo** | <img src="imagenes_explicativas/vinetas/marcas.png" width="420"> | |
| | | `\marcas{Uno\|Dos\|Tres}` |
| **Casillas de tarea** | <img src="imagenes_explicativas/vinetas/tareas.png" width="420"> | |
| | | `\tareas{Tarea 1.\|Tarea 2.}` |
| **Pasos numerados** | <img src="imagenes_explicativas/vinetas/pasos.png" width="420"> | |
| | | `\pasos{Paso 1.\|Paso 2.\|Paso 3.}` |
| **Estrella** | <img src="imagenes_explicativas/vinetas/estrellas.png" width="420"> | |
| | | `\estrellas{Idea clave para el examen}` |
| **Aviso** | <img src="imagenes_explicativas/vinetas/alertas.png" width="420"> | |
| | | `\alertas{Cuidado con esto}` |
| **Pregunta** | <img src="imagenes_explicativas/vinetas/preguntas.png" width="420"> | |
| | | `\preguntas{¿Una pregunta?}` |
| **Flechas** | <img src="imagenes_explicativas/vinetas/flechas.png" width="420"> | |
| | | `\flechas{Flecha 1\|Flecha 2}` |
| **Letras** | | |
| | | `\letras{Uno\|Dos\|Tres}` |

### 📊 Tablas

**Atajo**: `\tabla{...}` escribe la tabla entera (sin `\begin`/`\end`) y
**detecta las columnas solo**. También `\tablacolor{...}`,
`\tablarejilla{...}` y `\ficha{...}`.

| | | Código |
|---|---|---|
| **Tabla (atajo)** | | |
| | | `\tabla{`\tablacab{A} & \tablacab{B} \\ 1 & 2 \\}` |
| | | `\tabla[lcc]{...}` (para fijar las columnas) |
| **Tabla simple** | <img src="imagenes_explicativas/tablas/tabla-simple.png" width="420"> | |
| | | `\begin{tablaminimal}{lcc}
  \tablacab{Técnica} & \tablacab{Resolución} \\
  \midrule
  fMRI & Espacial alta \\
\end{tablaminimal}` |
| **Tabla con cabecera** | <img src="imagenes_explicativas/tablas/tabla-cabecera.png" width="420"> | |
| | | `\begin{tablacabecera}{ll}
  \rowcolor{primary}
  \tablacabb{Concepto} & \tablacabb{Definición} \\
  \midrule
  Marca & Lo que el consumidor recuerda \\
\end{tablacabecera}` |
| **Tabla con rejilla** | <img src="imagenes_explicativas/tablas/tabla-rejilla.png" width="420"> | |
| | | `\begin{tablacuadricula}{\|l\|c\|}
  \tablacab{Producto} & \tablacab{Precio} \\ \hline
  Manzana & 1,20€ \\ \hline
\end{tablacuadricula}` |
| **Ficha de clave** | <img src="imagenes_explicativas/tablas/ficha.png" width="420"> | |
| | | `\begin{fichaclave}{4cm}
  \fichaitem{Paleta}{Oceano}
  \fichaitem{Tema}{Introducción}
\end{fichaclave}` |
| **Sí y no** | <img src="imagenes_explicativas/tablas/si-no.png" width="420"> | |
| | | `\si\ \no` |

### 🖼️ Filas con foto

| | | Código |
|---|---|---|
| **Fila con foto** | <img src="imagenes_explicativas/filas/fila-foto.png" width="420"> | |
| | | `\filaimagen{0.32\linewidth}{ejemplo.png}{Texto a la derecha de la imagen.}` |
| **Fila con foto a la derecha** | <img src="imagenes_explicativas/filas/fila-foto-der.png" width="420"> | |
| | | `\filaimagender{0.32\linewidth}{ejemplo.png}{Texto a la izquierda de la imagen.}` |
| **Fila de dos textos** | <img src="imagenes_explicativas/filas/fila-textos.png" width="420"> | |
| | | `\filacontenido{0.4\linewidth}{Contenido de la izquierda.}{Contenido de la derecha.}` |

### 🖼️ Imagen suelta

```latex
\imagen{nube.png}                 <- ancho automatico (\linewidth)
\imagen[0.5\linewidth]{nube.png}  <- ancho a medida
```

**No hace falta la ruta**: `\imagen` busca el fichero por su nombre. Lo
busca primero tal cual (desde la carpeta donde compilas) y luego en la
carpeta **`imagenes_explicativas`** del proyecto y en el resto del
proyecto. Así que si la imagen está dentro de su tema, por ejemplo en
`apuntes/DIW/Tema 1/Tema1.1/imagenes/nube.png`, con `\imagen{nube.png}`
ya sale.

| | | Código |
|---|---|---|
| **Imagen** | <img src="imagenes_explicativas/ejemplo/ejemplo.png" width="420"> | |
| | | `\imagen{ejemplo.png}` |

### ✨ Fondo y otros

| | | Código |
|---|---|---|
| **Emojis y símbolos** | <img src="imagenes_explicativas/fondo/emojis.png" width="420"> | |
| | | `\caja{🌐 Web  📚 Apuntes  ✅ Hecho  ⚠️ Cuidado  ★ Destacado  ♥ Importante}` |
| **Fondo de página** | <img src="imagenes_explicativas/fondo/fondo.png" width="420"> | |
| | | `\usarfondo` |
| **Pie de página** | <img src="imagenes_explicativas/fondo/pie.png" width="420"> | |
| | | `\pagefoot{Apuntes -- Tema 01}` |

### 🧰 Utilidades

| | | Código |
|---|---|---|
| **Entrada de carpeta** | <img src="imagenes_explicativas/utilidades/inputcarpeta.png" width="420"> | |
| | | `\inputcarpeta{Tema2.1}` |
| **Enlazar un archivo** | <img src="imagenes_explicativas/utilidades/input.png" width="420"> | |
| | | `\input{temas/Tema2.1/1.1-apartado.tex}` |

Cada cosa va en **dos filas**: una con la captura de cómo se ve y la
siguiente con el código que copias. Las secciones son las mismas carpetas
en las que está divided la librería (`bibliotecas_latex/estilo/`).

%s

### 🎨 Los colores de cada bloque

- El **apartado** (y solo él) lleva el color **pleno** de su paleta.
- Las **cajas** (caja, nota, dato) y las **tarjetas** llevan un color
  **neutro**: nunca toman la paleta del título, para que no se confundan.
- El **`\resumen`** sí lleva el color pleno del apartado, con su sombra.

### 🖼️ Todos los códigos, de golpe

<img src="imagenes_explicativas/codigos/codigos-1.png" width="520">

## 📂 Cómo se ordenan tus apuntes

```
APUNTES_GITHUB/
  imagenes_explicativas/         <- SOLO imagenes de la libreria (capturas del README)
  bibliotecas_latex/             <- la libreria de estilos (esto SI se sube)
  apuntes/                       <- TUS apuntes: estan en el repo PRIVADO
                                    apuntes-privados (no se suben aqui)
    DIW/                         <- la asignatura (una carpeta por asignatura)
      Tema 2/                    <- el tema
        tema2.tex                <- el documento que une TODOS sus apartados
        carga.tex                <- enlaza la libreria de bibliotecas_latex/
        Tema 2.1/                <- un apartado (una carpeta por apartado)
          2.1-apartado.tex       <- los apartados, numerados (2.1, 2.2...)
          2.2-apartado.tex
          imagenes/              <- LAS IMAGENES DE ESTE TEMA viven aqui
        Tema 2.2/                <- el siguiente apartado
          2.1-apartado.tex
          imagenes/
```

**Cada imagen vive dentro de su tema**, en una carpeta `imagenes/` junto a
los `.tex` de ese tema (por ejemplo
`apuntes/DIW/Tema 1/Tema1.1/imagenes/nube.png`), y se sube a Git con el
resto del tema. Con `\imagen{nube.png}` la encuentras igual, porque la
búsqueda la hace por nombre en todo el proyecto.

> 🔒 **Tus apuntes no están en este repo público**: viven en
> [`apuntes-privados`](https://github.com/nataliagamezbarea/apuntes-privados)
> (privado), con esta misma estructura. Aquí solo está la librería.

`imagenes_explicativas/` es solo de la **librería**: las capturas del
README, las paletas y los generadores. Ahí no se meten imágenes tuyas.

La numeración es la académica: **TEMA 2 → TEMA 2.1 → apartado 1.1**, y el
número va en el nombre del archivo. Si un apartado tiene varias partes, se
puede partir en `1.1.1`, `1.1.2`… (cada uno en su propio archivo).

Para unir los apartados de un tema no hace falta escribir un `\input` por
cada archivo: **`\inputcarpeta`** mete todos los `.tex` de una carpeta (y de
sus subcarpetas) en orden:

```latex
\inputcarpeta{{Tema2.1}}      % mete 1.1, 1.2... de golpe
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
```

## 🧩 La librería de estilos, dividida

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
solo hace `\input{{carga.tex}}` (la copia local) o enlaza la cabecera
descargada.

El catálogo completo está en
[`plantilla_apuntes.tex`](plantilla_apuntes.tex) (compílalo para verlo todo)
y las capturas se generan con
[`imagenes_explicativas/generadores/capturas.tex`](imagenes_explicativas/generadores/capturas.tex).
