segment .data
numero1 dw 0        ;declaro una variable de 16 bits, inicializada en 0
numero2 dd 0

segment .bss
entrada2  resd 1 
segment .text
    extern imprimir_cadena, salto_linea
    global suma_binarios

suma_binarios:
    
    enter 0,0
    
    mov eax, [ebp + 12]     ;el segundo parametro es el primero que se guarda en la pila [ebp + 12], luego lo copio en el registro ax (de 16 bits) 
    mov [numero2], eax
    mov eax, [ebp + 8]      ;el primer parametro [ebp + 8] lo copio al registro ax
    add eax, [numero2]      ;realizo la suma y el resultado lo guardo en ax.
    
    leave
    ret


