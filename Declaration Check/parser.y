%{
	#include <stdio.h>
	#include <stdlib.h>
	void yyerror(char*);
%}
%union { char* VarName;
		int Num;
		char Char_Value;
		float Real_Num;
		char* Chain_Value;}
%token INT_DEC CHAR_DEC CHAIN_DEC REAL_DEC EXIT
%token <VarName> VARNAME
%token <Num> NUMBER
%token <Char_Value> ONECHAR
%token <Chain_Value> CHAIN
%token <Real_Num>	REALNUMBER
%start line

%%
line :  Input line
		| EXIT {exit(0);}
		;
Input : Decleration {printf("Decleration Accepted\n")}; 
		| Exp {printf("Exp Accepted\n")};
		;
Decleration : DeclerationType VARNAME  '=' VarValue ';'
			;
Exp : VARNAME '=' VarValue ';'
	;
DeclerationType : INT_DEC
					| CHAR_DEC
					| CHAIN_DEC
					| REAL_DEC
					;
VarValue: 	NUMBER
			| ONECHAR
			| CHAIN
			| REALNUMBER
			;
%%

void yyerror(char* s){
	printf ("Error %s\n",s);
}

int yywrap(){
return 1;
}

int main(void){
	return yyparse();
}
