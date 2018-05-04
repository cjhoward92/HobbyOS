vm: myos.iso
	./vm.sh

objects:
	mkdir objects
	mkdir bin

objects/boot.o: boot/boot.s objects
	x86_64-elf-as --32 boot/boot.s -o objects/boot.o

objects/kernel.o: boot/kernel.c
	x86_64-elf-gcc -m32 -c boot/kernel.c -o objects/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra -mno-red-zone

bin/myos.bin: objects/boot.o objects/kernel.o
	x86_64-elf-ld -m elf_i386 -T linker.ld -o bin/myos.bin -nostdlib objects/boot.o objects/kernel.o -L=~/opt/cross/lib/gcc

isodir-myos.bin: bin/myos.bin
	cp bin/myos.bin isodir/boot/myos.bin

myos.iso: bin/myos.bin isodir-myos.bin
	grub-file --is-x86-multiboot bin/myos.bin
	grub-mkrescue -o myos.iso isodir