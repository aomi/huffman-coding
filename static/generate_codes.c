/**
 * A script to be run one-time in order to generate Huffman codes for all 128 Ascii characters.
 * The codes are based on the frequency of each Ascii character in the English language
 * from https://raw.githubusercontent.com/piersy/ascii-char-frequency-english/main/ascii_freq.txt
 **/

#include <stdio.h>
#include <stdlib.h>

void print_binary(unsigned n, int length) {
	unsigned i;
    for (i = 1 << (length - 2); i > 0; i = i / 2){
        (n & i) ? printf("1") : printf("0");
    }
    printf("\n");
}

int main(int argc,char **argv){
    char* f_name = "ascii_freq.txt";
    int number;
    FILE *fp = fopen(f_name, "r");

    while(fscanf(fp, "%d", &number) != EOF){
        printf("%c\n", number);
    }

    
}