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
%type<i> E T F
 


%%
prog: C         {;}

E : E And T     {;}
  | T           {;}
  ;
  
T : T Or F     {;}
  | T Imp F     {;}
  | T Equ F          {;}
  | F
  ;
  
F: '(' E ')'		{;}
 | NUMBER			{;}
 | V			{;}
 | Not V			{;}
 ;

  
C0 : V Af E      {;}
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
