#include<stdio.h>
#include<string.h>
#include <stdlib.h>

//prototipo de las funciones
int menu( void ) __attribute__((cdecl));
void suma_enteros( int,int ) __attribute__((cdecl));
void resta_enteros( void ) __attribute__((cdecl));
int suma_binarios( int,int ) __attribute__((cdecl));
int conversorBinarioDecimal( char * );
void lecturaNumero( char *);


#define BITS 16

int main(int argc, char *argv[]){
    
    if(argc!=5){
        printf("Para ejecutar la calculadora debe ingresar: %s <operacion> <operando1> <operador> <operando2>\n", argv[0]);
        exit(1);
    }

    //Operacion decimal
    if(strcmp(argv[1],"decimal") == 0){     
        int operando1 = atoi(argv[2]);      //convierto los operandos de a tipo entero
        int operando2 = atoi(argv[4]);
        if(strcmp(argv[3],"+") == 0){
            printf("los opernandos son: %d %d\n", operando1, operando2);
            suma_enteros(operando1, operando2);
        }
        else if(strcmp(argv[3],"-") == 0){
            //llamar a la funcion de resta de decimales
        }
        else{
            printf("Ingresaste un operador invalido para la operacion decimal. Los operadores validos son: + o -\n");
        }
    }

    //Operacion binaria
    else if(strcmp(argv[1],"binario") == 0){
        if((strlen(argv[2]) > 16) || (strlen(argv[4]) > 16)){               //si se introducio un numero mayor a 16 bits, termina el programa.
            printf("Debes introducir un binario de 16 bits como maximo!. ");
            exit(1);
        }
        int n1 = conversorBinarioDecimal(argv[2]);
        int n2 = conversorBinarioDecimal(argv[4]);
        if(strcmp(argv[3],"+") == 0){
            //llamar a la funcion de suma de binarios   
        }
        else if(strcmp(argv[3],"-") == 0){
            //llamar a la funcion de resta de binarios
        }
        else{
            printf("Ingresaste un operador invalido para la operacion binaria. Los operadores validos son: + o -\n");
        }

    }
}


int conversorBinarioDecimal(char *numerobin){
    
    char binario[BITS];           //cadena en la que se almacenara el numero binario ingresado
    strcpy(binario, numerobin);
    int decimal = 0, multiplicador = 1;
    lecturaNumero(binario);     //se llama a la funcion que procesa el binario ingresado
    printf("el numero binario es: %s\n",binario);

    //convertimos el valor binario a decimal
    for(int i=BITS-1; i>-1; i--){
        if(binario[i] == '1'){
            decimal += multiplicador;
        }
            multiplicador = multiplicador * 2;  //nos da el valor de cada potencia 2^0, 2^1, 2^2, etc. 
    }
    printf("El decimal de ese binario es: %d\n", decimal);
    return decimal;
}

void lecturaNumero(char *cadena){
    
    char binarioNuevo[BITS];            //cadena que va a tener el numero completo (se completa con 0) con 16 bits, en el caso que ingresemos menos cantidad de bits
    int tamInicial;
    int max = BITS - 1;
    tamInicial = strlen(cadena);        //variable que contiene la cantidad de elementos que tiene el numero ingresado por teclado

    if(tamInicial<BITS){                //si se ingreso un numero menor a 16 bits
        for(int i=tamInicial-1; i>-1; i--){
            binarioNuevo[max] = cadena[i];
            max--;
        }
        while(max>-1){                  //rellenamos con 0 a su izquierda hasta completar los 16 bits
            binarioNuevo[max] = '0';
            max--;
        }
        strcpy(cadena, binarioNuevo);  //copio el numero rellenado en la cadena que se retornará
    }
}