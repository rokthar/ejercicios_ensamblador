section .data 
	msj1 db "el resultado cociente: ",0xA,0xD
	len1 equ $-msj1 
	
	msj2 db 0xA,"el resltado residuo: ",0xA,0xD
	len2 equ $-msj2

section .bss
	resultado_Al resb 1 
	resultado_Ah resb 1
section .text
	global _start
_start:
	mov al, 9
	mov bl, 2
	
	div bl   ;dividiendo al = al / bl
	add eax, '0'
	add ah, '0' 
	mov[resultado_Al], al
	mov[resultado_Ah], ah
	
;****** mensaje msj1	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj1
	mov edx, len1
	int 80h

; ***** resltado de al
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_Ah
	mov edx, 1
	int 80h 

;****** mensaje msj2	
	mov eax, 4
	mov ebx, 1
	mov ecx, msj2
	mov edx, len2
	int 80h

; ***** resltado de ah
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_Ah
	mov edx, 1
	int 80h 



	mov eax, 1
	int 80h
