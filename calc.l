/* calc.l - Flex lexer file for a simple calculator */

%{
#include "calc.tab.h"
void yyerror(const char *s);  // Declaración de yyerror

%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[ \t]       /* ignore whitespace */;
\n          return '\n';
[-+*/()]    return yytext[0];
.           { yyerror("Unknown character"); }

%%

int yywrap(void) {
    return 1;
}

