/* calc.y - Bison grammar file for a simple calculator */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

/* Declare tokens */
%token NUMBER
%left '+' '-'
%left '*' '/'

%%

calclist:
    | calclist exp '\n'  { printf("= %d\n", $2); }
    | calclist '\n'
    ;

exp:
    NUMBER
    | exp '+' exp  { $$ = $1 + $3; }
    | exp '-' exp  { $$ = $1 - $3; }
    | exp '*' exp  { $$ = $1 * $3; }
    | exp '/' exp  { 
        if ($3 == 0)
            yyerror("division by zero");
        else
            $$ = $1 / $3; 
    }
    | '(' exp ')'  { $$ = $2; }
    ;

%%

int main(void) {
    printf("CALCULADORA BISON\n");
    printf("Ingresa la operacion, o Ctrl+D para salir\n");
    printf("> "); 
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
