global _start

section .text

_start:
	mov eax,4
	mov ebx,1
	mov ecx,numero
	mov edx, tamano
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h

section .data
	numero: dw 85
	tamano: equ $-numero ;equi directiva para definir constante
	

