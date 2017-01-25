%{
int res = 0;
%}
%s PLURIEL
%%
([ ]les[ ]|[ ]quelques[ ]|[ ]des[ ]) 	{BEGIN PLURIEL;printf("%s",yytext);}
([ ](U|u)n[ ]|[ ]le[ ])		{BEGIN INITIAL;printf("%s",yytext);}
loups?				{printf("ours");}
Alpes 				{printf("Pyrennes");}
<PLURIEL>chamois[ ]		{printf("izards ");}
chamois[ ]			{printf("izard ");}
Pralognan			{printf("Saint - Girons");}
%%
int main(int argc,char *argv[]) {
	yylex();
}
