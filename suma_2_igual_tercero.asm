section .data
	msj1 db 'ingrese #1', 0xA
	len1 equ $ - msj1

	msj2 db 'ingrese #2', 0xA
	len2 equ $ - msj2

	msj3 db 'ingrese #3', 0xA
	len3 equ $ - msj3

	msj4 db'iguales',0xA
	len4 equ $ -msj4 

	msj5 db'no son iguales',0xA
	len5 equ $ -msj5
section .bss
	n1 RESB 2
	n2 RESB	2
	n3 RESB	2
	r  RESB 2

section .text
	global _start
_start:

;****** inicio ******
	jmp  imprimir_mensaje1
	
imprimir_mensaje1:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h
	jmp lectura1

lectura1:
	mov eax, 3
	mov ebx, 2
	mov ecx, n1
	mov edx, 2
	int 80h
	jmp imprimir_mensaje2

imprimir_mensaje2:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h
	jmp lectura2

lectura2:
	mov eax, 3
	mov ebx, 2
	mov ecx, n2
	mov edx, 2
	int 80h
	jmp imprimir_mensaje3
	

imprimir_mensaje3:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h
	jmp lectura3

lectura3:
	mov eax, 3
	mov ebx, 2
	mov ecx, n3
	mov edx, 2
	int 80h
	jmp sumaAB


sumaAB:
	mov al, [n1]
	mov bl, [n2]		
	mov cl, [n3]

	add al, bl
	sub al, '0'
	;add cl, '0'
	sub cl, '0'
	cmp al,cl
	jz iguales
	jmp noson

iguales:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h
	jmp salir
noson:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj5
	mov edx, len5
	int 80h
	jmp salir

;****** salir ******
salir:
	mov eax, 1
	mov ebx, 1
	int 80h
