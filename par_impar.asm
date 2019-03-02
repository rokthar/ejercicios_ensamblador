section .data
msj1 db 'ingrese #1', 0xA
len1 equ $ - msj1

par db'numero par',0xA
len2 equ $ -par 

impar db 'numero impar',0xA
len3 equ $ -impar

section .bss
n1 RESB 2
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


;ver

	mov eax, [n1]
	and eax, 1
	jz mensaje_par
	mov eax, 4
	mov ebx, 1
	mov ecx, impar
	mov edx, len3
	int 80h
	jmp salir

;mensaje par
mensaje_par: 
	mov eax, 4
	mov ebx, 1
	mov ecx, par
	mov edx, len2
	int 80h
	jmp salir

; salir
salir:
	mov eax, 1
	mov ebx, 1
	int 80h

