%ifdef ELF_TYPE
  %define _scanf   scanf
  %define _printf  printf
  %define _getchar getchar
  %define _putchar putchar
%endif
segment .data

formato_string db "%s", 0
formato_entero db "%i", 0

segment .text
    global imprimir_cadena, leer_entrada, imprimir_entero, salto_linea
    extern _scanf, _printf, _getchar, _putchar

imprimir_cadena:

    enter 0,0   ;prologo. se guarda ebp en la pila, y se iguala ebp a esp , etc
    pusha       ;guardamos en la pila el estado actual de todos los registros del procesador

	pushf       ;guardamos el estado de los flags
    push eax
    push    dword formato_string
	call	_printf
	pop	ecx     ;saco los 2 parametros que puse en la pila antes del call
	pop	ecx

	popf        ;recupero el estado de los flags
	popa        ;recupero de la pila los registros del procesador que habia guardado anteriormente
	leave       ;epilogo
	ret         ;recupero la direccion de la instruccion que estabamos antes de entrar a esta funcion imprimir_cadena.
leer_entrada:

    enter	4,0		;hago espacio de 4 bytes, para variables locales
	pusha
	pushf

	lea	eax, [ebp-4]	;cargo la direccion efectiva en eax
	push	eax
	push	dword formato_entero
	call	_scanf
	pop	ecx
	pop	ecx
	
	popf
	popa
	mov	eax, [ebp-4]
	leave
	ret
imprimir_entero:

	enter	0,0
	pusha
	pushf

	push	eax
	push	dword formato_entero
	call	_printf
	pop	ecx
	pop	ecx

	popf
	popa
	leave
	ret
salto_linea:
	
	enter	0,0
	pusha
	pushf

	push	dword 10	; 10 == ASCII code for \n
	call	_putchar
	
	pop	ecx
	
	popf
	popa
	leave
	ret




