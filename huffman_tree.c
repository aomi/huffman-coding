// C program for Huffman Coding
// Modified from: https://www.geeksforgeeks.org/huffman-coding-greedy-algo-3/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#define MAX_TREE_HT 100
#define MAX 128

int size = 0;
int current_count = 0;
int file_length = 0;
struct Frequency {
   char  symbol;
   unsigned frequency;
};

struct MinHeapNode {
	char data;
	unsigned freq;
	struct MinHeapNode *left, *right;
};

struct MinHeap {
	unsigned size;
	unsigned capacity;
	struct MinHeapNode** array;
};

void print_frequency(struct Frequency frequency) {
    printf("%c%d", frequency.symbol,frequency.frequency);
}

struct MinHeapNode* new_node(char data, unsigned freq) {
	struct MinHeapNode* temp = (struct MinHeapNode*)malloc(sizeof(struct MinHeapNode));

	temp->left = temp->right = NULL;
	temp->data = data;
	temp->freq = freq;

	return temp;
}

struct MinHeap* create_min_heap(unsigned capacity) {
	struct MinHeap* minHeap = (struct MinHeap*)malloc(sizeof(struct MinHeap));

	// current size is 0
	minHeap->size = 0;
	minHeap->capacity = capacity;
	minHeap->array = (struct MinHeapNode**)malloc(minHeap->capacity * sizeof(struct MinHeapNode*));

	return minHeap;
}

void swap_nodes(struct MinHeapNode** a, struct MinHeapNode** b) {
	struct MinHeapNode* t = *a;
	*a = *b;
	*b = t;
}

void min_heapify(struct MinHeap* minHeap, int idx) {
	int smallest = idx;
	int left = 2 * idx + 1;
	int right = 2 * idx + 2;

	if (left < minHeap->size && (minHeap->array[left]->freq < minHeap->array[smallest]->freq)) {
		smallest = left;
    }

	if (right < minHeap->size && (minHeap->array[right]->freq < minHeap->array[smallest]->freq)) {
		smallest = right;
    }

	if (smallest != idx) {
		swap_nodes(&minHeap->array[smallest],
						&minHeap->array[idx]);
		min_heapify(minHeap, smallest);
	}
}

int is_of_size_one(struct MinHeap* minHeap) {
	return (minHeap->size == 1);
}

struct MinHeapNode* extract_minimum(struct MinHeap* minHeap) {
	struct MinHeapNode* temp = minHeap->array[0];

	minHeap->array[0] = minHeap->array[minHeap->size - 1];
	--minHeap->size;

	min_heapify(minHeap, 0);

	return temp;
}

void insert_into_min_heap(struct MinHeap* minHeap, struct MinHeapNode* minHeapNode) {
	++minHeap->size;
	int i = minHeap->size - 1;

	while (i && (minHeapNode->freq < minHeap->array[(i - 1) / 2]->freq)) {
		minHeap->array[i] = minHeap->array[(i - 1) / 2];
		i = (i - 1) / 2;
	}

	minHeap->array[i] = minHeapNode;
}

void build_min_heap(struct MinHeap* minHeap) {
	int n = minHeap->size - 1;
	int i;

	for (i = (n - 1) / 2; i >= 0; --i) {
		min_heapify(minHeap, i);
    }
}

void print_array(int arr[], int n)
{
	int i;
	for (i = 0; i < n; ++i) {
		printf("%d", arr[i]);
    }
    // delimiter
	if(current_count < size) {
    	printf(",");
	}
}

int is_leaf(struct MinHeapNode* root) {
	return !(root->left) && !(root->right);
}

struct MinHeap* create_and_build_min_heap(struct Frequency frequencies[], int size) {
	struct MinHeap* minHeap = create_min_heap(size);
	int i;
	for (i = 0; i < size; ++i) {
		minHeap->array[i] = new_node(frequencies[i].symbol, frequencies[i].frequency);
    }

	minHeap->size = size;
	build_min_heap(minHeap);

	return minHeap;
}

