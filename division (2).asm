section .data
	msj1 db 'ingrese #1', 0xA
	len1 equ $ - msj1

	msj2 db 'ingrese #2', 0xA
	len2 equ $ - msj2

	msj3 db'no divisible',0xA
	len3 equ $ -msj3 

	msj4 db'no',0xA
	len4 equ $ -msj4
	
section .bss
	n1 RESB 2
	n2 RESB	2
	
	r RESB	2

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
	mov ecx, n1
	mov edx, 5
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
	mov ecx, n2
	mov edx, 5
	int 80h
	jmp comparacion
	
comparacion:
	mov al, [n1]
	sub al, '0' ;transformade cadena a digito
	mov bl, [n2]		
	sub bl, '0'
	mov cx, 0
	cmp ax, bx
	jg mayorA
	jmp menorB

mayorA:
	cmp cx, bx
	jz iguales
	jmp noson

menorB:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h
	jmp salir


iguales:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h
	jmp salir

noson:
	DIV bl 
	add eax,'0' 
	add al, '0'
	mov [r], al 

; *********** imprimir resultado*********
	mov eax, 4
	mov ebx, 1
	mov ecx, r
	mov edx, 1
	int 80h
	jmp salir


;****** salir ******
salir:
	mov eax, 1
	mov ebx, 1
	int 80h
