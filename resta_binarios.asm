segment .data
numero1 dw 0        ;declaro una variable de 16 bits, inicializada en 0
numero2 dd 0

;cadena  db "OVERFLOW", 0
segment .bss
entrada2  resd 1 
segment .text
    extern imprimir_cadena, salto_linea
    global resta_binarios

resta_binarios:
    
    enter 0,0
    
    mov eax, [ebp + 12]     ;el segundo parametro es el primero que se guarda en la pila [ebp + 12], luego lo copio en el registro ax (de 16 bits) 
    mov [numero2], eax
    mov eax, [ebp + 8]      ;el primer parametro [ebp + 8] lo copio al registro ax
    sub eax, [numero2]      ;realizo la resta y el resultado lo guardo en ax.
    
    ;jc contiene_cf         ;si el resultado de la resta es mayor a 16 bits, me va a dar carry, y si me da carry, saldo a la etiqueta excedente

    leave
    ret

;contiene_cf:
    ;pusha
    ;pushf

    ;mov eax, cadena
    ;call imprimir_cadena
    ;call salto_linea

    ;popf
    ;pusha

    ;leave

    ;mov eax, 1                ;con la int 0x80 se le notifica al nucleo que queremos hacer una llamada al sistema
    ;mov ebx, 0                ;un valor de 1 en eax, quiere decir que queremos hacer una llamada de exit().
    ;int 0x80                  ;ya que si tenemos overflow en el resultado de la suma, queremos terminar el programa.
