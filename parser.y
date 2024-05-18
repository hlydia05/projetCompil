%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int line_num;
extern int yylex();
extern int yyparse();
void yyerror(const char* s);

typedef struct SymbolNode {
    char* name;
    char* type;
    int isArray;
    int arraySize;
    struct SymbolNode* next;
} SymbolNode;

SymbolNode* symbolTable = NULL;

void insertSymbol(char* name, char* type, int isArray, int arraySize) {
    SymbolNode* newNode = (SymbolNode*)malloc(sizeof(SymbolNode));
    newNode->name = strdup(name);
    newNode->type = strdup(type);
    newNode->isArray = isArray;
    newNode->arraySize = arraySize;
    newNode->next = symbolTable;
    symbolTable = newNode;
}

SymbolNode* findSymbol(char* name) {
    SymbolNode* current = symbolTable;
    while (current != NULL) {
        if (strcmp(current->name, name) == 0) {
            return current;
        }
        current = current->next;
    }
    return NULL;
}

void freeSymbolTable() {
    SymbolNode* current = symbolTable;
    while (current != NULL) {
        SymbolNode* next = current->next;
        free(current->name);
        free(current->type);
        free(current);
        current = next;
    }
    symbolTable = NULL;
}
%}

%union {
    int int_val;
    float float_val;
    char* str;
}

%token VAR_GLOBAL DECLARATION INSTRUCTION
%token INTEGER FLOAT CONST
%token IF ELSE FOR READ WRITE WHILE
%token <str> IDF
%token <int_val> INT_CONST
%token <float_val> FLOAT_CONST
%token SEMICOLON COMMA LBRACKET RBRACKET LPAREN RPAREN LBRACE RBRACE
%token ASSIGN PLUS MINUS MULT DIV AND OR NOT GT GE LT LE EQ NE

%type <str> type
%type <int_val> constant_int
%type <float_val> constant_float

%left OR
%left AND
%nonassoc GT GE LT LE EQ NE
%left PLUS MINUS
%left MULT DIV
%right NOT

%%

program : VAR_GLOBAL var_global_block
          DECLARATION declaration_block
          INSTRUCTION instruction_block
        ;

var_global_block : LBRACE RBRACE
                 ;

declaration_block : LBRACE declaration_list RBRACE
                  ;

declaration_list : declaration
                 | declaration_list declaration
                 ;

declaration : type idf_list SEMICOLON {
                for (int i = 0; i < idf_list_len; i++) {
                    insertSymbol(idf_list[i], $1, 0, 0);
                }
                free($1);
            }
             | type idf LBRACKET INT_CONST RBRACKET SEMICOLON {
                insertSymbol($2, $1, 1, $4);
                free($1);
                free($2);
             }
             | CONST IDF ASSIGN constant SEMICOLON {
                insertSymbol($2, "const", 0, 0);
                free($2);
             }
             ;

type : INTEGER { $$ = strdup("integer"); }
     | FLOAT { $$ = strdup("float"); }
     ;

idf_list : IDF {
             idf_list_len = 1;
             idf_list = (char**)malloc(sizeof(char*));
             idf_list[0] = $1;
          }
         | idf_list COMMA IDF {
             idf_list_len++;
             idf_list = (char**)realloc(idf_list, idf_list_len * sizeof(char*));
             idf_list[idf_list_len - 1] = $3;
          }
         ;

constant : INT_CONST { $$ = $1; }
         | FLOAT_CONST { $$ = $1; }
         ;

constant_int : INT_CONST { $$ = $1; }
             ;

constant_float : FLOAT_CONST { $$ = $1; }
               ;

instruction_block : LBRACE instruction_list RBRACE
                  ;

instruction_list : instruction
                 | instruction_list instruction
                 ;

instruction : assignment_stmt SEMICOLON
             | if_stmt
             | for_stmt
             | read_stmt SEMICOLON
             | write_stmt SEMICOLON
             | while_stmt
             ;

assignment_stmt : IDF ASSIGN expr {
                    SymbolNode* symbol = findSymbol($1);
                    if (symbol == NULL) {
                        printf("Erreur sémantique à la ligne %d : variable '%s' non déclarée\n", line_num, $1);
                    } else if (symbol->isArray) {
                        printf("Erreur sémantique à la ligne %d : impossible d'affecter une valeur à un tableau\n", line_num);
                    } else if (strcmp(symbol->type, "integer") == 0 && !isIntegerExpr) {
                        printf("Erreur sémantique à la ligne %d : type incompatible pour l'affectation à '%s'\n", line_num, $1);
                    }
                    free($1);
                 }
                 ;

