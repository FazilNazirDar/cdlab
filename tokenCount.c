%option noyywrap
%{ 
int n = 0 ; 
%} 


%% 


"while"|"if"|"else" {n++;printf("\t keywords : %s", yytext);} 


"int"|"float" {n++;printf("\t keywords : %s", yytext);} 


[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("\t identifier : %s", yytext);} 


"<="|"=="|"="|"++"|"-"|"*"|"+" {n++;printf("\t operator : %s", yytext);} 


[(){}|, ;] {n++;printf("\t separator : %s", yytext);} 


[0-9]*"."[0-9]+ {n++;printf("\t float : %s", yytext);} 

[0-9]+ {n++;printf("\t integer : %s", yytext);}						 

['\n']  {printf("\n Total number of tokens=%d",n);}
%% 


int main() 

{ 
	
	printf("Enter input text:");
	yylex();
    return 0;
}