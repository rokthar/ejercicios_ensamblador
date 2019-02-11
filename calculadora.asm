section .data
    msgtitulo db 10,'Calculadora Básica',10
    lentitulo equ $-msgtitulo
    msgnum1 db 'Ingrese el #1',10
    lennum1 equ $-msgnum1
    msgnum2 db 'Ingrese el #2',10
    lennum2 equ $-msgnum2
    ;menu calculadora
    msgcalc db 'Ingrese 1 para la suma',10,'Ingrese 2 para la resta',10,'Ingrese 3 para la multiplucacion',10,'Ingrese 4 para la division',10,'Ingrese 5 para salir',10
    lencalc equ $-msgcalc
    msgop db 'Seleccione una opcion',10
    lenop equ $-msgop
    ;mesaje resutado
    msgresul db 'Su resutado es: '
    lenresul equ $-msgresul

section .bss
    n1 resb 2
    n2 resb 2
    resul resb 2
    op resb 2
section .text
    global _start

_start :
;----- mensaje principal -----
    mov eax,4
    mov ebx,1
    mov ecx,msgtitulo
    mov edx,lentitulo
    int 80h
    jmp numero1

numero1 :
;numero 1
;----- mensaje de ingreso de numero
    mov eax,4
    mov ebx,1
    mov ecx,msgnum1
    mov edx,lennum1
    int 80h
;----- segmento para almacenar el valor ingresado en la variable
    mov eax,3
    mov ebx,2
    mov ecx,n1
    mov edx,2
    int 80h
    jmp numero2

numero2 :
;----- mensaje de ingreso de numero
    mov eax,4
    mov ebx,1
    mov ecx,msgnum2
    mov edx,lennum2
    int 80h
;----- segmento para almacenar el valor ingresado en la variable
    mov eax,3
    mov ebx,2
    mov ecx,n2
    mov edx,2
    int 80h
    jmp calc

calc :
;presentar el menu de calculadora
    ;suma
    mov eax,4
    mov ebx,1
    mov ecx,msgcalc
    mov edx,lencalc
    int 80h
    jmp opcion

opcion :
;----- mensaje de ingreso de numero
    mov eax,4
    mov ebx,1
    mov ecx,msgop
    mov edx,lenop
    int 80h
;----- segmento para almacenar el valor ingresado en la variable
    mov eax,3
    mov ebx,2
    mov ecx,op
    mov edx,2
    int 80h
    ;comparaciones
    mov al,[op]
    sub al,'0'
    cmp al,1
    je suma
    cmp al,2
    jz resta
    cmp al,3
    jz multi
    cmp al,4
    jz divi
    jmp salir

suma :
    mov eax,[n1]
    sub eax,'0'
    mov ebx,[n2]
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [resul],eax
    ;mensae de resultado
    mov eax,4
    mov ebx,1
    mov ecx,msgresul
    mov edx,lenresul
    int 80h
    ;presentar suma
    mov eax,4
    mov ebx,1
    mov ecx,resul
    mov edx,1
    int 80h
    jmp salir 

resta :
    mov eax,[n1]
    sub eax,'0'
    mov ebx,[n2]
    sub ebx,'0'
    sub eax,ebx
    add eax,'0'
    mov [resul],eax
    ;mensae de resultado
    mov eax,4
    mov ebx,1
    mov ecx,msgresul
    mov edx,lenresul
    int 80h
    ;presentar suma
    mov eax,4
    mov ebx,1
    mov ecx,resul
    mov edx,1
    int 80h
    jmp salir 
multi :
    mov eax,[n1]
    sub eax,'0'
    mov ebx,[n2]
    sub ebx,'0'
    mul ebx
    add eax,'0'
    mov [resul],eax
    ;mensae de resultado
    mov eax,4
    mov ebx,1
    mov ecx,msgresul
    mov edx,lenresul
    int 80h
    ;presentar suma
    mov eax,4
    mov ebx,1
    mov ecx,resul
    mov edx,1
    int 80h
    jmp salir
divi :
    mov al,[n1]
    sub al,'0'
    mov bl,[n2]
    sub bl,'0'
    div bl
    add al,'0'
    mov [resul],al
    ;mensae de resultado
    mov eax,4
    mov ebx,1
    mov ecx,msgresul
    mov edx,lenresul
    int 80h
    ;presentar suma
    mov eax,4
    mov ebx,1
    mov ecx,resul
    mov edx,1
    int 80h
    jmp salir

salir :
    mov eax,1
    int 80h