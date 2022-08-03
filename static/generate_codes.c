#include <stdio.h>
#include <stdlib.h>

int main(int argc,char **argv){
    for(int i = 0; i < 500000; i++){
        printf("%c", 'a');
    }
    for(int i = 0; i < 500000; i++){
        printf("%c", 'b');
    }
}