%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "environ.h"
extern int yylex();
extern int yyerror(char*);
ENV e;

%}
%union {
    int i;
    char *id;
}
%token Not Af Or Imp Equ And NUMBER Sep
%token<id> V
%type<i> E T F NUMBER
 


%%
prog: C         {ecrire_env(e);}

E : E And T     {$$ = $1 & $3;}
  | T           {$$ = $1;}
  ;
  
T : T Or F     { $$ = $1 | $3;}
  | T Imp F     {$$ = !$1 || $3;}
  | T Equ F          {$$ = $1 == $3;}
  | F           {$$ = $1;}
  ;
  
F: '(' E ')'		{$$ = $2;}
 | NUMBER			{$$ = $1;}
 | V			{initenv(&e,$1); $$ = valch(e, $1);}
 | Not V			{initenv(&e,$2); $$ = !valch(e, $2);}
 ;

  
C0 : V Af E      {initenv(&e,$1); affect(e,$1,$3);}
   | '(' C ')'   {;}
   ;

C : C Sep C0       {;}
  | C0             {;}
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
    e = Envalloc();
    return yyparse();
}
