%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <math.h>

  float var[26];

  int yylex();
  void yyerror (char *s) {
    printf("%s\n", s);
  }
%}

%union {
  float real;
  int inter;
}

%token INI
%token FIM
%token <real>NUM
%token <inter>VAR
%token SCAN
%token PRINT
%token SQRT

%left '+' '-'
%left '*' '/'
%left ')'
%right '('
%right '^'

%type <real>exp
%type <real>valor

%%

prog: INI cod FIM 
    ;

cod: cod cmdos
    |
    ;

cmdos: PRINT '(' exp ')' {
      printf("%.2f\n", $3);
    }
    |
    SCAN '(' VAR ')' {
      scanf("%f",&var[$3]);
    }
    |
    VAR '=' exp {
      var[$1] = $3;
    }
    ;

exp: exp '+' exp {
      $$ = $1 + $3;    
    }
    | exp '-' exp {
        $$ = $1 - $3;        
    }
    | exp '*' exp {
        $$ = $1 * $3;        
    }
    | exp '/' exp {
        $$ = $1 / $3; 
    }
    | exp '^' exp {
        $$ = pow($1, $3); 
    }
    | SQRT '(' exp ')' {
        $$ = sqrt($3); 
    }
    | '(' exp')' {
        $$ = $2;
    }
    | valor {
        $$ = $1;
      }
    | VAR {
        $$ = var[$1];
    }
    ;

valor: NUM {
      $$ = $1;
    }
;
%%

#include "lex.yy.c"
int main(){
  yyin=fopen("ex.j","r");
  yyparse();
  yylex();
  fclose(yyin);
  return 0;
}