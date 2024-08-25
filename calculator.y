%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char *);
%}


%token INT
%left '+' '-'
%left '*' '/'
%%
L:E '\n' {printf("%d\n",$1);}
 |
 ;
E:E '+' T {$$ = $1 + $3;} 
|E '-' T {$$ = $1 - $3;}
|T   {$$ = $1;}
 ;
T:T '*' F {$$ = $1 * $3;}
|T '/' F {if($3==0)
		{ yyerror("Division by ZERO not allowed!!!");
		exit(1);} 
	$$ = $1 / $3;}
|F   {$$ = $1;}
 ;
F:'(' E ')' {$$ = $2;}
|INT   {$$ = $1;}
 ;

%%

void yyerror(char *s){
printf("%s\n", s);
}

int main(){
yyparse();
return 0;
}