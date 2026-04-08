; programa.asm — Laboratorio Post1 Unidad 4
; Propósito: demostrar directivas de sección, datos y constantes en NASM

CR          EQU 0Dh
LF          EQU 0Ah
TERMINADOR  EQU '$'
ITERACIONES EQU 5

segment data
    bienvenida  db "=== Laboratorio NASM - Unidad 4 ===", CR, LF, TERMINADOR
    separador   db "----------------------------------------", CR, LF, TERMINADOR
    etiqueta_a  db "Variable A (word): ", TERMINADOR
    fin_msg     db "Programa finalizado correctamente.", CR, LF, TERMINADOR
    var_byte    db 42
    var_word    dw 1234h
    var_dword   dd 0DEADBEEFh
    tabla_bytes db 10, 20, 30, 40, 50

segment bss
    buffer      resb 80
    resultado   resw 1

segment code
    global main

main:
    mov ax, data
    mov ds, ax

    mov ah, 09h
    mov dx, bienvenida
    int 21h

    mov dx, separador
    int 21h

    mov ah, 09h
    mov dx, etiqueta_a
    int 21h

    mov al, [var_byte]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 02h
    mov dl, CR
    int 21h
    mov dl, LF
    int 21h

    lea si, [tabla_bytes]
    mov cx, ITERACIONES

imprimir_tabla:
    mov al, [si]
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h

    mov ah, 02h
    mov dl, 20h
    int 21h

    inc si
    loop imprimir_tabla

    mov ah, 02h
    mov dl, CR
    int 21h
    mov dl, LF
    int 21h

    mov ah, 09h
    mov dx, fin_msg
    int 21h

    mov ax, 4C00h
    int 21h