section .data
	msj1 db 'ingrese #1', 0xA
	len1 equ $ - msj1

	msj2 db 'ingrese #2', 0xA
	len2 equ $ - msj2

	msj3 db 'ingrese #3', 0xA
	len3 equ $ - msj3

	msj db 10,'Aprobado',10,0
	len equ $- msj

	msj4 db 10,'Suspenso',10,0
	len4 equ $- msj4

	msj5 db 10,'Reprobado',10
	len5 equ $- msj5
	


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
	jmp proceso

proceso:
	mov al, [n1]
	sub al, '0'
	mov bl, [n2]
	sub al, '0'
	add al,bl
	add al, '0'
	mov [r], al
	jmp proceso2

proceso2:
	mov al, [r]
	sub al, '0'
	mov bl, [n3]
	sub al, '0'
	add al,bl
	add al, '0'
	mov [r], al
	jmp proceso3

proceso3:
	mov al, [r]
	sub al, '0'
	mov bl,3
	
	mov dx, 0
	mov ah, 0
	
	div bl
	add al ,'0'
	mov [r], al
	jmp proceso4

proceso4:
	mov al,[r]
	sub al,'0'
	
	cmp al,7
	jge mensaje1
	
	cmp al,5
	jge proceso5
	
	cmp al, 5
	jl mensaje3
	
proceso5:
	mov al, [r]
	sub al, '0'
	
	cmp al, 7
	jl mensaje2

mensaje1:
	mov eax, 4
	mov ebx,1
	mov ecx, msj
	mov edx, len
	int 80h
	jmp salir
	
mensaje2:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj4
	mov edx, len4
	int 80h
	jmp salir

mensaje3:
	mov eax, 4
	mov ebx,1
	mov ecx, msj5
	mov edx, len5
	int 80h
	jmp salir
	

;****** salir ******
salir:
	mov eax, 1
	mov ebx, 1
	int 80h
