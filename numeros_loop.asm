section .data
	asterisco db '*'
	len equ $ - asterisco

	nueva_linea db 10,''

section .bss
	resultado resb 5

section .text
	global _start

_start:
	mov ecx, 20
	mov ebx, 1

l1:
	push ecx	
	mov ecx, ebx
	push ecx
	
	call imprimir_enter
	
	pop ecx
	mov ebx, ecx
	push ebx
	
l2:
	push ecx
	add ecx, '0'
	mov[resultado],  ecx
	sub ecx, '0'
	call imprimir_asterisco
	pop ecx
	loop l2
	
	;*********************************************l1
	pop ebx
	pop ecx
	inc ebx
	loop l1		;en este instante se decrementa cx en 1
	
	mov eax, 1
	int 80h
	
imprimir_asterisco:
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 5
	int 80h
	ret	
	
imprimir_enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea
	mov edx, 1
	int 80h
	ret	; retornar al ultimo punto










	

