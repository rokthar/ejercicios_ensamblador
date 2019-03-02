section .data
	msg1 db 'se activo', 0xA, 0xD
	len1 equ $ -msg1
	msg2 db 'no se activo', 0xA, 0xD
	len2 equ $ -msh2

	n1 db '5'
	n2 db '5'

section .text
	global _start
_start:
 
	mov eax, 2
	mov ebx, 7
	cmp eax, ebx
	jp mensaje_0
	jmp mensaje_1


   mensaje_0:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 80h
	jmp salir
   mensaje_1:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 80h
	jmp salir
   salir:
	mov eax, 1
	int 0x80
