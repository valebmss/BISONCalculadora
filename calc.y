/* calc.y - Bison grammar file for a simple calculator */

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>  // Include math.h for fabs function

void yyerror(const char *s);
int yylex(void);
int had_error = 0;  // Flag to track if an error occurred
%}

/* Declare tokens */
%token <num> NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS  // To handle negative numbers

%union {
    double num;  // Change to double for handling decimal numbers
}

/* Declare types for non-terminals */
%type <num> exp

%%

calclist:
    | calclist exp '\n'  { 
        if (!had_error) {  // Only print if there was no error
            if ($2 == (int)$2)  // Check if the result is an integer
                printf("= %d\n", (int)$2);
            else
                printf("= %lf\n", $2);
        }
        had_error = 0;  // Reset error flag for next calculation
    }
    | calclist '\n'
    ;

exp:
    NUMBER                 { $$ = $1; }
    | exp '+' exp          { $$ = $1 + $3; }
    | exp '-' exp          { $$ = $1 - $3; }
    | exp '*' exp          { $$ = $1 * $3; }
    | exp '/' exp          { 
        if ($3 == 0) {
            yyerror("division by zero");
            had_error = 1;  // Set error flag
        } else {
            $$ = $1 / $3; 
        }
    }
    | '-' exp %prec UMINUS { $$ = -$2; }  // Unary minus
    | '(' exp ')'          { $$ = $2; }
    | '|' exp '|'          { $$ = fabs($2); }  // Absolute value using fabs
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
