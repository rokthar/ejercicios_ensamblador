section .data
	msj1 db 'ingrese #1', 0xA
	len1 equ $ - msj1

	msj2 db 'ingrese #2', 0xA
	len2 equ $ - msj2

	msj3 db 'ingrese #3', 0xA
	len3 equ $ - msj3

	msj4 db'resultado',0xA
	len4 equ $ -msj4 
section .bss
	n1 RESB 2
	n2 RESB	2
	n3 RESB	2
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
	mov ecx, n3
	mov edx, 5
	int 80h
	jmp comparacion


comparacion:
	mov eax, [n1]
	sub eax, '0' ;transformade cadena a digito
	mov ebx, [n2]		
	sub ebx, '0'
	mov ecx, [n3]
	sub ecx, '0'
	cmp ax, bx
	jle suma
	jmp resta

suma:
	add eax, ebx
	;add eax, '0'
	add eax, ecx
	add eax, '0'
	mov [r], eax
	
	;imprime mensjae resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h

	;imprime resutlado r
	mov eax, 4
	mov ebx, 1
	mov ecx, r
	mov edx, 1
	int 80h
	jmp salir
resta:

	sub eax, ebx 
	sub eax, ecx
	add eax,'0'  
	mov [r], eax 

	;imprime mensjae resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h
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
