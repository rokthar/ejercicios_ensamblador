section .data
    msj1 db 'Se sumaran',0xA, 0xD
    len1 equ $-msj1
    msj2 db 'Se restaran',0xA, 0xD
    len2 equ $-msj2
section .bss
    num1 resb 1
    num2 resb 1
    num resb 1
section .text
    global _start
_start :
    mov eax,5
    ;sub eax,'0'
    mov [num1],eax
    mov ebx,4
    ;sub ebx,'0'
    mov [num2],ebx
    cmp eax,ebx
    jg restar
    jmp sumar

sumar :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h

    mov eax,[num1]
    mov ebx,[num2]
    add eax,ebx
    add eax,'0'
    mov [num],eax
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,1
    int 80h
    jmp salir
restar :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h

    mov eax,[num1]
    mov ebx,[num2]
    sub eax,ebx
    add eax,'0'
    mov [num],eax
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,1
    int 80h
    jmp salir
salir :
    mov eax,1
    int 80h