segment .data
entrada1 dd 0
entrada2 dd 0
segment .bss 
segment .text

        extern imprimir_cadena, leer_entrada, imprimir_entero, salto_linea
        global resta_enteros
resta_enteros:
        enter 0,0 
        pusha
        pushf   
        
        mov eax, [ebp + 12]     ;el segundo parametro de la funcion es el primero que se guarda en la pila [ebp + 12], luego lo copio en el registro eax    
        mov [entrada2], eax     
        mov eax, [ebp + 8]      ;primer parametro de la funcion lo copio en eax
        sub eax, [entrada2]     ; resto el parametro 1 (copiado en eax) con el parametro 2 y lo guardo en eax
        call imprimir_entero
        call salto_linea
        
        popf
        popa
            
        leave
        ret