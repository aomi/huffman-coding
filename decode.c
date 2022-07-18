#include <stdio.h>
#include <stdlib.h>

// fread and fwrite parameters:
// 1. A memory address
// 2. Number of bytes to read per block
// 3. Number of blocks to read
// 4. A file variable

// Test variables
int file_size = 12;
int num_symbols = 6;
int freq = 2;
char symbols[6] = {'c', 'd', 'e', 'f', 'a', 'b'};
int codes[6] = {7, 6, 5, 4, 1, 0};
int lengths[6] = {3, 3, 3, 3, 2, 2};


/* Our structure */
struct rec {
	int x,y,z;
};

void write(){
	FILE *fp;
	struct rec my_record;

	fp = fopen("test.bin", "wb");
	if (!fp) {
		printf("Unable to open file!");
		return;
	}
	fwrite(&file_size, 4, 0, fp);
	for (int i = 1; i <= 10; i++) {
		my_record.x = i;
		fwrite(&my_record, sizeof(struct rec), 1, fp);
	}

	fclose(fp);
}

void read(){
	FILE *fp;
	struct rec my_record;

	fp = fopen("test.bin", "rb");
	if (!fp) {
		printf("Unable to open file!");
		return;
	}
	for (int i = 1; i <= 10; i++) {
		fread(&my_record, sizeof(struct rec), 1, fp);
		printf("%d\n",my_record.x);
	}

	fclose(fp);
}

int main(int argc,char **argv){
	write();
	read();

	return 0;
}