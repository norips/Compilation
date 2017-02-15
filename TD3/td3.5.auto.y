%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyerror(char*);


%}
%union {
    int i;
}
%token <i> NUMBER
%type <i> E T F


%%
S : E '\n'            {printf("Result = %d\n",$1);}
  | E                 {printf("Result = %d\n",$1);}
  ;
E : E '+' T     {$$ = $1 + $3;}
  | E '-' T     {$$ = $1 - $3;}
  | T           {$$ = $1;}
  ;
  
T : T '*' F     {$$ = $1 * $3;}
  | T '/' F     {$$ = $1 / $3;}
  | F           {$$ = $1;}
  ;
  
F : NUMBER      {$$ = $1;}
  | '(' E ')'   {$$ = $2;}
  ;

%%


int yyerror(char *s) {
    fprintf(stderr, "*** ERRROR: %s\n",s);
    return 0;
}

int yywrap() {
    return -1;
}

int main(int argn, char **argv) {
    return yyparse();
}
