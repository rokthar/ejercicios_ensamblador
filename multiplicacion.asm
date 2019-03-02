section .data
	multi db 'la multi de 4*2 es:',0xA,0xD
	tamano equ $-multi
section .bss
	resultado resb 1
section .text
	global _start

_start:
	; *********** mostrar menaje *********
	mov eax, 4
	mov ebx, 1
	mov ecx, multi
	mov edx, tamano
	int 80h

	; *********** proceso multi *********
	mov eax, 2
	mov ebx, 4	
	mul ebx ; en eax se almacena el valor de 7
	add eax,'0'  ; significa que es un concatenador de cadenas
	mov [resultado], eax ; se mueve el valor de eax a la direccion especifica de resultado

	; *********** imprimir resultado*********
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h

	; ***********  salir *********
	mov eax, 1
	int 80h
