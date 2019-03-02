section .data
	msj1 db 'ingrese Base', 0xA
	len1 equ $ - msj1

	msj2 db 'ingrese altura', 0xA
	len2 equ $ - msj2

	msj3 db'Cuadrado',0xA
	len3 equ $ -msj3 

	msj4 db'Rectangulo',0xA
	len4 equ $ -msj4 

	msj5 db'Resultado Perimetro',0xA
	len5 equ $ -msj5 

	msj6 db'Resultado Superficie',0xA
	len6 equ $ -msj6
	
section .bss
	n1 RESB 2
	n2 RESB	2
	
	r RESB	2
	r1 RESB	2

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
	
	cmp ax, bx
	jz iguales
	jmp noson

iguales:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	
	mov cl, 2
	mul cl
	add eax, '0' 
	mov[r], al
	int 80h
	
	;mostrar el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj5
	mov edx, len5
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, r
	mov edx, 1
	int 80h 

	;proceso superficie
	
	mov al, [n1]
	sub al, '0' ;transformade cadena a digito
	mov bl, [n2]		
	sub bl, '0'
	
	mul bl
	add eax, '0' 
	mov[r1], al
	int 80h
	
	;mostrar el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj6
	mov edx, len6
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, r1
	mov edx, 1
	int 80h 




	jmp salir
	
noson:
	;mostrar mensaje que es rectangulo
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h

	;operacion perimetro
	mov al, 4
	mov bl, [n1]		
	sub bl, '0'

	mul bl
	add eax, '0' 
	mov[r], al
	
	;mostrar el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj5
	mov edx, len5
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, r
	mov edx, 1
	int 80h 

	;operacion superficie
	mov al, [n1]
	sub al, '0'
	mov bl, [n1]		
	sub bl, '0'

	mul bl
	add eax, '0' 
	mov[r1], al

	;mostrar el resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj6
	mov edx, len6
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, r1
	mov edx, 1
	int 80h 

	jmp salir
	


;****** salir ******
salir:
	mov eax, 1
	mov ebx, 1
	int 80h
