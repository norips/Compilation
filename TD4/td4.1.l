%{
#include "td4.1.y.tab.h"
%}

%%

[0-1]  {yylval.i = atoi(yytext); return NUMBER;}
:=       { return Af; }
~       { return Not; }
(->)      { return Imp; }
(<->)     { return Equ; }
;       { return Sep; }
(^)       { return And; }
v       { return Or; }
[a-zA-Z]+ {yylval.id = strdup(yytext); return V;}
[ \t\n]		{;} //Ignore

.

%%
