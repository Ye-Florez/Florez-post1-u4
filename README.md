# Florez-post1-u4

## Descripción
Laboratorio 1 de la Unidad 4: Primer programa NASM con segmentos y salida DOS.
Implementación de un programa en lenguaje ensamblador NASM para entorno DOS de 16 bits,
aplicando directivas de sección y datos, inicializando registros de segmento,
y utilizando interrupciones DOS (INT 21h) para producir salida en pantalla.

## Prerrequisitos
- DOSBox 0.74+
- NASM 3.01+
- ALINK (Win32 version)

## Compilación y ejecución
Desde CMD de Windows, dentro de la carpeta del proyecto:
nasm -f obj programa.asm -o programa.obj
alink programa.obj -oEXE -o programa.exe -entry main

Luego abrir DOSBox, montar la carpeta y ejecutar:
mount C C:\DOSWork\LAB4POS1
C:
programa.exe