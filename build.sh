#!/bin/sh

echo "Compiling boot code...";
COMPILE="$(x86_64-elf-as boot.s -o boot.o)"
if [ -z "$COMPILE" ]; then
  echo "\nBoot compile successful";
else
  echo "\nBoot compile failed: ${COMPILE}";
  exit 1;
fi

echo "Compiling Kernel...";
COMPILE="$(x86_64-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra)"

if [ -z "$COMPILE" ]; then
  echo "\nKernel compile successful";
else
  echo "\nKernel compile failed";
  exit 1;
fi

echo "Linking Kernel...";
LFLGAS="-mno-red-zone"
CFLAGS="-ffreestanding -O2 -nostdlib"
LINKER="$(x86_64-elf-gcc ${LFLAGS} -T linker.ld -o myos.bin ${CFLAGS} boot.o kernel.o -lgcc)"

if [ -z "$LINKER" ]; then
  echo "\nKernel compile successful";
else
  echo "\nKernel compile failed";
  exit 1;
fi

if grub-file --is-x86-multiboot myos.bin; then
  echo multiboot confirmed;
else
  echo the file is not multiboot;
  exit 1;
fi