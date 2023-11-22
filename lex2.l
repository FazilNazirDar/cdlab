%{
    #include<stdio.h>
    int sl=0,ml=0;
%}

%%

"/*" [a-zA-Z0-9' '\t\n]+ "*/" ml++;

"//".* sl++;

%%
int yywrap(){
     return 1;
}
int main(){
    yyin=fopen("f1.c","r");
    yyout=fopen("f2.c","w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    printf("Number of multiple line comments are %d",ml);
    printf("Number of single line comments are %d",sl);
    yywrap();
    return 0;
}