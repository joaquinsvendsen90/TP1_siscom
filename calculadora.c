
#include<stdio.h>

//prototipo de las funciones
int menu( void ) __attribute__((cdecl));
void suma_enteros( void ) __attribute__((cdecl));
void resta_enteros( void ) __attribute__((cdecl));

int main(){
    int opcion, sumaInt;
    opcion = menu();
    printf("La opcion seleccionada es: %d\n",opcion);
    switch (opcion)
    {
    case 1:
        suma_enteros();
        break;
    case 2:
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