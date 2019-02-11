section .bss
    num resb 1

section .text
    global _start

_start:
    mov al,3
    mov bl,2
    mul bl
    add eax,'0'
    mov [num],al
    
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,1
    int 80h
