%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

%}
%option noyywrap
%array

ID [a-zA-Z][a-zA-Z0-9]*
NUM [0-9]*
PALABRA_CLAVE AND|OR|IF|NOT

%%

{NUM}	{
	fprintf(yyout, "numero: %s", yytext);
}
{ID}	{
	fprintf(yyout, "identificador: %s", yytext);
}

%%

int main(argc, argv)
int argc;
char** argv;
{
	yyin = fopen("entrada.txt", "r");
	yyout = fopen("salida.txt", "w");
	yylex();
	fclose(yyin);
	fclose(yyout);
}