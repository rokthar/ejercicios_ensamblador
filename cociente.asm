section .data
    msj1 db 'No existe division para cero',0xA, 0xD
    len1 equ $-msj1
    msj2 db 'El cociente: ',0xA, 0xD
    len2 equ $-msj2 
section .bss
    num resb 1
section .text
    global _start
_start :
    mov al,5
    mov bl,2
    cmp bx,0
    jz cero
    jmp dividir

cero :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h
    jmp salir
dividir :
    div bl
    add bl,'0'
    mov [num],bl
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,1
    int 80h
    jmp salir
salir :
    mov eax,1
    int 80h