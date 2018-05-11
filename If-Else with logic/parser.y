%{
#include <stdio.h>
#include <stdbool.h>
#include<stdlib.h>
void yyerror(char *s);
%}
%token IF ELSE NUMBER PLUS MINUS SEMI PR PL THEN EQUAL EXIT
%left EQUAL
%left  PLUS MINUS
%left IF ELSE
%%
line:   
		|ifELse line
		|EXIT {printf("Bye bye");exit(0);}
		;
ifELse:	IF PR Condition PL THEN Statment ELSE Statment SEMI{
														if($3){
															printf("In the if true part\n");
															printf("The statment was executed with the value of %d\n",$6);
															}
														else{
															printf("In the else part\n");
															printf("The statment was executed with the value of %d\n",$8);
															}
															printf("\n");
														}
		| IF PR Condition PL THEN Statment SEMI{
											if($3){
													printf("Correct condition statment value is %d",$6);
													}
											else
												printf("incorrect condition");	
											
											printf("\n");
											}
		;
Condition:	Exp '>' Exp {$$ =  $1 > $3? 1: 0 ;}
			| Exp '<' Exp {$$ =  $1 < $3? 1: 0; }
			| Exp EQUAL Exp {$$ = $1 == $3? 1: 0 ; }
			| NUMBER
			;
Statment:	Exp
			| line
			;
Exp:		NUMBER
			| Exp PLUS Exp {$$ = $1 + $3;}
			| Exp MINUS Exp {$$ = $1 - $3;}
			;
%%
void yyerror(char *s){
	printf("Error happend %s",s);
}
int yywrap(){
return 1;
}
int main(void){
	return yyparse();
}