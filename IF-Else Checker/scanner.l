%{
#include<stdlib.h>
#include "parser.tab.h"
%}
number [0-9]+
alpha [A-Za-z]
conditionSign [><]
blank [ \t\n]+
I [iI]
F [fF]
%%
{number}	{
				yylval = atoi(yytext);
				return(NUMBER);}
{conditionSign} {return(yytext[0]);}
{I}{F} {return(IF);}
"else"		{return(ELSE);}
"then"		{return(THEN);}
";"		{return(SEMI);}
"+"		{return(PLUS);}
"-"		{return(MINUS);}
"("		{return(PR);}
")"		{return(PL);}
"exit"	{return(EXIT);}
{blank} {;}
{alpha}({alpha}|{number})* {return(ID);}

.		{printf("Unexpected Input %c\n",yytext[0]);}
%%