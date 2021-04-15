segment .data
numero1 dw 0        ;declaro una variable de 16 bits, inicializada en 0
numero2 dw 0
segment .bss
;valor1  resw 1    ;reservo un word, 2 bytes(16 bits).
;valor2  resw 1     
entrada2  resd 1 
segment .text
    global suma_binarios

suma_binarios:
    enter 0,0
    mov ax, [ebp + 12]     ;el segundo parametro es el primero que se guarda en la pila [ebp + 12], luego lo copio en el registro eax 
    mov [numero2], ax
    mov ax, [ebp + 8]      ;el primer parametro [ebp + 8]
    add ax, [numero2]        ;realizo la suma y el resultado lo guardo en eax.
    jc retornar1
    leave
    ret
retornar1:
    mov ax, 1
    leave
    ret

    
