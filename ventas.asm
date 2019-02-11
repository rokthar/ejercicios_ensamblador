section .data
    msj1 db 'Son iguales',0xA,0xD
    len1 equ $-msj1
    msj2 db 'No son iguales',0xA,0xD
    len2 equ $-msj2
section .bss
    n1 resb 1
    n2 resb 1
    n3 resb 1
section .text
    global _start
_start:
    mov eax,2
    mov ebx,2
    mov ecx,5
    add eax,ebx
    cmp eax,ecx
    jz iguales
    jmp desiguales

iguales :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h
    jmp salir
desiguales :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h
    jmp salir
salir :
    mov eax,1
    int 80h
