#include <stdio.h>

int line_num = 1;

void lexical_error(char* str) {
    printf("Erreur lexicale, ligne %d, colonne %d, entité '%s'\n", line_num, column, str);
}

void syntax_error(char* str) {
    printf("Erreur syntaxique, ligne %d, entité '%s'\n", line_num, str);
}

void semantic_error(char* str) {
    printf("Erreur sémantique, ligne %d, entité '%s'\n", line_num, str);
}
