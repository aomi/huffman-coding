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

struct MinHeapNode* newNode(char data, unsigned freq) {
	struct MinHeapNode* temp = (struct MinHeapNode*)malloc(sizeof(struct MinHeapNode));

	temp->left = temp->right = NULL;
	temp->data = data;
	temp->freq = freq;

	return temp;
}

struct MinHeap* createMinHeap(unsigned capacity) {
	struct MinHeap* minHeap = (struct MinHeap*)malloc(sizeof(struct MinHeap));

	// current size is 0
	minHeap->size = 0;
	minHeap->capacity = capacity;
	minHeap->array = (struct MinHeapNode**)malloc(minHeap->capacity * sizeof(struct MinHeapNode*));

	return minHeap;
}

void swapMinHeapNode(struct MinHeapNode** a, struct MinHeapNode** b) {
	struct MinHeapNode* t = *a;
	*a = *b;
	*b = t;
}

void minHeapify(struct MinHeap* minHeap, int idx) {
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
		swapMinHeapNode(&minHeap->array[smallest],
						&minHeap->array[idx]);
		minHeapify(minHeap, smallest);
	}
}

int isSizeOne(struct MinHeap* minHeap) {
	return (minHeap->size == 1);
}

struct MinHeapNode* extractMin(struct MinHeap* minHeap) {
	struct MinHeapNode* temp = minHeap->array[0];

	minHeap->array[0] = minHeap->array[minHeap->size - 1];
	--minHeap->size;

	minHeapify(minHeap, 0);

	return temp;
}

void insertMinHeap(struct MinHeap* minHeap, struct MinHeapNode* minHeapNode) {
	++minHeap->size;
	int i = minHeap->size - 1;

	while (i && (minHeapNode->freq < minHeap->array[(i - 1) / 2]->freq)) {
		minHeap->array[i] = minHeap->array[(i - 1) / 2];
		i = (i - 1) / 2;
	}

	minHeap->array[i] = minHeapNode;
}

void buildMinHeap(struct MinHeap* minHeap) {

	int n = minHeap->size - 1;
	int i;

	for (i = (n - 1) / 2; i >= 0; --i) {
		minHeapify(minHeap, i);
    }
}

void printArr(int arr[], int n)
{
	int i;
	for (i = 0; i < n; ++i) {
		printf("%d", arr[i]);
    }

	printf("\n");
}

int isLeaf(struct MinHeapNode* root) {
	return !(root->left) && !(root->right);
}

struct MinHeap* createAndBuildMinHeap(struct Frequency frequencies[], int size) {
	struct MinHeap* minHeap = createMinHeap(size);

	for (int i = 0; i < size; ++i) {
		minHeap->array[i] = newNode(frequencies[i].symbol, frequencies[i].frequency);
    }

	minHeap->size = size;
	buildMinHeap(minHeap);

	return minHeap;
}

struct MinHeapNode* buildHuffmanTree(struct Frequency frequencies[], int size) {
	struct MinHeapNode *left, *right, *top;

	struct MinHeap* minHeap = createAndBuildMinHeap(frequencies, size);

	while (!isSizeOne(minHeap)) {
		left = extractMin(minHeap);
		right = extractMin(minHeap);

		top = newNode('$', left->freq + right->freq);
		top->left = left;
		top->right = right;

		insertMinHeap(minHeap, top);
	}

	return extractMin(minHeap);
}

void printCodes(struct MinHeapNode* root, int arr[], int top) {
	if (root->left) {
		arr[top] = 0;
		printCodes(root->left, arr, top + 1);
	}

	if (root->right) {
		arr[top] = 1;
		printCodes(root->right, arr, top + 1);
	}

	if (isLeaf(root)) {
		printf("%c: ", root->data);
		printArr(arr, top);
	}
}

void HuffmanCodes(struct Frequency frequencies[], int size) {
	struct MinHeapNode* root = buildHuffmanTree(frequencies, size);

	int arr[MAX_TREE_HT], top = 0;

	printCodes(root, arr, top);
}

int find_symbol_index(struct Frequency* frequencies, char symbol) {
    for(int i = 0; i < size; i ++){
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
    char* f_name = argv[1];
    struct Frequency frequencies[MAX];
    get_frequencies(f_name, frequencies);

	HuffmanCodes(frequencies, size);

	return 0;
}
