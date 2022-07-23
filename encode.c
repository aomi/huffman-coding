// C program for Huffman Coding
// Modified from: https://www.geeksforgeeks.org/huffman-coding-greedy-algo-3/
#include <stdio.h>
#include <stdlib.h>

#define MAX_TREE_HT 100
#define MAX 128

int size = 0;

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
    printf("Symbol: %c", frequency.symbol);
    printf(" | Frequency: %d\n", frequency.frequency);
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
    printf(",");
}

int is_leaf(struct MinHeapNode* root) {
	return !(root->left) && !(root->right);
}

struct MinHeap* create_and_build_min_heap(struct Frequency frequencies[], int size) {
	struct MinHeap* minHeap = create_min_heap(size);

	for (int i = 0; i < size; ++i) {
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

void write_codes(struct MinHeapNode* root, int arr[], int top, int lut[]) {
	if (root->left) {
		arr[top] = 0;
		write_codes(root->left, arr, top + 1, lut);
	}

	if (root->right) {
		arr[top] = 1;
		write_codes(root->right, arr, top + 1, lut);
	}

	if (is_leaf(root)) {
        int code = 0;
        for(int i = 0; i < top; i++){
            code += (arr[i] << (top - (i + 1)));
        }

        lut[root->data] = code;
		printf("%c", root->data);
		print_array(arr, top);
	}
}

void encode(struct Frequency frequencies[], int size, int lut[]) {
	struct MinHeapNode* root = build_huffman_tree(frequencies, size);

	int arr[MAX], top = 0;

	write_codes(root, arr, 0, lut);
}

int find_symbol_index(struct Frequency* frequencies, char symbol) {
    for(int i = 0; i < size; i ++){
        if(frequencies[i].symbol == symbol) {
            return i;
        }
    }

    return -1;
}

void read(){
	FILE *fp;
	struct Frequency my_record;

	fp = fopen("out.bin", "rb");
	if (!fp) {
		printf("Unable to open file!");
		return;
	}
	for (int i = 0; i < size; i++) {
		fread(&my_record, sizeof(struct Frequency), 1, fp);
		printf("%c %d\n", my_record.symbol, my_record.frequency);
	}

	fclose(fp);
}

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


int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Invalid input\n");
        return 0;
    }
    char* f_input = argv[1];
    struct Frequency frequencies[MAX];
    get_frequencies(f_input, frequencies);

    int lut[MAX] = { };
	encode(frequencies, size, lut);

    FILE *fp = fopen(f_input, "rb");

    // Separate the code mappings from the encoded message
    printf("\n");
    char c = fgetc(fp);
    while (!feof(fp)) {
        putchar(lut[c]);
        c = fgetc(fp);
    }
    printf("\n");

    fclose(fp);

	return 0;
}
