section .data 
	msj1 db "el resultado en Al: ",0xA,0xD
	len1 equ $-msj1 
	
	msj2 db 0xA,"el resltado en Ax: ",0xA,0xD
	len2 equ $-msj2

section .bss
	resultado_Al resb 1 
	resultado_Ax resb 1
section .text
	global _start
_start:
	mov al, 2
	mov bl, 3
	
	mul bl   ;multiplcando al = al * bl
	add eax, '0' 
	mov[resultado_Al], al
	mov[resultado_Ax], ax
	
;****** mensaje msj1	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h

; ***** resltado de al
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_Al
	mov edx, 1
	int 80h 

	mov eax, 1
	int 80h
