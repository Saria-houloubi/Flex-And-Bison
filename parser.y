
%{
	#include <stdio.h>

%}

%token Plus Minus  Number Equal Mult Div Power PR PL
%start input
%left Plus Minus
%left Mult Div
%right Power

%%
input : 
		| input line {printf("The result is %d",$2);}
		;
line : Equal   
		| Exp Equal
		; 
Exp : Number 
		| Exp Plus Exp {$$ = $1 + $3;} 
		| Exp Minus Exp {$$ = $1 - $3;}
		| Exp Mult Exp {$$ = $1 * $3;
						printf("I Am in Mult Rule\n");
							}
		| Exp Div Exp {
						if($3 == 0){
							printf("Can not divide by zero\n");
							}
						else
							$$ = $1 / $3;}
		| Exp Power Exp {
						int x = $1;
						for(int i = 1;i<$3;i++)
							x *=$1;
						$$ = x;
						}

%%
void yyerror(char *s){
	printf ("Error happend %s",s);
}
int yywrap(){
	return 1;
}
int main(void){
	yyparse();
}




