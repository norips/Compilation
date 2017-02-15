%{


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
int yyerror(char*);

%}


%start A
%%
A: S '\n'  {;}
 | S       {;}
 ;            
S : 'a' S 'b'
  | 'a' 'b'
  ;

%%

int yylex() {
    return getchar();
}

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
