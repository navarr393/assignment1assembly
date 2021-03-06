#!/bin/bash

#Program: Floating IO
#Author: F. Holliday

#Delete some un-needed files
rm *.o
rm *.out

echo "Assemble float-input-output.asm"
nasm -f elf64 -l perimeter.lis -o perimeter.o perimeter.asm

echo "Compile manage-floats.c using the gcc compiler standard 2011"
gcc -c -Wall -m64 -no-pie -o rectangle.o rectangle.c -std=c11

echo "Link the object files using the gcc linker standard 2011"
gcc -m64 -no-pie -o executable.out rectangle.o perimeter.o -std=c11

echo "Run the program Floating IO:"
./executable.out

echo "The script file will terminate"