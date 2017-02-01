%{
#include "bilquad.h"
#include "environ.h"
char *etiq,*arg1,*arg2,*res;
int op;
%}

%s OPE ARG ARG2 DEST
%%

ET[0-9]+   {BEGIN OPE; printf("ETQ=%s",yytext);}
<OPE>:      {BEGIN ARG; printf("OPE=%s",yytext+1);}
<ARG>:      {BEGIN ARG2;printf("ARG=%s",yytext+1);}
<ARG2>:     {BEGIN DEST;printf("ARG2=%s",yytext+1);}
<DEST>:      {BEGIN INITIAL;printf("DEST=%s",yytext+1);}

%%
int main(int argc,char *argv[]) {
	yylex();
}
