%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "parser.tab.h"
%}

Blank [ \t\n]+
Number [0-9]
Alpha [a-zA-Z]
i [iI]
t [tT]
%%
{Blank} {;}
{Number}+ {  yylval.Num  = atoi(yytext);
				return(NUMBER);}
{Number}+[.]{Number}+ { yylval.Real_Num = atof(yytext);    
				return(REALNUMBER);}
{i}[nN]{t} {return(INT_DEC);}
"char" {return(CHAR_DEC);}
"chain" {return(CHAIN_DEC);}
"real"  {return(REAL_DEC);}
"exit"  {return(EXIT);}
\'.\'  { yylval.Char_Value = yytext[0];
			return(ONECHAR);}
\".+\" { yylval.Chain_Value = yytext;
			return(CHAIN);}
{Alpha}+ {yylval.VarName = yytext;
				return(VARNAME);}
[=;]   {return(yytext[0]);}
.    {printf("Unexpected input %c\n",yytext[0]);}
