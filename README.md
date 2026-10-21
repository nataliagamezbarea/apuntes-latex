# Apuntes en LaTeX

Librería de estilos para apuntes: portada de apartado, secciones, cajas,
tarjetas, viñetas, tablas y pies de página, todo con colores automáticos.

La librería se **descarga de GitHub al compilar** (y se borra al terminar),
así que siempre tienes la última versión. Compila con **XeLaTeX** y
`-shell-escape` (ya configurado en VS Code con LaTeX Workshop).

## Estructura de tus apuntes

```
apuntes/
  <asignatura>/
    Temas.tex                    -> el documento: enlaza cada tema
    temas/
      TemaX.tex                  -> enlaza los apartados del tema
      TemaX/
        1.1-apartado.tex         -> el apartado (con su \secciongrande)
        1.1.1-subapartado.tex    -> el subapartado
        1.2-apartado.tex
        1.2.1-subapartado.tex
        imagenes/                -> las imágenes del tema
```

Los apartados y subapartados llevan la numeración académica (1.1, 1.1.1...)
en el nombre del archivo, y **todos van en la carpeta del tema**. Las
imágenes van en la carpeta `imagenes` de ese tema.

Los `Temas.tex` se enlazan entre si con `\input` y las rutas se escriben
**desde la raíz del documento** (la carpeta donde compilas).

En la carpeta `ejemplo/` tienes un ejemplo completo de esta estructura
con dos asignaturas, dos temas, apartados, subapartados e imágenes.

## Plantilla / catálogo

`plantilla_apuntes.tex` es el **catálogo completo** de la librería: cada
comando con su sintaxis y un ejemplo. Compílalo para ver todo lo que
puedes hacer (y copia lo que necesites).

## La librería de estilos, dividida

`bibliotecas_latex/estilo.tex` es solo el **cargador**: cada cosa está en
su propio archivo dentro de `bibliotecas_latex/estilo/`.

```
estilo/
  carga/     paquetes, fuentes, emojis
  paletas/   24 paletas (una por archivo)
  colores/   variables, paleta propia, pool de secciones, color actual
  titulos/   un archivo por estilo de título (A-Q) + titulo, seccion
  parrafos/  realce, resaltado, parrafo, resalta
  cajas/     un archivo por caja (caja, nota, dato, resumen...)
  tarjetas/  un archivo por tarjeta (typecard, definicion, rectangulos)
  vinetas/   un archivo por tipo de viñeta
  tablas/    un archivo por tipo de tabla
  filas/     un archivo por tipo de fila
  fondo/     fondo de página, usarfondo, pie
```

## Comandos que más se usan

| Comando | Qué hace |
|---|---|
| `\paletaOceano` | elige la paleta del documento (hay 24) |
| `\titulo{ETIQUETA}{Título}` | apartado; cambia el color de lo que viene debajo |
| `\seccion{Título}` / `\secciongrande{Título}` | sección |
| `\parrafo{texto}` | párrafo con franja de color; `**negrita**` automática |
| `\hl{texto}` | resaltado de rotulador |
| `\caja{texto}` | caja de información |
| `\nota{Título}{texto}` | nota con borde lateral |
| `\dato{Título}{texto}` | dato destacado |
| `\resumen{texto}` | caja resumen (la única con el color pleno) |
| `\definicion{Título}{texto}` | una tarjeta |
| `\rectangulosdoble{T1}{X1}{T2}{X2}` | dos tarjetas en fila, misma altura |
| `\rectangulos{{T1}{X1} {T2}{X2} {T3}{X3} {T4}{X4}}` | 2, 3, 4... tarjetas en fila |
| `\lista{a\|b\|c}` `\tareas{a\|b}` `\pasos{a\|b}` | listas (se separan con `\|`) |
| `\tablaminimal{ccc}` | tabla sin líneas verticales |
| `\pagefoot{texto}` | pie de página |

Los elementos de lista se separan con `|` y `**texto**` sale en negrita.

## Plantilla

`plantilla_apuntes.tex` es una plantilla lista para copiar: trae un ejemplo
de cada bloque.
