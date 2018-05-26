%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "NodeHeader.h"
	void yyerror(char*);
	void AddNewVar(char*);
	int CheckIfFound(char*);
	int errorNumber = 0;
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
Decleration : DeclerationType EndValueOfDecleration  '=' VarValue ';'
			;
EndValueOfDecleration : VARNAME	{AddNewVar($1);}
						;
Exp : EndValueOfExp '=' VarValue ';'
		| EndValueOfExp '=' EndValueOfExp ';'
	;
EndValueOfExp : VARNAME {CheckIfFound($1);}
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
extern int lineNumber;
extern char* yytext; 
int main(void){
	return yyparse();
}
void AddNewVar(char* VarName){
	if(SearchForNode(VarName) == NULL){
		AddNode(VarName);
	}else{
		errorNumber++;
		printf("Error No.%d\nVar with the name : %s was already declaried error at line No.%d",errorNumber,VarName,lineNumber);
	}
}
int CheckIfFound(char* VarName){
	if(SearchForNode(VarName) == NULL){
		errorNumber++;
		printf("Error No.%d\nVar with the name : %s was not declaried error at line No.%d",errorNumber,VarName,lineNumber);
		return 0;
	}
	return 1;
}
void yyerror(char* s){
	errorNumber++;
	printf ("Error No.%d with the message : %s\n at line No.%d in statment : %s\n",errorNumber,s,lineNumber,yytext);
}

int yywrap(){
return 1;
}
