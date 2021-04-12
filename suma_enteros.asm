segment .data

prompt1 db      "Ingrese una opcion: 1)- suma enteros, 2)- suma binarios, 3)- resta enteros, 4)- resta binarios: ", 0
prompt2 db      "Ingrese el primer numero: ", 0
prompt3 db      "Ingrese el segundo numero: ", 0
prompt4 db      "El resultado de la suma es: ", 0
segment .bss

entrada1  resd 1 ; la directiva RESD es para reservar espacio para palabras DW es decir 4bytes- 32bits,
entrada2  resd 1 
segment .text

        extern imprimir_cadena, leer_entrada, imprimir_entero
        global  menu, suma_enteros

menu:

        enter 0,0
        pusha
        mov eax, prompt1
        call imprimir_cadena
        call leer_entrada
        leave
        ret
suma_enteros:
        enter 0,0
        pusha
        ;pushf
        mov eax, prompt2
        call imprimir_cadena
        call leer_entrada
        mov [entrada1], eax     ;el numero leido por teclado lo guardo en la variable entrada
        mov eax, prompt3
        call imprimir_cadena
        call leer_entrada
        mov [entrada2], eax
        mov eax, [entrada1]     ;lo que contiene la entrada1 (primer numero ingresado) lo copio en eax
        add eax, [entrada2]     ;sumo lo de entrada2 + lo que hay en eax y lo guardo en eax - EL RESULTADO DE LA SUMA.
        mov ebx, eax            ;copio el valor de eax (resultado de la suma) a ebx, para poder usar eax para otra cosa ahora
        mov eax, prompt4
        call imprimir_cadena
        mov eax, ebx            ;vuelvo a mover a eax el resultado de la suma, asi lo puedo imprimir
        call imprimir_entero
        popa
        ;popf
        leave
        ret
