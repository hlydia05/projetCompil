#include <stdio.h>
#include <string.h>

extern Quadruplet quads[];
extern int quad_count;

void propagate_copy() {
    for (int i = 0; i < quad_count; i++) {
        if (strcmp(quads[i].op, "=") == 0) {
            char* res = quads[i].res;
            for (int j = i + 1; j < quad_count; j++) {
                if (strcmp(quads[j].arg1, res) == 0) {
                    strcpy(quads[j].arg1, quads[i].arg1);
                }
                if (strcmp(quads[j].arg2, res) == 0) {
                    strcpy(quads[j].arg2, quads[i].arg1);
                }
            }
        }
    }
}

void propagate_expression() {
    for (int i = 0; i < quad_count; i++) {
        if (strcmp(quads[i].op, "=") == 0) {
            char* res = quads[i].res;
            char* expr = quads[i].arg1;
            for (int j = i + 1; j < quad_count; j++) {
                if (strcmp(quads[j].arg1, res) == 0) {
                    strcpy(quads[j].arg1, expr);
                }
                if (strcmp(quads[j].arg2, res) == 0) {
                    strcpy(quads[j].arg2, expr);
                }
            }
        }
    }
}

void eliminate_common_expressions() {
    for (int i = 0; i < quad_count; i++) {
        for (int j = i + 1; j < quad_count; j++) {
            if (strcmp(quads[i].op, quads[j].op) == 0 &&
                strcmp(quads[i].arg1, quads[j].arg1) == 0 &&
                strcmp(quads[i].arg2, quads[j].arg2) == 0) {
                strcpy(quads[j].res, quads[i].res);
            }
        }
    }
}

void algebraic_simplification() {
    for (int i = 0; i < quad_count; i++) {
        if (strcmp(quads[i].op, "+") == 0) {
            if (strcmp(quads[i].arg1, "0") == 0) {
                strcpy(quads[i].res, quads[i].arg2);
            } else if (strcmp(quads[i].arg2, "0") == 0) {
                strcpy(quads[i].res, quads[i].arg1);
            }
        } else if (strcmp(quads[i].op, "-") == 0) {
            if (strcmp(quads[i].arg2, "0") == 0) {
                strcpy(quads[i].res, quads[i].arg1);
            }
        } else if (strcmp(quads[i].op, "*") == 0) {
            if (strcmp(quads[i].arg1, "1") == 0) {
                strcpy(quads[i].res, quads[i].arg2);
            } else if (strcmp(quads[i].arg2, "1") == 0) {
                strcpy(quads[i].res, quads[i].arg1);
            } else if (strcmp(quads[i].arg1, "0") == 0 || strcmp(quads[i].arg2, "0") == 0) {
                strcpy(quads[i].res, "0");
            }
        } else if (strcmp(quads[i].op, "/") == 0) {
            if (strcmp(quads[i].arg1, "0") == 0) {
                strcpy(quads[i].res, "0");
            } else if (strcmp(quads[i].arg2, "1") == 0) {
                strcpy(quads[i].res, quads[i].arg1);
            }
        }
    }
}

void eliminate_dead_code() {
    int used[MAX_QUAD] = {0};
    for (int i = 0; i < quad_count; i++) {
        if (strcmp(quads[i].res, "") != 0) {
            used[i] = 1;
            for (int j = i + 1; j < quad_count; j++) {
                if (strcmp(quads[j].arg1, quads[i].res) == 0 ||
                    strcmp(quads[j].arg2, quads[i].res) == 0) {
                    used[j] = 1;
                }
            }
        }
    }

    int new_count = 0;
    Quadruplet temp[MAX_QUAD];
    for (int i = 0; i < quad_count; i++) {
        if (used[i]) {
            strcpy(temp[new_count].op, quads[i].op);
            strcpy(temp[new_count].arg1, quads[i].arg1);
            strcpy(temp[new_count].arg2, quads[i].arg2);
            strcpy(temp[new_count].res, quads[i].res);
            new_count++;
        }
    }

    quad_count = new_count;
    memcpy(quads, temp, new_count * sizeof(Quadruplet));
}

void optimize() {
    propagate_copy();
    propagate_expression();
    eliminate_common_expressions();
    algebraic_simplification();
    eliminate_dead_code();
}
