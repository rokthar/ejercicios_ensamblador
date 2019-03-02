section .data
	mensaje db 'ingrese un numero',0xA,0xD ;decorador para enter
	tamano equ $-mensaje
	mostrar db 'El numero ingresado es ',0xA,0xD
	tamano_mostrar equ $-mostrar	

section .bss
	numero resb 5

section .text
	global _start


_start:
	; *********escritura********
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, tamano
	int 80h

	; *******lectura*****
	mov eax, 3  ; invoca la subrutina de la lectura
	mov ebx, 2
	mov ecx, numero
	mov edx, 5
	int 80h
	; *********escritura********
	mov eax, 4
	mov ebx, 1
	mov ecx, mostrar
	mov edx, tamano_mostrar
	int 80h
	; *********escritura********
	mov eax, 4
	mov ebx, 1
	mov ecx, numero
	mov edx, 5
	int 80h
		
	
	; *********** salida***********
	mov eax, 1
	int 80h

