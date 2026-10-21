# ✏️ Apuntes en LaTeX

> Librería de estilos para apuntes: apartados, secciones, párrafos, cajas,
> tarjetas, viñetas, tablas y pies de página, todo con colores automáticos.
> Se **descarga de GitHub al compilar**, así que siempre tienes la última
> versión. Compila con **XeLaTeX** y `-shell-escape` (ya configurado en VS Code).

## 📋 Todos los bloques, con su imagen y su código

Cada opción va en **dos filas**: una con la captura de cómo se ve y la
siguiente con el código que copias.

| | | |
|---|---|---|
| **Apartado** | <img src="capturas/opcion-apartado.png" width="260"> | |
| | | `\titulo{ETIQUETA}{Título}` |
| **Sección** | <img src="capturas/opcion-seccion.png" width="260"> | |
| | | `\seccion{Título de sección}` |
| **Sección grande** | <img src="capturas/opcion-seccion-grande.png" width="260"> | |
| | | `\secciongrande{Título de sección}` |
| **Párrafo** | <img src="capturas/opcion-parrafo.png" width="260"> | |
| | | `\parrafo{Texto del párrafo con **negrita** y \hl{resaltado}.}` |
| **Resaltado** | <img src="capturas/opcion-resaltado.png" width="260"> | |
| | | `\hl{Texto resaltado}` |
| **Caja** | <img src="capturas/opcion-caja.png" width="260"> | |
| | | `\caja{**Idea clave:** caja de información.}` |
| **Dos cajas** | <img src="capturas/opcion-dos-cajas.png" width="260"> | |
| | | `\cajadual{Texto de la izquierda}{Texto de la derecha}` |
| **Nota** | <img src="capturas/opcion-nota.png" width="260"> | |
| | | `\nota{Para el examen}{Caja de nota con borde de color.}` |
| **Dato** | <img src="capturas/opcion-dato.png" width="260"> | |
| | | `\dato{2024}{Dato destacado}` |
| **Resumen** | <img src="capturas/opcion-resumen.png" width="260"> | |
| | | `\resumen{**Resumen:** la única caja con el color pleno del apartado.}` |
| **Píldora** | <img src="capturas/opcion-pildora.png" width="260"> | |
| | | `\pill{Etiqueta}` |
| **Tarjeta** | <img src="capturas/opcion-tarjeta.png" width="260"> | |
| | | `\definicion{Título de la tarjeta}{Texto de la tarjeta.}` |
| **Tarjeta compacta** | <img src="capturas/opcion-tarjeta-compacta.png" width="260"> | |
| | | `\definicionpar{Título de la tarjeta}{Texto de la tarjeta.}` |
| **Dos tarjetas en fila** | <img src="capturas/opcion-dos-tarjetas.png" width="260"> | |
| | | `\rectangulosdoble{Primera}{Texto de la primera.}{Segunda}{Texto de la segunda.}` |
| **Cuatro tarjetas en fila** | <img src="capturas/opcion-cuatro-tarjetas.png" width="260"> | |
| | | `\rectangulos{{Una}{Texto de la primera.}{Dos}{Texto de la segunda.}{Tres}{Texto de la tercera.}{Cuatro}{Texto de la cuarta.}}` |
| **Lista** | <img src="capturas/opcion-lista.png" width="260"> | |
| | | `\lista{**Negrita** en el item.\|Otro item.\|Un último item.}` |
| **Viñeta de rombo** | <img src="capturas/opcion-marcas.png" width="260"> | |
| | | `\marcas{Uno\|Dos\|Tres}` |
| **Casillas de tarea** | <img src="capturas/opcion-tareas.png" width="260"> | |
| | | `\tareas{Tarea 1.\|Tarea 2.}` |
| **Pasos numerados** | <img src="capturas/opcion-pasos.png" width="260"> | |
| | | `\pasos{Paso 1.\|Paso 2.\|Paso 3.}` |
| **Estrella** | <img src="capturas/opcion-estrellas.png" width="260"> | |
| | | `\estrellas{Idea clave para el examen}` |
| **Aviso** | <img src="capturas/opcion-alertas.png" width="260"> | |
| | | `\alertas{Cuidado con esto}` |
| **Pregunta** | <img src="capturas/opcion-preguntas.png" width="260"> | |
| | | `\preguntas{¿Una pregunta?}` |
| **Flechas** | <img src="capturas/opcion-flechas.png" width="260"> | |
| | | `\flechas{Flecha 1\|Flecha 2}` |
| **Tabla simple** | <img src="capturas/opcion-tabla-simple.png" width="260"> | |
| | | `\begin{tablaminimal}{lcc}
  \tablacab{Técnica} & \tablacab{Resolución} \\
  \midrule
  fMRI & Espacial alta \\
\end{tablaminimal}` |
| **Tabla con cabecera** | <img src="capturas/opcion-tabla-cabecera.png" width="260"> | |
| | | `\begin{tablacabecera}{ll}
  \rowcolor{primary}
  \tablacabb{Concepto} & \tablacabb{Definición} \\
  \midrule
  Marca & Lo que el consumidor recuerda \\
\end{tablacabecera}` |
| **Tabla con rejilla** | <img src="capturas/opcion-tabla-rejilla.png" width="260"> | |
| | | `\begin{tablacuadricula}{\|l\|c\|}
  \tablacab{Producto} & \tablacab{Precio} \\ \hline
  Manzana & 1,20€ \\ \hline
\end{tablacuadricula}` |
| **Ficha de clave** | <img src="capturas/opcion-ficha.png" width="260"> | |
| | | `\begin{fichaclave}{4cm}
  \fichaitem{Paleta}{Oceano}
  \fichaitem{Tema}{Introducción}
\end{fichaclave}` |
| **Sí y no** | <img src="capturas/opcion-si-no.png" width="260"> | |
| | | `\si\ \no` |
| **Fila con foto** | <img src="capturas/opcion-fila-foto.png" width="260"> | |
| | | `\filaimagen{0.32\linewidth}{imagenes/ejemplo.png}{Texto a la derecha de la imagen.}` |
| **Fila con foto a la derecha** | <img src="capturas/opcion-fila-foto-der.png" width="260"> | |
| | | `\filaimagender{0.32\linewidth}{imagenes/ejemplo.png}{Texto a la izquierda de la imagen.}` |
| **Fila de dos textos** | <img src="capturas/opcion-fila-textos.png" width="260"> | |
| | | `\filacontenido{0.4\linewidth}{Contenido de la izquierda.}{Contenido de la derecha.}` |
| **Emojis y símbolos** | <img src="capturas/opcion-emojis.png" width="260"> | |
| | | `\caja{🌐 Web  📚 Apuntes  ✅ Hecho  ⚠️ Cuidado  ★ Destacado  ♥ Importante}` |
| **Paleta** | <img src="capturas/opcion-paleta.png" width="260"> | |
| | | `\paletaRosa` |
| **Color forzado** | <img src="capturas/opcion-color-forzado.png" width="260"> | |
| | | `\colorapartado{azulA}` |
| **Fondo y pie** | <img src="capturas/opcion-fondo.png" width="260"> | |
| | | `\usarfondo  ·  \pagefoot{Apuntes -- Tema 01}` |

