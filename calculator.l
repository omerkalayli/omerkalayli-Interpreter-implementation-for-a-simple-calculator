%{
#include "calculator.tab.h"
#include <string.h>
#include <stdlib.h> 
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }  
[ \t]+          { /* Boslulklari ignore etmek icin */ }
\n              { return '\n'; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
.               { printf("Invalid char: %s\n", yytext); }

%%
int yywrap() {
    return 1;
}