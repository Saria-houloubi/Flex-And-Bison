%{
#include <stdlib.h>
#include <stdio.h>
#include "parser.tab.h"
%}
Num [0-9]+
Blank [ \t\n]+
Special [><={}]

%%
{Num}	{yylval = atoi(yytext);
		return(NUMBER);
		}
{Special} {return(yytext[0]);}
"+" 	{return(PLUS);}
"-"		{return(MINUS);}
";"		{return(SEMI);}
"("		{return(PR);}
")"		{return(PL);}
"if"	{return(IF);}
"else"	{return(ELSE);}
"then"	{return(THEN);}
"=="	{return(EQUAL);}
"exit"  {return(EXIT);}
{Blank}	{;}
.		{yyerror("UnExpected input %c\n",yytext[0]);}

