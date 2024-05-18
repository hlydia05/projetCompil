%{
#include <string.h>
#include "parser.tab.h"
extern int line_num;
%}

letter [a-zA-Z]
digit [0-9]
idf {letter}({letter}|{digit})*
int_const [+-]?[0-9]+
float_const [+-]?[0-9]*\.[0-9]+

%%

"VAR_GLOBAL" { return VAR_GLOBAL; }
"DECLARATION" { return DECLARATION; }
"INSTRUCTION" { return INSTRUCTION; }
"INTEGER" { return INTEGER; }
"FLOAT" { return FLOAT; }
"CONST" { return CONST; }
"IF" { return IF; }
"ELSE" { return ELSE; }
"FOR" { return FOR; }
"READ" { return READ; }
"WRITE" { return WRITE; }
"WHILE" { return WHILE; }

{idf} { 
    yylval.str = strdup(yytext);
    return IDF;
}

{int_const} {
    yylval.int_val = atoi(yytext);
    return INT_CONST;
}

{float_const} {
    yylval.float_val = atof(yytext);
    return FLOAT_CONST;
}

"%" {
    char c = input();
    if (c == '%') { /* Commentaire sur une ligne */
        while (c != '\n') 
            c = input();
    } else {
        unput(c);
    }
}

";" { return SEMICOLON; }
"," { return COMMA; }
"[" { return LBRACKET; }
"]" { return RBRACKET; }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LBRACE; }
"}" { return RBRACE; }
"=" { return ASSIGN; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return MULT; }  
"/" { return DIV; }
"&&" { return AND; }
"||" { return OR; }
"!" { return NOT; }
">" { return GT; }
">=" { return GE; }
"<" { return LT; }
"<=" { return LE; }
"==" { return EQ; }
"!=" { return NE; }

[ \t] { /* Ignorer les espaces et les tabulations */ }
\n { line_num++; }

. { printf("Erreur lexicale à la ligne %d : caractère '%s' invalide\n", line_num, yytext); }

%%

int yywrap() {
    return 1;
}
