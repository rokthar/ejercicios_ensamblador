section .bss       ;secion de declarar variables
num resb 1         ;creo una variable num con el tamaño de 1

section .text	   ;secion declarada
global _start      ;iniciar el programa

_start:            ;define el inicio del codigo
mov ecx,10         ;mueve el valor de 10 ecx
mov eax, '1'       ;nueve la cadena de '1' en el registro de eax

l1:  ;subproceso 
mov [num], eax     ;el valor que contiene num lo pasa a eax
mov eax, 4	   ;parametro para mostrar en pantalla
mov ebx, 1	   ;parametro para el tipo de presentacion
push ecx           ;se ingresa nueva valor a la pila

mov ecx, num	   ;num es el valor que se va a mostrar
mov edx, 1	   ; se declara el tamano de un bit
int 0x80	   ;interrupcion del codigo

mov eax, [num]	   ;el valor que contiene num es movido a eax
sub eax, '0'       ;transforma de cadena al digito entero
inc eax		   ;incrementa eax de uno en uno
add eax, '0'       ;convierte al digito de una cadena
pop ecx	 	   ;saca el valor ultimo de la pila y lo asigna en ecx
loop l1            ;llama la funcion l1 y decrementa de forma automatica ecx en uno

mov eax,1	   ;para salir del programa se reinicia el eax, 1 y se usa la interrupcion
int 0x80
