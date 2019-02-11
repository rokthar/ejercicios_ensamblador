section .data
    msj1 db 'Es equilatero',0xA, 0xD
    len1 equ $-msj1
    msj2 db 'No es equilatero',0xA, 0xD
    len2 equ $-msj2
section .bss
section .text
    global _start
_start :
    mov eax,5
    mov ebx,5
    cmp eax,ebx
    jz iguales
    jmp diferentes
iguales :
    mov ebx,5
    cmp eax,ebx
    jz iguales2
    jmp diferentes
iguales2 :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h
    jmp salir
diferentes :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h
    jmp salir
salir :
    mov eax,1
    int 80h