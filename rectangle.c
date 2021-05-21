#include <stdio.h>
#include <stdint.h> //For C99 compatibility
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>   //For malloc
//At the time of this writing C99 is the newest available standard for C language.  Most modern C compilers conform to the C99 
//standard.  The GNU compiler, known as gcc, is C99 compliant.  If both languages, C and X86, are C99 compliant then object code 
//files from both compilers may be linked to form a single executable. 
//
//The standard prototypes for any functions that may be called later.  This main function calls exactly one function.
extern double rectangle();
//
int main(int argc, char* argv[])
{double answer = 0.0;
 printf("This program will compute the perimeter and the average side length of a rectangle.\n");
 answer = rectangle();
 printf("The main function received this number %lf and has decided to keep it.", answer);
 printf("A 0 will be returned to the operating system.\n");
 printf("Have a nice day.\n");
 return 0;
}