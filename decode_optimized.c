#include <stdio.h>
#include <time.h>
#include <stdlib.h>

struct symbol {
   char table_idx;
   char  symbol;
   char code_length;
};

void build_lut(struct symbol** restrict all_lut, FILE* restrict fp) {
	register char c = fgetc(fp);
	// Optimization: Remove global variable
	register char lut_count;
	lut_count ^= lut_count;
	register unsigned int code;
	register char len;
	register char temp_len;
	register char lut_idx;
	register char i;
	register int k;

	// Iterate through the first line character by character
	while(1) {
		// Construct a new entry for the LUT
		struct symbol new_entry;
		new_entry.symbol = c;

		code ^= code;
		len ^= len;

		// Iterate through the new entry's binary (comma separated)
		// Use while(1) so we can still read commas as a valid symbol
		c = fgetc(fp); // Optimization: Software pipelining
		while(1) {
			// Comma separated, break from the loop if at end of code
			if(c == ',' || c == '\n') {
				break;
			}
			// TODO: Is 32 max? this is a guess
			// Maximum code length is 32 bits.
			// If the current char is '1', c == '1' returns 1. Else returns 0, which is what we want.
			// Essentially this is converting our string code (i.e. "110") to an integer.
			code |= (c == '1') << (31 - len);
			len++;
			c = fgetc(fp);
		}

		temp_len = len;
		lut_idx ^= lut_idx;
		i ^= i;
		// Iterate through the code spliting it up into chunks of 8
		// Upsets appropriate look up table
		while(temp_len > 8) {
			// Shift the code so the only 8 bits we care about are present as the most significant bits
			unsigned int temp = code << (8 * i);
			// Shift so the 8 significant bits are the only bits
			unsigned char chunk = temp >> 24;

			struct symbol curr = all_lut[lut_idx][chunk];
			// If this chunk hasn't been initialized (doesn't point to another LUT)
			if(!curr.table_idx) {
				// Create a new LUT and point to it at this chunk of the current LUT
				lut_count++;
				struct symbol* new_lut = (struct symbol *)malloc(256 * sizeof(struct symbol));
				all_lut[lut_count] = new_lut;
				struct symbol pointer;
				pointer.table_idx = lut_count;
				pointer.code_length = 8;
				all_lut[lut_idx][chunk] = pointer;
			}
			// Head into the existing LUT
			lut_idx = all_lut[lut_idx][chunk].table_idx;
			// Head into the next LUT and shift over 8 bits
			temp_len -= 8;

			i++;
		}

		new_entry.code_length = temp_len;
		new_entry.table_idx = 0;

		// Once it comes to iteratively entering the symbol into the LUT we only care about the last 8 bits
		u_int8_t lower_bound = code >> (32 - (8 * (i + 1)));
    	u_int8_t upper_bound = lower_bound | (0b11111111 >> temp_len);

		// Enter into LUT.
		// i.e. for code "10", all values integers "0b10XXXXXX" should find this entry
		// That is why we need an upper and lower bound
		for (k = lower_bound; k <= upper_bound; k++){
			all_lut[lut_idx][k] = new_entry;
		}

		if(c == '\n') {
			break;
		}

		c = fgetc(fp);
	}

}

void decode(struct symbol** restrict all_lut, FILE* restrict fp){
	register int remaining_bits = 0;
	register int previous_chunk_size = 8; // default at 8
	register unsigned char chunk = 0;
	register struct symbol symbol;
	register unsigned char c;
	register int curr_lut = 0;
    while (!feof(fp)) {
		// Append a chunk from the current char from the file to our current chunk (starts as 0)
		chunk |= c >> (8 - previous_chunk_size);

		// If the chunk we just grabbed is bigger than what we have left
		if(previous_chunk_size > remaining_bits) {
			// Overflow from the last chunk
			previous_chunk_size -= remaining_bits;

			// Grab the next 8-bits in the file
			c = fgetc(fp);
			remaining_bits = 8;

			// Append the next n-bits onto our current chunk (n = difference left over from previous chunk)
			chunk |= c >> (8 - previous_chunk_size);
		}

		// Shift our pointer in the file by the previous chunk size
		c <<= previous_chunk_size;
        remaining_bits -= previous_chunk_size;

		// Find the current chunk in the look up table
		symbol = all_lut[curr_lut][chunk];
		if(!symbol.table_idx){
			printf("%c", symbol.symbol);
			curr_lut ^= curr_lut;
		} else {
			curr_lut = symbol.table_idx;
		}

		previous_chunk_size = symbol.code_length;
		chunk <<= previous_chunk_size;
    }

	printf("\n");
}

int main(int argc,char **argv){
	int time = 0;
	clock_t t;
    int f;
    t = clock();

	if (argc > 3 || argc < 2) {
        printf("Invalid input\n");
        return 0;
    }
	if(argc == 3){
		time = 1;
	}
    char* f_input = argv[1];

	struct symbol* all_lut[10];

	struct symbol *lut = (struct symbol *)malloc(256 * sizeof(struct symbol));
	all_lut[0] = lut;

    FILE *fp = fopen(f_input, "rb");
	build_lut(all_lut, fp);
	decode(all_lut, fp);

    t = clock() - t;
	if(time){
		printf("No. of clicks %ld clicks (%f seconds).\n", t, ((float)t) / CLOCKS_PER_SEC);
	}
    return 0;
}
