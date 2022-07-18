#include <stdio.h>
#include <stdlib.h>

#define MAX 128

int size = 0;
int distribution = 0;

struct Frequency {
   char  symbol;
   int   frequency;
};

struct Code {
   char       symbol;
   unsigned   code;
   int        codeLength;
};

// ------------ DEBUG METHODS ------------
void print_binary(unsigned n, int length) {
	unsigned i;
    if(distribution !=3){
	    for (i = 1 << (length - 2); i > 0; i = i / 2){
		    (n & i) ? printf("1") : printf("0");
        }
    }else if(distribution == 3){
        for (i = 1 << (length - 3); i > 0; i = i / 2){
		    (n & i) ? printf("1") : printf("0");
        }
    }
    printf("\n");
}

void print_struct(struct Frequency frequency) {
    printf("Symbol: %c", frequency.symbol);
    printf(" | Frequency: %d\n", frequency.frequency);
}

void print_struct_codes(struct Code code) {
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
// ------------ END DEBUG METHODS ------------

// ------------ HELPER METHODS ------------
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
        }
        c = fgetc(fp);
    }

    fclose(fp);

    frequencies[j + 1].symbol = 26;
    frequencies[j + 1].frequency = 1;
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

// From: https://github.com/aryanmid123/c-sorting-algorithms/blob/master/algorithms/bubble_sort.h
void bubble_sort(struct Frequency *frequencies) {
  struct Frequency temp;
  int i = 0;
  int j;

  while (i < size) {
    j = 0;
    while (j < i) {
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

int is_same_frequency(struct Frequency* frequencies) {
    int freq = 1;

    for(int i = 1; i < size; i++) {
        if(frequencies[i-1].frequency != frequencies[i].frequency) {
            freq = -1;
        }
    }

    if(freq == 1) {
        // 2 is code for same frequency
        return 2;
    }

    return -1;
}

int is_fib_frequency(struct Frequency* frequencies) {
    int freq = -1;
    for(int i = 2; i < size; i++) {
        if(frequencies[i-1].frequency + frequencies[i-2].frequency <= frequencies[i].frequency) {
            freq = 1;
        }else{
            freq = -1;
            break;
        }
    }

    if(freq == 1) {
        // 3 is code for fib frequency
        return 3;
    }

    return -1;
}

void find_what_distribution(struct Frequency *frequencies) {
  struct Frequency temp;
  int i = 0;

    // frequency is all same
  distribution = is_same_frequency(frequencies);
    if(distribution == -1) {
        // frequency distribution is finbonacci
        distribution = is_fib_frequency(frequencies);
        if(distribution == -1){
            // frequency distribution is all different
            // 1 is code for different frequency
            distribution = 1;
        }
    }
}
// ------------ END HELPER METHODS ------------

// Input: A list of symbolss sorted by their frequencies (descending)
void treeless_huffman(struct Frequency* frequencies){
    //assuming min code_length is 2
    int codeLength = 2;
    int code = 0;

    struct Code codes[size];

    int counter = 0;
    int prev_freq = 0;
    int prev_freq_index= 0;
    int max_index = size - 1;

    int distribution_3_counter = size-2;

    while (counter < size) {
        char symbol = frequencies[max_index].symbol;
        if(distribution != 3 && code_length_change(codeLength, counter) == 1){
            codeLength++;
            code = code << 1;
        } else if(distribution == 3 && distribution_3_counter > 0 ){
            // TODO: check if the frequency isnt same as previous one?? only then increase code length
            if(frequencies[distribution_3_counter+1].frequency != frequencies[distribution_3_counter].frequency){
                codeLength++;
                code = code << 1;
            }
            distribution_3_counter--;
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

    find_what_distribution(frequencies);

    printf("--------------------------\n");
    printf("Distribution:\n");
    printf("--------------------------\n");
    printf("%d\n", distribution);

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