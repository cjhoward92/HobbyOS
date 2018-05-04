vm: myos.iso
	./vm.sh

boot.o: boot.s
	x86_64-elf-as --32 boot/boot.s -o bin/boot.o

kernel.o: kernel.c
	x86_64-elf-gcc -m32 -c boot/kernel.c -o bin/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra -mno-red-zone

myos.bin: boot.o kernel.o
	x86_64-elf-ld -m elf_i386 -T linker.ld -o bin/myos.bin -nostdlib boot.o kernel.o -L=~/opt/cross/lib/gcc

isodir-myos.bin: myos.bin
	cp bin/myos.bin isodir/boot/myos.bin

myos.iso: myos.bin isodir-myos.bin
	grub-file --is-x86-multiboot bin/myos.bin
	grub-mkrescue -o myos.iso isodir