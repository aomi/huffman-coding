#include <stdio.h>
#include <stdlib.h>

int main(int argc,char **argv){
    for(int i = 0; i < 128; i++){
        printf("%c\n", i);
    }
    int i = 200;
    printf("aa %c\n", i);
}