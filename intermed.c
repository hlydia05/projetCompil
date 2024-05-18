#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_QUAD 1000

typedef struct {
    char op[10];
    char arg1[20];
    char arg2[20];
    char res[20];
} Quadruplet;

Quadruplet quads[MAX_QUAD];
int quad_count = 0;

void gen_quad(char* op, char* arg1, char* arg2, char* res) {
    strcpy(quads[quad_count].op, op);
    strcpy(quads[quad_count].arg1, arg1);
    strcpy(quads[quad_count].arg2, arg2);
    strcpy(quads[quad_count].res, res);
    quad_count++;
}

void print_quads() {
    printf("Quadruplets générés :\n");
    for (int i = 0; i < quad_count; i++) {
        printf("%d: (%s, %s, %s, %s)\n", i, quads[i].op, quads[i].arg1, quads[i].arg2, quads[i].res);
    }
}
