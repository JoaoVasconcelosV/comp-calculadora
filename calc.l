%{
  //definições em C
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>  
%}
  //definições regulares
INI "inicio"
FIM "final"

NUM [0-­9]+\.?[0-9]*
VAR {LETRAS}({LETRAS}|{NUM_INT}|"_")*
LETRAS [a-zA-Z]+
NUM_INT [0-9]+

IGNORAR [\ \n\t]
INVALIDO .

COMENTARIO1 "@@".*
COMENTARIO2 "@""*"(.|\n)*"*""@"

PRINT "mostrar"
SCAN "ler"

SQRT "SQRT"

%%
    //definições  dos tokens
[-+()=/*^] {
  return *yytext;
}

{INI} {
  return INI;
}

{FIM} {
  return FIM;
}

{PRINT} {
  return PRINT;
}

{SCAN} {
  return SCAN;
}

{SQRT} {
  return SQRT;
}

{VAR} {
  yylval.inter = *yytext - 'a';
  return VAR;
}

{NUM} {
  yylval.real = atof(yytext);
  return NUM;
}

{COMENTARIO1} {;}
{COMENTARIO2} {;}
{IGNORAR} {;}
{INVALIDO} {;}

[\ \n\t]* {;}
%%