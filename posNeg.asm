section .data
	msj_negativo db 'es negativo',0xA,0xD
	len_negativo equ $-msj_negativo

	msj_positivo db 'es positivo', 0xA
	len_positivo equ  $-msj_positivo

section .text
	global _start
_start:
 
	mov eax, 10
	mov bx, 10
	sub ax, bx
	js negativo  ;jump del signo
	jmp positivo


   negativo:
	mov eax, 4
	mov ebx, 2
	mov ecx, msj_negativo
	mov edx, len_negativo
	int 80h
	jmp salir
   positivo:
	mov eax, 4
	mov ebx, 2
	mov ecx, msj_positivo
	mov edx, len_positivo
	int 80h
	jmp salir
   salir:
	mov eax, 1
	int 0x80
