#include <stdio.h>
#include <stdlib.h>

#define MAX 128

int size = 0;
struct Frequency {
   char  symbol;
   int   frequency;
};

struct Codes {
   char       symbol;
   unsigned   code;
   int        codeLength;
};

// void print_binary(int n, int length){
//     printf("%d = ", n);
//     while (n) {
//         if (n & 1)
//             printf("1");
//         else
//             printf("0");

//         n >>= 1;
//     }
//     printf("\n");
// }

void print_binary(unsigned n, int length) {
	unsigned i;
	for (i = 1 << (length - 2); i > 0; i = i / 2){
		(n & i) ? printf("1") : printf("0");
    }
    printf("\n");
}

void print_struct(struct Frequency frequency) {
    printf("Symbol: %c", frequency.symbol);
    printf(" | Frequency: %d\n", frequency.frequency);
}

void print_struct_codes(struct Codes code) {
    printf("Symbol: %c", code.symbol);
    printf(" | Code: ");
    print_binary(code.code, code.codeLength);
}

int find_symbol_index(struct Frequency* frequencies, char symbol) {
    for(int i = 0; i < size; i ++){
        if(frequencies[i].symbol == symbol) {
            return i;
        }
    }

    return -1;
}

// read through the file building <char,char count> map
void get_frequencies(char* f_name, struct Frequency* frequencies) {
    FILE *fp = fopen(f_name, "rb");

    char c = fgetc(fp);
    int j = 0;
    while (!feof(fp)) {
        int i = find_symbol_index(frequencies, c);
        if(i == -1) {
            frequencies[j].symbol = c;
            frequencies[j].frequency = 1;
            j++;
            size++;
        } else {
            struct Frequency curr_freq = frequencies[i];
            int prev_freq = curr_freq.frequency;
            prev_freq++;
            frequencies[i].frequency = prev_freq++;
            print_struct(frequencies[i]);
        }
        c = fgetc(fp);
    }

    fclose(fp);

    frequencies[j + 1].symbol = 26;
    frequencies[j + 1].frequency = 1;
}

// Finds the minimum code length for the algorithm
// ... ? idk what it does
// assume minimum code length is always 2
int minimum_code_length(int* frequencies){
    return 2;
}

int next_maximum_frequency(int* frequencies, int prev_freq, int prev_freq_index) {
    int max = 0;
    for(int i = 0; i < MAX; i++) {
        if(frequencies[i] > max && frequencies[i]) {
            max = frequencies[i];
        }
    }

    return max;
}
int code_length_change(int codeLength,int counter){
    int newCodeLength = 2;
    if(counter >= 2 && counter < 6){
        newCodeLength = 3;
    }else if( counter >= 6 && counter < 14){
        newCodeLength = 4;
    }else if( counter >= 14 && counter < 30){
        newCodeLength = 5;
    }else if( counter >= 30 && counter < 64){
        newCodeLength = 6;
    }else if( counter >= 64 && counter < 126){
        newCodeLength = 7;
    }else if( counter >= 126){
        newCodeLength = 8;
    }
    if(newCodeLength == codeLength){
        return 1;
    }else{
        return 0;
    }
}
// Input: A list of symbolss sorted by their frequencies (descending)
void treeless_huffman(struct Frequency* frequencies){
    //assuming min code_length is 2
    int codeLength = 2;
    int code = 0;

    struct Codes codes[size];

    int counter = 0;
    int prev_freq = 0;
    int prev_freq_index= 0;
    int max_index = size - 1;
    while (counter < size) {
        char symbol = frequencies[max_index].symbol;
        if(code_length_change(codeLength, counter) == 1){
            codeLength++;
            code = code << 1;
        }
        codes[counter].code = code;
        codes[counter].symbol = symbol;
        codes[counter].codeLength = codeLength;
        print_struct_codes(codes[counter]);
        counter++;
        code = code + 1;
        max_index--;
    }
}

// From: https://github.com/aryanmid123/c-sorting-algorithms/blob/master/algorithms/bubble_sort.h
void bubble_sort(struct Frequency *frequencies) {
  struct Frequency temp;
  int i = 0;
  int j;

  while (i < size) {
    j = 0;
    while (j < i) {
    printf("%d, %d\n", frequencies[j].frequency, frequencies[i].frequency);
      if (frequencies[j].frequency > frequencies[i].frequency) {
        temp = frequencies[j];
        frequencies[j] = frequencies[i];
        frequencies[i] = temp;
      }
      j++;
    }
    i++;
  }
}

int main(int argc,char **argv){
    if (argc != 2) {
        printf("Invalid input\n");
        return 0;
    }

    char* f_name = argv[1];
    struct Frequency frequencies[MAX];

    get_frequencies(f_name, frequencies);
    printf("--------------------------\n");
    printf("Found frequencies:\n");
    printf("--------------------------\n");
    for(int i = 0; i < size; i++) {
        print_struct(frequencies[i]);
    }

    bubble_sort(frequencies);   

    printf("--------------------------\n");
    printf("Size:\n");
    printf("--------------------------\n");
    printf("%d\n", size);

    printf("--------------------------\n");
    printf("Sorted frequencies:\n");
    printf("--------------------------\n");
    for(int i = 0; i < size; i++) {
        print_struct(frequencies[i]);
    }

    printf("--------------------------\n");
    printf("Codes:\n");
    printf("--------------------------\n");
    treeless_huffman(frequencies);
    return 0;
}