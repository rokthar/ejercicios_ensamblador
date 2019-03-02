section .data
	msj1 db 'el valor es', 0xA
	len1 equ $ - msj1

section .bss
	valor RESB 2

section .text
	global _start
_start:
	;mov ecx, 10
	mov eax, '1'
	
	jmp numero

numero:
	mov [valor], eax
mov eax, 4
	mov ebx, 1
	mov ecx, valor
	mov edx, 1
	int 80h
	
	mov eax, [valor]
	sub eax, '0'
	inc eax
	add eax, '0'	
	;dec ecx
	cmp eax, '9'
	jz salir
	loop numero	
;****** salir ******
salir:
	mov eax, 1
	mov ebx, 1
	int 80h
