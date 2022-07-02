// C program for Huffman Coding
// Code from: https://www.geeksforgeeks.org/huffman-coding-greedy-algo-3/

#include <stdio.h>
#include <stdlib.h>

#define ALPHABET_SIZE 128

// A Huffman tree node
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
	struct MinHeapNode* tmp = *a;
	*a = *b;
	*b = tmp;
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
		swapMinHeapNode(&minHeap->array[smallest], &minHeap->array[idx]);
		minHeapify(minHeap, smallest);
	}
}

int isSizeOne(struct MinHeap* minHeap) {
	return (minHeap->size == 1);
}

struct MinHeapNode* extractMin(struct MinHeap* minHeap) {
	struct MinHeapNode* tmp = minHeap->array[0];
	minHeap->array[0] = minHeap->array[minHeap->size - 1];

	--minHeap->size;
	minHeapify(minHeap, 0);

	return tmp;
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

	for (i = (n - 1) / 2; i >= 0; --i){
		minHeapify(minHeap, i);
    }
}

void printArr(int arr[], int n) {
	int i;
	for (i = 0; i < n; ++i) {
		printf("%d", arr[i]);
    }

	printf("\n");
}

int isLeaf(struct MinHeapNode* root) {
	return !(root->left) && !(root->right);
}

struct MinHeap* createAndBuildMinHeap(char data[], int freq[], int size) {
	struct MinHeap* minHeap = createMinHeap(size);

	for (int i = 0; i < size; ++i) {
		minHeap->array[i] = newNode(data[i], freq[i]);
    }

	minHeap->size = size;
	buildMinHeap(minHeap);

	return minHeap;
}

struct MinHeapNode* buildHuffmanTree(char data[], int freq[], int size) {
	struct MinHeapNode *left, *right, *top;

	// Step 1: Create a min heap of capacity
	// equal to size. Initially, there are
	// modes equal to size.
	struct MinHeap* minHeap = createAndBuildMinHeap(data, freq, size);

	// Iterate while size of heap doesn't become 1
	while (!isSizeOne(minHeap)) {
		// Step 2: Extract the two minimum
		// freq items from min heap
		left = extractMin(minHeap);
		right = extractMin(minHeap);

		// Step 3: Create a new internal
		// node with frequency equal to the
		// sum of the two nodes frequencies.
		// Make the two extracted node as
		// left and right children of this new node.
		// Add this node to the min heap
		// '$' is a special value for internal nodes, not
		// used
		top = newNode('$', left->freq + right->freq);

		top->left = left;
		top->right = right;

		insertMinHeap(minHeap, top);
	}

	// Step 4: The remaining node is the
	// root node and the tree is complete.
	return extractMin(minHeap);
}

// Prints huffman codes from the root of Huffman Tree.
// It uses arr[] to store codes
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

void huffmanCodes(char data[], int freq[], int size) {
	// Construct Huffman Tree
	struct MinHeapNode* root = buildHuffmanTree(data, freq, size);

	int arr[ALPHABET_SIZE], top = 0;

	printCodes(root, arr, top);
}

// Driver code
int main(int argc, char **argv) {
	char arr[] = { 'a', 'b', 'c', 'd', 'e', 'f' };
	int freq[] = { 5, 9, 12, 13, 16, 45 };

	int size = sizeof(arr) / sizeof(arr[0]);

	huffmanCodes(arr, freq, size);

	return 0;
}
