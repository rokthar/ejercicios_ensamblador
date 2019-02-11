section .data
    msj1 db 'El mayor',0xA,0xD
    len1 equ $-msj1
    msj2 db 'El menor',0xA,0xD
    len2 equ $-msj2
section .bss
    n1 resb 1
    n2 resb 1
    n3 resb 1
section .text
    global _start
_start:
    mov eax,2
    add eax,'0'
    mov [n1],eax

    mov ebx,7
    add ebx,'0'
    mov [n2],ebx

    mov ecx,5
    add ecx,'0'
    mov [n3],ecx

    cmp eax,ebx
    jg mayoreax
    jmp mayorebx

mayoreax :
    cmp eax,ecx
    jg auneax
    jmp mayorecx
auneax :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n1
    mov edx,1
    int 80h

    mov ebx,[n2]
    sub ebx,'0'
    mov ecx,[n3]
    sub ecx,'0'
    cmp ebx,ecx
    jg menorecx
    jmp menorebx
mayorebx :
    cmp ebx, ecx
    jg aunebx
    jmp mayorecx
aunebx :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n2
    mov edx,1
    int 80h

    mov eax,[n1]
    sub eax,'0'
    mov ecx,[n3]
    sub ecx,'0'
    cmp eax,ecx
    jl menoreax
    jmp menorecx

mayorecx :
    mov eax,4
    mov ebx,1
    mov ecx,msj1
    mov edx,len1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n3
    mov edx,1
    int 80h

    mov eax,[n1]
    sub eax,'0'
    mov ebx,[n2]
    sub ebx,'0'
    cmp eax,ebx
    jl menoreax
    jmp menorebx

menoreax :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n1
    mov edx,1
    int 80h
    jmp salir

menorebx :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n2
    mov edx,1
    int 80h
    jmp salir

menorecx :
    mov eax,4
    mov ebx,1
    mov ecx,msj2
    mov edx,len2
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,n3
    mov edx,1
    int 80h
    jmp salir

salir :
    mov eax,1
    int 80h
