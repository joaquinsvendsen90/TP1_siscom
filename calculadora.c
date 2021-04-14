
#include<stdio.h>
#include<string.h>

//prototipo de las funciones
int menu( void ) __attribute__((cdecl));
void suma_enteros( void ) __attribute__((cdecl));
void resta_enteros( void ) __attribute__((cdecl));
int conversorBinarioDecimal( void );

#define BITS 16

int main(){
    
    int opcion, sumaInt, n1, n2;
    opcion = menu();
    printf("La opcion seleccionada es: %d\n",opcion);
    switch (opcion)
    {
    case 1:
        suma_enteros();
        break;
    case 2:
        printf("ingrese el primer numero binario (max 16 bits): ");
        n1 = conversorBinarioDecimal();
        printf("ingrese el segundo numero binario (max 16 bits): ");
        n2 = conversorBinarioDecimal();
        printf("los valores ingresados en su formato decimal son: %d %d\n", n1,n2);
        break;
    case 3:
        resta_enteros();
        break;
    case 4:
        break;
    default:
        break;
    }


}


int conversorBinarioDecimal(){
    
    char binario[BITS];           //cadena en la que se almacenara el numero binario ingresado
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
    scanf("%s",cadena);                 //toma el numero binario ingresado por teclado
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
        strcpy(cadena, &binarioNuevo);  //copio el numero rellenado en la cadena que se retornará
        return cadena;
    }
    else{               //si se ingreso un numero con sus 16 bits, se retorna.
        return cadena;  
    }

}