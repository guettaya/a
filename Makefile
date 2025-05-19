all: main1

main1: main1.c factorial.o iseven.o gcd.o
	gcc -o main1 main1.c factorial.o iseven.o gcd.o

factorial.o: factorial.asm
	nasm -f elf64 factorial.asm

iseven.o: iseven.asm
	nasm -f elf64 iseven.asm

gcd.o: gcd.asm
	nasm -f elf64 gcd.asm

clean:
	rm -f *.o main1