## 🏷️ Estilos de título (A-Q)

Los 17 estilos de título, uno en cada fila:

| | | |
|---|---|---|
| **Título A** | <img src="capturas/opcion-tituloA.png" width="260"> | |
| | | `\tituloA{Introducción al neuromarketing}{Estilo A: rotulador}` |
| **Título B** | <img src="capturas/opcion-tituloB.png" width="260"> | |
| | | `\tituloB{Introducción al neuromarketing}{Estilo B}` |
| **Título C** | <img src="capturas/opcion-tituloC.png" width="260"> | |
| | | `\tituloC{Estilo C: Brush}` |
| **Título D** | <img src="capturas/opcion-tituloD.png" width="260"> | |
| | | `\tituloD{Estilo D}` |
| **Título E** | <img src="capturas/opcion-tituloE.png" width="260"> | |
| | | `\tituloE{ETIQUETA}{Estilo E: etiqueta y título}` |
| **Título F** | <img src="capturas/opcion-tituloF.png" width="260"> | |
| | | `\tituloF{Estilo F}` |
| **Título G** | <img src="capturas/opcion-tituloG.png" width="260"> | |
| | | `\tituloG{Título}{Subtítulo del estilo G}` |
| **Título H** | <img src="capturas/opcion-tituloH.png" width="260"> | |
| | | `\tituloH{Estilo H}` |
| **Título I** | <img src="capturas/opcion-tituloI.png" width="260"> | |
| | | `\tituloI{Estilo I}` |
| **Título J** | <img src="capturas/opcion-tituloJ.png" width="260"> | |
| | | `\tituloJ{01}{Título con número grande}` |
| **Título K** | <img src="capturas/opcion-tituloK.png" width="260"> | |
| | | `\tituloK{Estilo K}` |
| **Título L** | <img src="capturas/opcion-tituloL.png" width="260"> | |
| | | `\tituloL{Estilo L}` |
| **Título M** | <img src="capturas/opcion-tituloM.png" width="260"> | |
| | | `\tituloM{Estilo M}` |
| **Título N** | <img src="capturas/opcion-tituloN.png" width="260"> | |
| | | `\tituloN{Estilo N}` |
| **Título O** | <img src="capturas/opcion-tituloO.png" width="260"> | |
| | | `\tituloO{ETIQUETA}{Estilo O}` |
| **Título P** | <img src="capturas/opcion-tituloP.png" width="260"> | |
| | | `\tituloP{Título}{Subtítulo del estilo P}` |
| **Título Q** | <img src="capturas/opcion-tituloQ.png" width="260"> | |
| | | `\tituloQ{Estilo Q}` |

### 🎨 Los colores de cada bloque

- El **apartado** (y solo él) lleva el color **pleno** de su paleta.
- Las **cajas** (caja, nota, dato) y las **tarjetas** llevan un color
  **neutro**: nunca toman la paleta del título, para que no se confundan.
- El **`\resumen`** sí lleva el color pleno del apartado, con su sombra.

Las 24 paletas: `paletaAmarillo` `paletaArena` `paletaAzul` `paletaBosque`
`paletaBurdeos` `paletaCafe` `paletaCeleste` `paletaCiruela` `paletaCoral`
`paletaFucsia` `paletaGris` `paletaLavanda` `paletaLila` `paletaLima`
`paletaMelocoton` `paletaMenta` `paletaNaranja` `paletaOceano` `paletaOliva`
`paletaRojo` `paletaRosa` `paletaTurquesa`.

### 🖼️ Todos los códigos, de golpe

<img src="capturas/codigos-1.png" width="520">

## 📂 Cómo se ordenan tus apuntes

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
puede partir en `1.1.1`, `1.1.2`… (cada uno en su propio archivo).

Para unir los apartados de un tema no hace falta escribir un `\input` por
cada archivo: **`\inputcarpeta`** mete todos los `.tex` de una carpeta (y de
sus subcarpetas) en orden:

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
solo hace `\input{carga.tex}` (la copia local) o enlaza la cabecera
descargada.

El catálogo completo está en
[`plantilla_apuntes.tex`](plantilla_apuntes.tex) (compílalo para verlo todo)
y las capturas se generan con [`capturas/capturas.tex`](capturas/capturas.tex).
