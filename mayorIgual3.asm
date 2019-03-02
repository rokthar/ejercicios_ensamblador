section .data
	msj db 'primer valor mayor', 0xA
	len equ $ - msj

	msj1 db 'segundo valor mayor', 0xA
	len1 equ $-msj1
	
	msj2 db 'tercer valor mayor', 0xA
	len2 equ $-msj2
	
	msj3 db 'son todos son iguals', 0xA
	len3 equ $-msj3

section .text
	global _start

_start:
	
	mov ax, 7
	mov bx, 7
	mov cx, 7
	jmp proceso

proceso:
	cmp ax, bx
	jg comparacionAx
   	jz iguales
	jmp comparacionBx

comparacionAx:
	cmp ax, cx
	jg mensaje
	jmp comparacionBx

comparacionBx:
	cmp bx, cx
	jg mensaje1
	jmp mensaje2

iguales:
	cmp ax, cx
	jg mensaje
	jmp mensaje3

mensaje:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80h
	jmp salir

mensaje1:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h
	jmp salir

mensaje2:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h
	jmp salir

mensaje3:
	mov eax, 4
	mov ebx, 1
	mov ecx, msj3
	mov edx, len3
	int 80h
	jmp salir

salir:
	mov eax, 1
	mov ebx, 1
	int 80h

	
