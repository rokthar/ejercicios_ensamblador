;section .data
;	mensaje db "hola", 0xA, 0xD
;	len equ $-mensaje

section .bss
	num resb 1

section .text
	global _start

_start :
	;mov ecx, 10 ;limite del loop --- generamente el loop trabaja con cx
	mov eax, '1'
	jmp imprimir

imprimir:
	mov [num], eax
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 80h
	;-----transformar el '1' a numero
	mov eax, [num]
	sub eax, '0' ;transformar una cadena a valor numerico
	inc eax
	add eax, '0';transformar valor numerico a cadena
	;dec ecx ;decremento cx
	cmp eax, '9'
	jz salir
	loop imprimir

salir:
	mov eax, 1
	int 80h