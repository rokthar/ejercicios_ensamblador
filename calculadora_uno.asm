section .data 
	msg1 db 10,'Calculadora básica',10
	lenTitulo equ $-msg1

	msg2 db 10,'INGRESE UNA OPCION',10
	len2 equ $-msg2

	msg3 db 10,'Resultado',10
	len3 equ $-msg3
	
	msg_num1 db 10,'Ingrese #1: ',10
	lenNum1 equ $-msg_num1
	msg_num2 db 10,'Ingrese #2: ',10
	lenNum2 equ $-msg_num2

	msgSuma db 10,'1. Suma: ',10
	lenSuma equ $-msgSuma
	msgResta db '2. Resta: ',10
	lenResta equ $-msgResta
	msgMult db '3. Multiplicacion: ',10
	lenMult equ $-msgMult
	msgDiv db '4. Division: ',10
	lenDiv equ $-msgDiv

	msjSalir db '5. Salir',10
	len_Salir equ $-msjSalir

section .bss
	n1 resb 2
	n2 resb 2
	resul resb 1
	opcion resb 2


section .text
	global _start
_start:
	mov eax ,4
	mov ebx ,2
	mov ecx ,msg1
	mov edx ,lenTitulo
	int 80h

	mov eax ,4
	mov ebx ,2
	mov ecx ,msg_num1
	mov edx ,lenNum1
	int 80h

	mov eax, 3
	mov ebx, 2
	mov ecx, n1
	mov edx, 2
	int 80h

	mov eax ,4
	mov ebx ,2
	mov ecx ,msg_num2
	mov edx ,lenNum2
	int 80h

	mov eax, 3
	mov ebx, 2
	mov ecx, n2
	mov edx, 2
	int 80h
	jmp menu

menu:
	
	
;----------MENU CALCULADORA
	
	mov eax ,4
	mov ebx ,2
	mov ecx ,msg2
	mov edx ,len2
	int 80h

	mov eax ,4
	mov ebx ,2
	mov ecx ,msgSuma
	mov edx ,lenSuma
	int 80h
	
	mov eax ,4
	mov ebx ,2
	mov ecx ,msgResta
	mov edx ,lenResta
	int 80h

	mov eax ,4
	mov ebx ,2
	mov ecx ,msgMult
	mov edx ,lenMult
	int 80h

	mov eax ,4
	mov ebx ,2
	mov ecx ,msgDiv
	mov edx ,lenDiv
	int 80h

	mov eax ,4
	mov ebx ,2
	mov ecx ,msjSalir
	mov edx ,len_Salir
	int 80h

	mov eax ,3
	mov ebx ,2
	mov ecx ,opcion
	mov edx ,2
	int 80h
	jmp operaciones

operaciones: 
	mov cl,[opcion]
	sub cl,'0'

	cmp cl,1
	jz Suma

	cmp cl,2
	jz Resta

	cmp cl,3
	jz Multiplicacion
	cmp cl,4

	jz Division
	jmp salir

Suma:
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	
	add eax,ebx
	add eax,'0'
	mov [resul],eax

	mov eax ,4
	mov ebx ,1
	mov ecx, msg3
	mov edx,len3
	int 80h

	mov eax,4
	mov ebx,2
	mov ecx,resul
	mov edx,1
	int 80h
	jmp menu

Resta:
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov [resul],eax

	mov eax ,4
	mov ebx ,1
	mov ecx, msg3
	mov edx,len3
	int 80h

	mov eax,4
	mov ebx,2
	mov ecx,resul
	mov edx,1
	int 80h
	jmp menu

Multiplicacion:
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	mul ebx
	add eax,'0'
	mov [resul],eax

	mov eax ,4
	mov ebx ,1
	mov ecx, msg3
	mov edx,len3
	int 80h

	mov eax,4
	mov ebx,2
	mov ecx,resul
	mov edx,1
	int 80h
	jmp menu
Division:
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	div bl
	add al,'0'
	mov [resul],al

	mov eax ,4
	mov ebx ,1
	mov ecx, msg3
	mov edx,len3
	int 80h

	mov eax,4
	mov ebx,2
	mov ecx,resul
	mov edx,1
	int 80h
	jmp menu

salir:
	mov eax,1
	int 80h
