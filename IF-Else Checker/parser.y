%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *s);
%}

%token IF THEN ELSE PR PL PLUS MINUS SEMI EXIT NUMBER ID
%left PlUS MINUS
%start line
%%

line:   
		|ifElse line
		| EXIT {printf("In Exit..");exit(0);}
		;

ifElse:  IF PR condition PL THEN statment ELSE statment SEMI {printf("Accepted If/else\n");}
		|	IF PR condition PL THEN statment SEMI {printf("Accepted If\n");}
		;
condition: exp '>' exp
			| exp '<' exp
			;
statment: exp PLUS exp
		  | exp MINUS exp
		  ;
exp: NUMBER
	|ID
	;
%%
void yyerror(char *s){
	printf("Error happenned %s",s);
}

int yywrap(){
return 1;
}

int main(void){

	return yyparse();
}

