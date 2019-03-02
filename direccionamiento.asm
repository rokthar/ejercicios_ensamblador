section .data
	msj db 'Rene',0xA,0xD
	len equ $ - msj

section .text
	global _start

_start:
	;escritura del nombre
	mov eax,4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80h

	mov [msj], dword 'ener' ;para cambiar valor y especifica para cambiar
	
	;escritura del nombre cambiado
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80h

	mov eax,1
	int 80h
