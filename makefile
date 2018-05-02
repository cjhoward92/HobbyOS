vm: myos.iso
	./vm.sh

boot.o: boot.s
	x86_64-elf-as --32 boot.s -o boot.o

kernel.o: kernel.c
	x86_64-elf-gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra -mno-red-zone

myos.bin: boot.o kernel.o
	x86_64-elf-ld -m elf_i386 -T linker.ld -o myos.bin -nostdlib boot.o kernel.o -L=~/opt/cross/lib/gcc

myos.iso: myos.bin
	grub-file --is-x86-multiboot myos.bin
	grub-mkrescue -o myos.iso isodir
	cp myos.bin ./isodir/boot/myos.bin