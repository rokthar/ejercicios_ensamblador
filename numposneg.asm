section .data
    msj1 db 'Es positivo', 0xA, 0xD
    len1 equ $-msj1
    msj2 db 'Es negativo',0xA, 0xD
    len2 equ $-msj2

section .text
    global _start
_start :
    mov eax,-4
    mov ebx,0
    cmp eax,ebx
    js negativo
    jmp positivo
positivo :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h
    jmp salir
negativo :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h
    jmp salir
salir :
    mov eax,1
    int 80h