if_stmt : IF LPAREN expr RPAREN instruction
           %prec THEN
        | IF LPAREN expr RPAREN instruction ELSE instruction
        ;

for_stmt : FOR LPAREN idf_assignment SEMICOLON expr SEMICOLON idf_increment RPAREN instruction
         ;

idf_assignment : IDF ASSIGN expr {
                   SymbolNode* symbol = findSymbol($1);
                   if (symbol == NULL) {
                       printf("Erreur sémantique à la ligne %d : variable '%s' non déclarée\n", line_num, $1);
                   } else if (symbol->isArray) {
                       printf("Erreur sémantique à la ligne %d : impossible d'affecter une valeur à un tableau\n", line_num);
                   } else if (strcmp(symbol->type, "integer") == 0 && !isIntegerExpr) {
                       printf("Erreur sémantique à la ligne %d : type incompatible pour l'affectation à '%s'\n", line_num, $1);
                   }
                   free($1);
                }
              ;

idf_increment : IDF ASSIGN IDF PLUS expr {
                    SymbolNode* symbol1 = findSymbol($1);
                    SymbolNode* symbol2 = findSymbol($3);
                    if (symbol1 == NULL || symbol2 == NULL) {
                        printf("Erreur sémantique à la ligne %d : variable non déclarée\n", line_num);
                    } else if (symbol1->isArray || symbol2->isArray) {
                        printf("Erreur sémantique à la ligne %d : impossible d'incrémenter un tableau\n", line_num);
                    } else if (strcmp(symbol1->type, "integer") != 0 || strcmp(symbol2->type, "integer") != 0 || !isIntegerExpr) {
                        printf("Erreur sémantique à la ligne %d : type incompatible pour l'incrémentation\n", line_num);
                    }
                    free($1);
                    free($3);
                 }
               ;

read_stmt : READ LPAREN IDF RPAREN {
                SymbolNode* symbol = findSymbol($3);
                if (symbol == NULL) {
                    printf("Erreur sémantique à la ligne %d : variable '%s' non déclarée\n", line_num, $3);
                }
                free($3);
            }
          ;

write_stmt : WRITE LPAREN string_expr RPAREN
           | WRITE LPAREN expr RPAREN
           ;

string_expr : STRING
            | string_expr COMMA IDF {
                SymbolNode* symbol = findSymbol($3);
                if (symbol == NULL) {
                    printf("Erreur sémantique à la ligne %d : variable '%s' non déclarée\n", line_num, $3);
                }
                free($3);
             }
            ;

while_stmt : WHILE LPAREN expr RPAREN instruction
           ;

expr : expr PLUS expr { isIntegerExpr = ($1 == (int)$1 && $3 == (int)$3); }
     | expr MINUS expr { isIntegerExpr = ($1 == (int)$1 && $3 == (int)$3); }
     | expr MULT expr { isIntegerExpr = ($1 == (int)$1 && $3 == (int)$3); }
     | expr DIV expr { isIntegerExpr = ($1 == (int)$1 && $3 == (int)$3); }
     | expr GT expr { isIntegerExpr = 0; }
     | expr GE expr { isIntegerExpr = 0; }
     | expr LT expr { isIntegerExpr = 0; }
     | expr LE expr { isIntegerExpr = 0; }
     | expr EQ expr { isIntegerExpr = 0; }
     | expr NE expr { isIntegerExpr = 0; }
     | expr AND expr { isIntegerExpr = ($1 == (int)$1 && $3 == (int)$3); }
     | expr OR expr { isIntegerExpr = ($1 == (int)$1 && $3 == (int)$3); }
     | NOT expr { isIntegerExpr = ($2 == (int)$2); }
     | LPAREN expr RPAREN { $$ = $2; isIntegerExpr = ($2 == (int)$2); }
     | constant_int { $$ = $1; isIntegerExpr = 1; }
     | constant_float { $$ = $1; isIntegerExpr = 0; }
     | IDF {
         SymbolNode* symbol = findSymbol($1);
         if (symbol == NULL) {
             printf("Erreur sémantique à la ligne %d : variable '%s' non déclarée\n", line_num, $1);
             $$ = 0;
             isIntegerExpr = 0;
         } else {
             if (strcmp(symbol->type, "integer") == 0) {
                 isIntegerExpr = 1;
             } else {
                 isIntegerExpr = 0;
             }
         }
         free($1);
     }
     ;

%%

int idf_list_len = 0;
char** idf_list = NULL;
int isIntegerExpr = 0;

void yyerror(const char* s) {
    fprintf(stderr, "Erreur syntaxique à la ligne %d : %s\n", line_num, s);
}

int main() {
    yyparse();
    freeSymbolTable();
    return 0;
}