struct MinHeapNode* build_huffman_tree(struct Frequency frequencies[], int size) {
	struct MinHeapNode *left, *right, *top;

	struct MinHeap* minHeap = create_and_build_min_heap(frequencies, size);

	while (!is_of_size_one(minHeap)) {
		left = extract_minimum(minHeap);
		right = extract_minimum(minHeap);

		top = new_node('$', left->freq + right->freq);
		top->left = left;
		top->right = right;

		insert_into_min_heap(minHeap, top);
	}

	return extract_minimum(minHeap);
}

void write_codes(struct MinHeapNode* root, int arr[], int top, char* lut[]) {
	if (root->left) {
		arr[top] = 0;
		write_codes(root->left, arr, top + 1, lut);
	}

	if (root->right) {
		arr[top] = 1;
		write_codes(root->right, arr, top + 1, lut);
	}

	if (is_leaf(root)) {
        char* code = (char *)malloc(top + 1);
		int i;
        for(i = 0; i < top; i++){
			if(arr[i] == 1){
            	code[i] = '1';
				file_length++;
			} else {
				code[i] = '0';
				file_length++;
			}
        }
		current_count++;
        lut[root->data] = code;
		printf("%c", root->data);
		print_array(arr, top);
	}
}

struct MinHeapNode* encode(struct Frequency frequencies[], int size, char* lut[]) {
	struct MinHeapNode* root = build_huffman_tree(frequencies, size);

	int arr[MAX], top = 0;

	write_codes(root, arr, 0, lut);
	
	return root;
}

int find_symbol_index(struct Frequency* frequencies, char symbol) {
	int i;
    for(i = 0; i < size; i ++){
        if(frequencies[i].symbol == symbol) {
            return i;
        }
    }

    return -1;
}

void get_frequencies(char* f_name, struct Frequency* frequencies) {
    FILE *fp = fopen(f_name, "rb");

    char c = fgetc(fp);
    int j = 0;
    while (!feof(fp)) {
		file_length++;
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

void print_bin(unsigned char value)
{
	int i;
    for (i = sizeof(char) * 7; i >= 0; i--)
        printf("%d", (value & (1 << i)) >> i );
    putc('\n', stdout);
}
void decode(char* f_input, struct MinHeapNode* root,char* lut[]){
	int i;
	struct MinHeapNode* curr = root;
    FILE *fp = fopen(f_input, "rb");
	char c = fgetc(fp);
	 while (!feof(fp)) {
		char* s = lut[c];
		for(i = 0; s[i] != '\0'; i++){
			if(s[i] == '1'){
				curr = curr->right;
			} else {
				curr = curr->left;
			}
			if(is_leaf(curr)){
				printf("%c", curr->data);
				curr = root;
			}
		}
        c = fgetc(fp);
    }
}
    

int main(int argc, char **argv) {
	int time = 0;
	clock_t t;
    int f;
    t = clock();

    if (argc > 3 || argc < 2) {
        printf("Invalid input\n");
        return 0;
    }

	 if (argc == 3) {
        time = 1;
    }

    char* f_input = argv[1];
    struct Frequency frequencies[MAX];
    get_frequencies(f_input, frequencies);

	//FOR TREE HUFFMAN
	for(int i = 0 ; i < size; i++){
		print_frequency(frequencies[i]);
		if(i+1 != size){
		printf(",");
		}
	}
	printf("\n");
	//
    char* lut[MAX] = { };
	struct MinHeapNode* head = encode(frequencies, size, lut);

	t = clock() - t;
	if(time){
		printf("\nNo. of clicks %ld clicks (%f seconds).\n", t, ((float)t) / CLOCKS_PER_SEC);
	}
	printf("\n");

	// can comment the next bit out to figure out decoding times for huffman tree
	// clock_t clock;
	// clock = clock();
	// decode(f_input,head,lut);
	// clock = clock() - clock;
	// if(time){
	// 	printf("\nNo. of clicks %ld clicks (%f seconds) to DECODE.\n", t, ((float)clock) / CLOCKS_PER_SEC);
	// }
	// printf("\n");

	return 0;
}

