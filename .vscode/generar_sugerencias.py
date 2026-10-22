#!/usr/bin/env python3
# =====================================================================
#  GENERAR_SUGERENCIAS.PY
#
#  Lee la libreria (bibliotecas_latex/) y escribe la lista de comandos
#  que LaTeX Workshop ofrece como sugerencias al escribir.
#
#  LaTeX Workshop solo conoce los comandos de LaTeX "de serie" y los que
#  encuentra en los ficheros .tex que parsea del proyecto.  La libreria
#  se carga desde /tmp (carga.tex la descarga), asi que no la parsea y
#  sus comandos no salen en las sugerencias.
#
#  La solucion: el setting "latex-workshop.intellisense.command.user",
#  que esta genero con los comandos de la libreria.
#
#  uso:  python3 .vscode/generar_sugerencias.py
# =====================================================================
import json
import os
import re
import sys

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LIBRERIA = os.path.join(RAIZ, 'bibliotecas_latex')
AJUSTES = os.path.join(RAIZ, '.vscode', 'settings.json')

# Comandos que son internos de la libreria: no se ofrecen.
OCULTOS = re.compile(r'^(l__|apuntes|imagen|imagentmp|imagenruta|imagenfichero|'
                     r'imagenjobesc|imagentmpdir|imagentmpfile|buscarimagen|'
                     r'meterimagen|negrita|itemsnuevos|itemvacio|itemnulo|'
                     r'itembullet|itemcheck|itemstep|itemsdospuntos|barrule|'
                     r'sectionheader|barleftlen|bartextlen|barrightlen|'
                     r'pagebackground|imagenvacio|SI|NO)')

# \newcommand{\nombre}[n][opcional]{...}
RE_NEWCOMMAND = re.compile(
    r'\\newcommand\s*\*?\s*\{\s*\\([a-zA-Z@]+)\s*\}\s*(?:\[\s*(\d+)\s*\])?',
    re.S)
# \DeclareRobustCommand{\nombre}[n]{...} / \NewDocumentCommand{\nombre}{...}
RE_ROBUST = re.compile(
    r'\\(?:DeclareRobustCommand|NewDocumentCommand|NewExpandableDocumentCommand)'
    r'\s*\{\s*\\([a-zA-Z@]+)\s*\}\s*(?:\[\s*(\d+)\s*\])?',
    re.S)


def comandos():
    """Devuelve {nombre: numero de argumentos} de toda la libreria."""
    encontrados = {}
    for raiz, _dirs, ficheros in os.walk(LIBRERIA):
        for nombre in ficheros:
            if not nombre.endswith('.tex'):
                continue
            with open(os.path.join(raiz, nombre), encoding='utf-8') as f:
                texto = f.read()
            for patron in (RE_NEWCOMMAND, RE_ROBUST):
                for m in patron.finditer(texto):
                    cmd = m.group(1)
                    if OCULTOS.match(cmd):
                        continue
                    nargs = int(m.group(2)) if m.group(2) else 0
                    # si ya aparece con mas argumentos, se queda el mayor
                    if cmd not in encontrados or nargs > encontrados[cmd]:
                        encontrados[cmd] = nargs
    return encontrados


def cuerpo(cmd, nargs):
    """El texto que se inserta al aceptar la sugerencia."""
    if nargs == 0:
        return '\\' + cmd
    if nargs == 1:
        return '\\%s{$1}' % cmd
    return '\\%s{%s}' % (cmd, ''.join('{$%d}' % (i + 1) for i in range(nargs)))


def main():
    encontrados = comandos()
    if not encontrados:
        print('No se ha encontrado ningun comando en', LIBRERIA)
        return 1

    comandos_usuario = {}
    for cmd, nargs in sorted(encontrados.items()):
        comandos_usuario['\\' + cmd] = cuerpo(cmd, nargs)

    bloque = ['  // Los comandos de la libreria, como sugerencias de LaTeX Workshop.\n',
              '  // Los genera .vscode/generar_sugerencias.py (no lo edites a mano).\n',
              '  "latex-workshop.intellisense.command.user": {\n']
    claves = list(comandos_usuario.items())
    for i, (clave, valor) in enumerate(claves):
        coma = '' if i == len(claves) - 1 else ','
        bloque.append('    %s: %s%s\n' % (json.dumps(clave), json.dumps(valor), coma))
    bloque.append('  }')
    texto_bloque = ''.join(bloque)

    if not os.path.exists(AJUSTES):
        with open(AJUSTES, 'w', encoding='utf-8') as f:
            f.write('{\n%s\n}\n' % texto_bloque)
        print('%d comandos anadidos.' % len(comandos_usuario))
        return 0

    with open(AJUSTES, encoding='utf-8') as f:
        texto = f.read()

    # Si ya esta el bloque, se sustituye entero (sin tocar el resto)
    clave = '"latex-workshop.intellisense.command.user"'
    inicio = texto.find(clave)
    if inicio >= 0:
        # buscar la llave que cierra el bloque
        i = texto.index('{', inicio)
        nivel = 0
        for j in range(i, len(texto)):
            if texto[j] == '{':
                nivel += 1
            elif texto[j] == '}':
                nivel -= 1
                if nivel == 0:
                    fin = j + 1
                    break
        else:
            fin = len(texto)
        # quitar la coma que hubiera justo despues
        if texto[fin:fin + 1] == ',':
            fin += 1
        texto = texto[:inicio] + texto_bloque + texto[fin:]
    else:
        # insertar antes de la ultima llave del fichero
        pos = texto.rstrip().rfind('}')
        texto = texto[:pos].rstrip().rstrip(',') + ',\n\n' + texto_bloque + '\n' + texto[pos:]

    with open(AJUSTES, 'w', encoding='utf-8') as f:
        f.write(texto)

    print('%d comandos de la libreria anadidos a las sugerencias.' % len(comandos_usuario))
    return 0


if __name__ == '__main__':
    sys.exit(main())
