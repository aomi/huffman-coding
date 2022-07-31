#include <stdio.h>
#include <stdlib.h>

struct symbol {
   int table_idx;
   char  symbol;
   int code_length;
};

int lut_count = 0;

void print_symbol(struct symbol symbol) {
    printf("Symbol: %c", symbol.symbol);
    printf(" | Code Length: %d", symbol.code_length);
    printf(" | Table: %d\n", symbol.table_idx);
}

void print_tables(struct symbol** all_lut){
	for(int i = 0; i <= lut_count; i++){
		printf("Table %d\n", i);
		for(int j = 0; j < 256; j++){
			struct symbol curr = all_lut[i][j];
			// if(curr.code_length != 0){
				print_symbol(curr);
			// }
		}
	}
}

void print_table(int n, struct symbol** all_lut){
	printf("Table %d\n", n);
	for(int j = 0; j < 256; j++){
		struct symbol curr = all_lut[n][j];
		// if(curr.code_length != 0){
			printf("%d ", j);
			print_symbol(curr);
		// }
	}
}

void print_bin(unsigned char value)
{
    for (int i = sizeof(char) * 7; i >= 0; i--)
        printf("%d", (value & (1 << i)) >> i );
    putc('\n', stdout);
}

void build_lut(struct symbol** all_lut, FILE* fp) {
	char c = fgetc(fp);

	// Iterate through the first line character by character
	while(1) {
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
			if(c == ',' || c == '\n') {
				break;
			}
			// TODO: Is 32 max? this is a guess
			// Maximum code length is 32 bits.
			// If the current char is '1', c == '1' returns 1. Else returns 0, which is what we want.
			// Essentially this is converting our string code (i.e. "110") to an integer.
			code |= (c == '1') << (31 - len);
			len++;
		}

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

			struct symbol curr = all_lut[lut_idx][chunk];
			// If this chunk hasn't been initialized (doesn't point to another LUT)
			if(curr.table_idx == lut_idx) {
				// Create a new LUT and point to it at this chunk of the current LUT
				lut_count++;
				struct symbol new_lut[256] = {{0}};
				all_lut[lut_count] = new_lut;
				all_lut[lut_idx][chunk].table_idx = lut_count;
				all_lut[lut_idx][chunk].code_length = 8;
			}
			// Head into the next LUT and shift over 8 bits
			lut_idx = all_lut[lut_idx][chunk].table_idx;
			temp_len -= 8;

			i++;
		}

		new_entry.code_length = temp_len;
		new_entry.table_idx = lut_idx;

		// Once it comes to iteratively entering the symbol into the LUT we only care about the last 8 bits
		u_int8_t lower_bound = code >> (32 - (8 * (i + 1)));
    	u_int8_t upper_bound = lower_bound | (0b11111111 >> temp_len);

		// Enter into LUT.
		// i.e. for code "10", all values integers "0b10XXXXXX" should find this entry
		// That is why we need an upper and lower bound
		for (int i = lower_bound; i <= upper_bound; i++){
			all_lut[lut_idx][i] = new_entry;
		}

		if(c == '\n') {
			break;
		}

		c = fgetc(fp);
	}

}

void decode(struct symbol** all_lut, FILE* fp){
	int remaining_bits = 0;
	int previous_chunk_size = 8; // default at 8
	unsigned char chunk = 0;
	struct symbol symbol;
	unsigned char c;
	int curr_lut = 0;
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
		if(symbol.table_idx == curr_lut){
			printf("%c", symbol.symbol);
			curr_lut = 0;
		} else {
			curr_lut = symbol.table_idx;
		}

		// printf("that guy was %d long\n", symbol.code_length);
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

	struct symbol* all_lut[10];

	struct symbol lut[256] = {{0}};
	all_lut[0] = lut;

    FILE *fp = fopen(f_input, "rb");
	build_lut(all_lut, fp);
	decode(all_lut, fp);

	return 0;
}
