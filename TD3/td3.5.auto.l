%{
#include "td3.5.auto.y.tab.h"
%}

%%


[0-9]+  {yylval.i = atoi(yytext); return NUMBER;}
.       {return yytext[0];}

%%
