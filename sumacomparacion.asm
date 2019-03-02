segment .data 

   msg1 db "Primer número ", 0xA,0xD 
   len1 equ $- msg1 

   msg2 db "Segundo número", 0xA,0xD 
   len2 equ $- msg2 

   msg3 db "Tercer número", 0xA,0xD 
   len3 equ $- msg3

   msg db "Iguales"
   len equ $- msg
	SYS_EXIT  equ 1
	SYS_READ  equ 3
	SYS_WRITE equ 4
	STDIN     equ 0
	STDOUT    equ 1

segment .bss

   num1 resb 2 
   num2 resb 2 
   num3 resb 2 
   res resb 1    

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num3 
   mov edx, 2
   int 0x80        

   ; moving the first number to eax register and second number to ebx
   ; and subtracting ascii '0' to convert it into a decimal number
	
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'

   mov ecx, [num3]
   sub ecx, '0'

   add eax, ebx

   cmp eax,ecx
   jz imprimir
   jmp comprar2

comprar2:
   mov eax, [num1]
   sub eax, '0'
   add eax,ecx
   cmp eax,ebx
   jz imprimir

imprimir:
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg
   mov edx, len         
   int 0x80
   jmp salir

salir:
   mov eax, SYS_EXIT   
   int 0x80
