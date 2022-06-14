#include <stdio.h>
#include <stdlib.h>

#define MAX_MAPPING_SIZE 128

typedef struct Node
{
    struct Node *left, *right;
    int count;
    char c;
} Node;

void enqueue(Node *pq[], int *pq_length, Node *node)
{
    pq[*pq_length] = node;
    (*pq_length)++;
}

Node *dequeue(Node *pq[], int *pq_length)
{
    // find index of node with lowest count and lowest ASCII value
    int min = 0;
    int i = 0;
    for (i = 0; i < *pq_length; i++)
    {
        if (pq[i]->count < pq[min]->count ||
            (pq[i]->count == pq[min]->count &&
             ((pq[i]->c < pq[min]->c && pq[i]->c != 0) ||
              pq[min]->c == 0)))
        {
            min = i;
        }
    }
    Node *min_node = pq[min];

    // replace popped node with node at end
    pq[min] = pq[*pq_length - 1];
    (*pq_length)--;
    return min_node;
}

void build_huffman_tree(Node** root, int* char_count) {
    Node *pq[MAX_MAPPING_SIZE];
    int i = 0;
    int pq_length = 0;
    while (i < MAX_MAPPING_SIZE)
    {
        if (char_count[i] > 0)
        {
            pq[pq_length] = (Node *)malloc(sizeof(Node));
            pq[pq_length]->count = char_count[i];
            pq[pq_length]->c = i;
            pq[pq_length]->left = 0;
            pq[pq_length]->right = 0;
            pq_length++;
        }
        i++;
    }

    // while there is at least 2 node left in queue, loop
    while (pq_length > 1)
    {
        // pop top 2 nodes
        Node *left_node = dequeue(pq, &pq_length);
        Node *right_node = dequeue(pq, &pq_length);

        // create new node, set children as popped nodes
        Node *new_node = (Node *)malloc(sizeof(Node));
        new_node->count = left_node->count + right_node->count;
        new_node->left = left_node;
        new_node->right = right_node;

        // enqueue new node
        enqueue(pq, &pq_length, new_node);
    }

    *root = dequeue(pq, &pq_length);
}

// read through the file building <char,char count> map
void get_char_frequencies(char* f_name, int* frequencies) {
    FILE *fp = fopen(f_name, "rb");
    if (fp == NULL)
    {
        fprintf(stderr, "Can't open %s\n", f_name);
        exit(1);
    }
    int c = fgetc(fp);
    // file is empty so no text to encode
    if (feof(fp))
    {
        fclose(fp);
        exit(0); 
    }

    while (!feof(fp))
    {
        if (c < 0 || c > 127) {
            fprintf(stderr, "Non-ASCII character encountered.\n");
            fclose(fp);
            exit(1);
        }
        frequencies[c]++;
        c = fgetc(fp);
    }

    fclose(fp);

    // adding the ASCII code end of file because the while loop terminates
    // when the end of file is reached. 26 is the ASCII for End of file.
    frequencies[26]++;

}

void huffman_encoding(Node *node, int codes[], int codes_len, char *encoding[])
{
    // If a node has a char value, then it is a leaf node
    if (node->c)
    {
        encoding[node->c] = (char *)malloc(sizeof(char) * codes_len);

        // convert int array into string
        int i = 0;
        char bit;
        while (i < codes_len)
        {
            sprintf(&encoding[node->c][i], "%d", codes[i]);
            i++;
        }
        return;
    }

    if (node->left)
    {
        codes[codes_len] = 0;
        huffman_encoding(node->left, codes, codes_len + 1, encoding);
    }

    if (node->right)
    {
        codes[codes_len] = 1;
        huffman_encoding(node->right, codes, codes_len + 1, encoding);
    }
    return;
}

void encode_to_file(char* f_name, char *encoding[]) {

    // begin huffman message with character encodings
    int i;
    int space_printed = 0;
    for (i = 0; i < MAX_MAPPING_SIZE; i++)
    {
        if (encoding[i] != 0)
        {
            if (space_printed != 0) {
                printf(" ");
            }
            space_printed = 1;
            printf("%c%s", i, encoding[i]);
        }
    }

    // delimit character encodings with newline
    printf("\n");

    FILE *fp = fopen(f_name, "rb");
    if (fp == NULL)
    {
        fprintf(stderr, "Can't open %s. Exiting...\n", f_name);
        exit(1);
    }

    // print huffman encoding by shifting bitshifting encoding into chars
    int c;
    int buf_ctr = 0;
    char char_buf = 0;
    do
    {
        c = fgetc(fp);
        if (feof(fp))
        {
            c = 26;
        }

        char *e = encoding[c];

        int i;
        for (i = 0; e[i] != '\0'; i++)
        {
            if (e[i] == '1')
            {
                char_buf = ((char_buf << 1) | 1); // shift in 1
            }
            else // e[i] == '0'
            {
                char_buf = (char_buf << 1); // shift in 0
            }

            buf_ctr++;

            // once there is a full char to write to file
            if (buf_ctr == 8)
            {
                if (putchar(char_buf) == EOF) {
                    fprintf(stderr, "Can't write stdout. Exiting...\n");
                    fclose(fp);
                    exit(1);
                } 
                buf_ctr = 0;
                char_buf = 0;
            }
        }

    } while (c != 26);

    if (ferror(fp))
    {
        fprintf(stderr, "Can't read from %s. Exiting...\n", f_name);
        fclose(fp);
        exit(1);
    }

    while (!(buf_ctr == 8 || buf_ctr == 0))
    {
        char_buf = (char_buf << 1); // shift in 0
        buf_ctr++;
    }

    if (buf_ctr != 0)
    {
        if (putchar(char_buf) == EOF) {
            fprintf(stderr, "Can't write stdout. Exiting...\n");
            fclose(fp);
            exit(1);
        } 
    }

    fclose(fp);
}

int main(int argc,char **argv){

    if (argc != 2)
    {
        printf("Wrong input\n");
        exit(1);
    }

    char* f_name = argv[1];
    int frequencies[MAX_MAPPING_SIZE] = {};
    get_char_frequencies(f_name, frequencies);

    Node *root;
    build_huffman_tree(&root, frequencies);

    int codes[MAX_MAPPING_SIZE] = {};
    char *encoding[MAX_MAPPING_SIZE] = {};
    huffman_encoding(root, codes, 0, encoding);
    // test_encoding_map(encoding); // uncomment to test encoding map

    encode_to_file(f_name, encoding); // uncomment to print the huffman code

    exit(1);
}