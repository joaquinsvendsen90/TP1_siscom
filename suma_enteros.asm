segment .data

numero1 dd 0    ;declaro una variable de 32 bits inicializada en 0
numero2 dd 0    ;declaro una variable de 32 bits inicializada en 0

segment .bss

segment .text

        extern imprimir_cadena, leer_entrada, imprimir_entero, salto_linea
        global  menu, suma_enteros

suma_enteros:
        enter 0,0
        pusha           
        pushf

        mov eax, [ebp + 12]     ;el segundo parametro es el primero que se guarda en la pila [ebp + 12], luego lo copio en el registro eax
        mov [numero2], eax
        mov eax, [ebp + 8]      ;el primer parametro [ebp + 8]
        add eax, [numero2]      ;sumo el primer numero (guardado en eax) con el segundo numero y el resultado lo guardo en eax
        call imprimir_entero
        call salto_linea
        
        popf
        popa

        leave
        ret
