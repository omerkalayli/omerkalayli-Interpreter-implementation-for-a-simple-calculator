%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();
int hasError = 0;

%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN

%left PLUS MINUS
%left TIMES DIVIDE

%%

calculation:
    | calculation expr '\n' { 
        if (!hasError) {
            printf("Sonuç: %d\n", $2); 
        } else {
            hasError = 0;
        }
    }
    | calculation '\n' 

expr:
    expr PLUS expr    { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr TIMES expr { $$ = $1 * $3; }
    | expr DIVIDE expr { 
        if($1 == 0 && $3 == 0) {
            yyerror("Hata: Sıfıra bölme!");
            printf("Sonuç: Belirsiz.\n");
            hasError = 1;
        } 
        else if ($3 == 0) {
            yyerror("Hata: Sıfıra bölme!");
            printf("Sonuç: Tanımsız.\n");
            hasError = 1;
        } else {
            $$ = $1 / $3;  // Bölme işlemi
        }
    }
    | NUMBER { $$ = $1; }
    | LPAREN expr RPAREN { $$ = $2; } 
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata: %s\n", s);
}

int main() {
    printf("Calculator\n");
    while (1) {
        yyparse();
    }
    return 0;
}