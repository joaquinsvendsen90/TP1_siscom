
DEP := calculadora.o suma_enteros.o resta_enteros.o suma_binarios.o resta_binarios.o funciones.o
AS := nasm
ASFLAGS := -f elf
BINARY := calc
C := gcc
LDFLAGS := -m32

calc: calculadora.o suma_enteros.o resta_enteros.o suma_binarios.o resta_binarios.o funciones.o 
	$(C) $(LDFLAGS) -o $(BINARY) $(DEP)

calculadora.o: calculadora.c 
	$(C) $(LDFLAGS) -c calculadora.c

suma_enteros.o:	suma_enteros.asm 
	$(AS) $(ASFLAGS) suma_enteros.asm

resta_enteros.o: resta_enteros.asm
	$(AS) $(ASFLAGS) resta_enteros.asm

suma_binarios.o: suma_binarios.asm 
	$(AS) $(ASFLAGS) suma_binarios.asm

resta_binarios.o: resta_binarios.asm 
	$(AS) $(ASFLAGS) resta_binarios.asm

funciones.o: funciones.asm 
	$(AS) $(ASFLAGS) -d ELF_TYPE funciones.asm

clean:
	rm -f $(BINARY) $(DEP)

