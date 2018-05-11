
%{
	#include "parser.tab.h"
	#include <stdlib.h>
%}

Num [0-9]
blank [ \t\n]+ 

%%
{Num}+ {yylval = atoi(yytext);
		return(Number);}
"+"	   {return(Plus);}
"-"	   {return(Minus);}
"="	   {return(Equal);}
"*"	   {return(Mult);}
"/"    {return(Div);}
"^"    {return(Power);}
"("	   {return(PR);}
")"    {return(PL);}
{blank} {;}
.	   {printf("Unexpected input %c\n",yytext[0]);}




