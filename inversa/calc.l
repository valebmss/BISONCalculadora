/* calc.l - Flex lexer file for a simple calculator */

%{
#include "calc.tab.h"  // Include Bison's generated header
#include <stdlib.h>     // Include for atof function
#include <stdio.h>      // Include for printf function

void yyerror(const char *s);  // Declaration of yyerror
extern int had_error;         // Declare the external error flag
%}

%%

[0-9]+(\.[0-9]+)?  { 
    yylval.num = atof(yytext);  // Convert the text to a double
    return NUMBER;              // Return NUMBER token
}  
[ \t]              ;            // Ignore whitespace
\n                 return '\n'; // Return newline
[-+*/()]           return yytext[0];  // Return operators and parentheses
"|"                return '|';  // Return absolute value symbol

.                  { 
    yyerror("Unknown character");  // Error handling for unknown characters
    had_error = 1;  // Set error flag for unknown characters
}

%%

int yywrap(void) {
    return 1;
}
