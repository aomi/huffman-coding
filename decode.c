#include <stdio.h>
#include <stdlib.h>

struct symbol {
   char  symbol;
   int code_length;
   int table_idx;
};

void print_symbol(struct symbol symbol) {
    printf("Symbol: %c", symbol.symbol);
    printf(" | Code Length: %d", symbol.code_length);
    printf(" | Table: %d\n", symbol.table_idx);
}

void print_bin(unsigned char value)
{
    for (int i = sizeof(char) * 7; i >= 0; i--)
        printf("%d", (value & (1 << i)) >> i );
    putc('\n', stdout);
}

struct symbol* all_lut[256] = { NULL };
int lut_count = 1;

void build_lut(struct symbol* lut, FILE* fp) {
	char c = fgetc(fp);

	int z = 0;
	// Iterate through the first line character by character
	while(c != '\n') {
		// Construct a new entry for the LUT
		struct symbol new_entry;
		new_entry.symbol = c;

		unsigned int code = 0;
		int len = 0;

		// Iterate through the new entry's binary (comma separated)
		// Use while(1) so we can still read commas as a valid symbol
		while(1) {
			c = fgetc(fp);
			// Comma separated, break from the loop if at end of code
			if(c == ',') {
				break;
			}
			// TODO: Is 32 max? this is a guess
			// Maximum code length is 32 bits.
			// If the current char is '1', c == '1' returns 1. Else returns 0, which is what we want.
			// Essentially this is converting our string code (i.e. "110") to an integer.
			code |= (c == '1') << (31 - len);
			len++;
		}
		new_entry.code_length = len;
		new_entry.table_idx = 0;

		int temp_len = len;
		int lut_idx = 0;
		int i = 0;
		// Iterate through the code spliting it up into chunks of 8
		// Upsets appropriate look up table
		while(temp_len > 8) {
			// Shift the code so the only 8 bits we care about are present as the most significant bits
			unsigned int temp = code << (8 * i);
			// Shift so the 8 significant bits are the only bits
			char chunk = temp >> 24;
			// If the LUT we are looking at exists
			// This should always be true?
			if(all_lut[lut_idx] != NULL){
				// (Pointer to) The current symbol we care about
				struct symbol *curr = &all_lut[lut_idx][chunk];
				// If this chunk hasn't been initialized (doesn't point to another LUT)
				if(curr == NULL) {
					// Create a new LUT and point to it at this chunk of the current LUT
					lut_count++;
					all_lut[lut_count] = malloc(256 * sizeof(struct symbol));
					all_lut[lut_idx][chunk].table_idx = lut_count;
				}
				// Head into the next LUT and shift over 8 bits
				lut_idx = all_lut[lut_idx][chunk].table_idx;
				temp_len -= 8;
			}
		}

		// Once it comes to iteratively entering the symbol into the LUT we only care about the last 8 bits
		u_int8_t lower_bound = code >> (32 - 8);
    	u_int8_t upper_bound = lower_bound | (0b11111111 >> temp_len);

		// Enter into LUT.
		// i.e. for code "10", all values integers "0b10XXXXXX" should find this entry
		// That is why we need an upper and lower bound
		for (int i = lower_bound; i <= upper_bound; i++){
			all_lut[lut_idx][i] = new_entry;
		}

		// print_symbol(new_entry);
		// printf("code: ");
		// print_bin(lower_bound >> (8 - len));
		// printf("lower: " );
		// print_bin(lower_bound);
		// printf("upper: ");
		// print_bin(upper_bound);

		c = fgetc(fp);
		z++;
	}
}

void decode(struct symbol* lut, FILE* fp){
	int remaining_bits = 0;
	int previous_chunk_size = 8; // default at 8
	unsigned char chunk = 0;
	struct symbol symbol;
	unsigned char c;
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
		symbol = lut[chunk];
		printf("%c", symbol.symbol);

		// Get rid of the old bits
		previous_chunk_size = symbol.code_length;
		chunk <<= previous_chunk_size;
    }

	printf("\n");
}

int main(int argc,char **argv){
	if (argc != 2) {
        printf("Invalid input\n");
        return 0;
    }
    char* f_input = argv[1];

	struct symbol default_symbol;
	// default_symbol.code_length = 0;
	// default_symbol.symbol = 0;
	default_symbol.table_idx = 0;
	struct symbol* lut = malloc(256 * sizeof(struct symbol));
	all_lut[0] = lut;

    FILE *fp = fopen(f_input, "rb");
	build_lut(lut, fp);
	decode(lut, fp);


	return 0;
}
