#include <stdio.h>
#include <string.h>

extern Quadruplet quads[];
extern int quad_count;

void generate_code() {
    FILE* file = fopen("code.asm", "w");
    if (file == NULL) {
        printf("Erreur lors de l'ouverture du fichier code.asm\n");
        return;
    }

    fprintf(file, ".model small\n");
    fprintf(file, ".stack 100h\n");
    fprintf(file, ".data\n");

    // Déclaration des variables et constantes

    fprintf(file, ".code\n");
    fprintf(file, "main proc\n");
    fprintf(file, "    mov ax, @data\n");
    fprintf(file, "    mov ds, ax\n");

    // Génération du code machine

    for (int i = 0; i < quad_count; i++) {
        if (strcmp(quads[i].op, "+") == 0) {
            fprintf(file, "    mov ax, %s\n", quads[i].arg1);
            fprintf(file, "    add ax, %s\n", quads[i].arg2);
            fprintf(file, "    mov %s, ax\n", quads[i].res);
        } else if (strcmp(quads[i].op, "-") == 0) {
            fprintf(file, "    mov ax, %s\n", quads[i].arg1);
            fprintf(file, "    sub ax, %s\n", quads[i].arg2);
            fprintf(file, "    mov %s, ax\n", quads[i].res);
        } else if (strcmp(quads[i].op, "*") == 0) {
            fprintf(file, "    mov ax, %s\n", quads[i].arg1);
            fprintf(file, "    mul %s\n", quads[i].arg2);
            fprintf(file, "    mov %s, ax\n", quads[i].res);
        } else if (strcmp(quads[i].op, "/") == 0) {
    fprintf(file, "    mov ax, %s\n", quads[i].arg1);
    fprintf(file, "    mov bx, %s\n", quads[i].arg2);
    fprintf(file, "    xor dx, dx\n"); // Initialiser dx à 0 pour la division
    fprintf(file, "    div bx\n"); // Diviser ax par bx, quotient dans ax, reste dans dx
    fprintf(file, "    mov %s, ax\n", quads[i].res);
} else if (strcmp(quads[i].op, "=") == 0) {
    fprintf(file, "    mov ax, %s\n", quads[i].arg1);
    fprintf(file, "    mov %s, ax\n", quads[i].res);
} else if (strcmp(quads[i].op, "bz") == 0) {
    fprintf(file, "    mov ax, %s\n", quads[i].arg1);
    fprintf(file, "    cmp ax, 0\n");
    fprintf(file, "    je %s\n", quads[i].res);
} else if (strcmp(quads[i].op, "br") == 0) {
    fprintf(file, "    jmp %s\n", quads[i].res);
}
// ... autres instructions à implémenter
    }

    fprintf(file, "    mov ah, 4Ch\n");
    fprintf(file, "    int 21h\n");
    fprintf(file, "main endp\n");
    fprintf(file, "end main\n");

    fclose(file);
    printf("Code machine généré dans le fichier code.asm\n");
}
