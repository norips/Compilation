%{
int res = 0;
%}
%s PLURIEL
%%
([ ](L|l)es[ ]|[ ](Q|q)uelques[ ]|[ ](D|d)es[ ]) 	{BEGIN PLURIEL;printf("%s",yytext);}
([ ](U|u)n[ ]|[ ](L|l)e[ ])		{BEGIN INITIAL;printf("%s",yytext);}
loups?				{printf("ours");}
Alpes 				{printf("Pyrennes");}
<PLURIEL>chamois[ ]		{printf("izards ");}
chamois[ ]			{printf("izard ");}
Pralognan			{printf("Saint - Girons");}
%%
int main(int argc,char *argv[]) {
	yylex();
}
