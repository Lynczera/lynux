CC = i686-elf-gcc
AS = i686-elf-as

CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LFLAGS = -ffreestanding -O2 -nostdlib

 
LIBS = -lgcc

all: clean compile_boot compile_kernel link_kernel

compile_boot:
	$(AS) boot/boot.s -o boot.o

compile_kernel:
	$(CC) -c src/kernel.c -o kernel.o $(LIBS) $(CFLAGS)

link_kernel: compile_boot compile_kernel 
	$(CC) -T linker.ld -o myos $(LFLAGS) boot.o kernel.o $(LIBS)


clean:
	rm boot.o 
	rm kernel.o 
	rm myos 

