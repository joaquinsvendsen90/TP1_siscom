segment .data

numero1 dd 0    ;declaro una variable de 32 bits inicializada en 0
numero2 dd 0    ;declaro una variable de 32 bits inicializada en 0



;prompt1 db      "Ingrese una opcion: 1)- suma enteros, 2)- suma binarios, 3)- resta enteros, 4)- resta binarios: ", 0
;prompt2 db      "Ingrese el primer numero: ", 0
;prompt3 db      "Ingrese el segundo numero: ", 0
;prompt4 db      "El resultado de la suma es: ", 0
segment .bss

;entrada1  resd 1 ; la directiva RESD es para reservar espacio para palabras DW es decir 4bytes- 32bits,
;entrada2  resd 1 
segment .text

        extern imprimir_cadena, leer_entrada, imprimir_entero, salto_linea
        global  menu, suma_enteros

suma_enteros:
        enter 0,0
        pusha           
        pushf
        
        mov eax, [ebp + 12]      ;el segundo parametro es el primero que se guarda en la pila [ebp + 12], luego lo copio en el registro eax
        mov [numero2], eax
        mov eax, [ebp + 8]      ;el primer parametro [ebp + 8]
        add eax, [numero2]      ;sumo el primer numero (guardado en eax) con el segundo numero y el resultado lo guardo en eax
        call imprimir_entero
        call salto_linea
        
        popf
        popa

        leave
        ret
