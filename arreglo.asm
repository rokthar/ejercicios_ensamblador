section .data
    msg1 db "Ingrese 5 numeros y presione enter",0xA
    len1 equ $-msg1
    arreglo db 0,0,0,0,0
    lenarray equ $-arreglo

section .bss
    n1 resb 2
    resp resb 2

section .text
    global _start

_start :
    ;se define el arreglo en los registros indices
    mov esi, arreglo ;indice fuente
    mov edi,0 ;indice destino

    ;impresion del primer mensaje
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    int 80h

leer:
    mov eax,3
    mov ebx,0
    mov ecx,n1
    mov edx,2
    int 80h

    ;movemos el dato ingresado a al
    mov al,[n1]
    sub al,'0'
    
    ;movemos el dato a la posicion del arreglo
    mov [esi], al
    ;incrementar en 1 las posiciones de fuente y destino
    add edi,1 ;es el contador del jmp
    add esi,1 ;es la posicion del arreglo
    ;comparamos la posicion para evitar salirnos del arreglo
    cmp edi,lenarray
    jb leer

    mov ecx,0

presentar_arreglo:
    push ecx 
    mov al,[arreglo+ecx]

    mov bl,[resp]
    add bl,al
    mov [resp],bl

    add al,'0'
    mov [n1],al
    sub al,'0'

    mov bl,[resp]
    add bl,'0'
    mov [resp],bl

    mov eax,4
    mov ebx,1
    mov ecx,n1
    mov edx,2
    int 80h

    pop ecx
    inc ecx
    cmp ecx,lenarray
    jb presentar_arreglo

salir:
    mov eax,1
    int 80h