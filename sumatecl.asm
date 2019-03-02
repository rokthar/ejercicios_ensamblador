section .data
	msj1 db 'ingrese #1', 0xA
	msj2 db 'ingrese #2', 0xA
	msj3 db 'resultado', 0xA
	len1 equ $ - msj1
	len2 equ $ - msj2
	len3 equ $ - msj3
	
section .bss
	n1 RESB 2
	n2 RESB	2
	r RESB	2

section .text
	global _start
 
_start:
	;imprimir msj1
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h

	; leer #1
	mov eax, 3
	mov ebx, 2
	mov ecx, n1
	mov edx, 5
	int 80h

	;imprimir msj2
	mov eax, 4 ;funcion	
	mov ebx, 1	  ; parametro
	mov ecx, msj2	 ; variable		
	mov edx, len2     ;tamaño
	int 80h

	; leer #2
	mov eax, 3
	mov ebx, 2
	mov ecx, n2
	mov edx, 2
	int 80h

	;suma
	mov eax, [n1]
	sub eax, '0' ;transformade cadena a digito
	mov ebx, [n2]		
	sub ebx, '0'
	
	add eax, ebx
	add eax, '0'
	mov [r], eax
	
	;imprime mensjae resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h

	;imprime resutlado r
	mov eax, 4
	mov ebx, 1
	mov ecx, r
	mov edx, 1
	int 80h
	
	; salir
	mov eax, 1
	mov ebx, 1
	int 80h
