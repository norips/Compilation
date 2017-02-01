%{
int res = 0;
%}
%s Je Tu IlElle Nous Vous IlsElles
%%
(J|j)e	 				{BEGIN Je;printf("%s",yytext);}
(T|t)u					{BEGIN Tu;printf("%s",yytext);}
((I|i)l|(E|e)lle)			{BEGIN IlElle;printf("%s",yytext);}
(N|n)ous				{BEGIN Nous;printf("%s",yytext);}
(V|v)ous				{BEGIN Vous;printf("%s",yytext);}
((I|i)ls|(E|e)lles)			{BEGIN IlsElles;printf("%s",yytext);}
<Je>\[[A-za-z]\]			{yytext[yyleng-3]=0;printf("%se",yytext+1);}
<Tu>\[[A-za-z]+er\]			{yytext[yyleng-3]=0;printf("%ses",yytext+1);}
<IlElle>\[[A-za-z]+er\]			{yytext[yyleng-3]=0;printf("%se",yytext+1);}
<Nous>\[[A-za-z]+er\]			{yytext[yyleng-3]=0;printf("%sons",yytext+1);}
<Vous>\[[A-za-z]+er\]			{yytext[yyleng-3]=0;printf("%sez",yytext+1);}
<IlsElles>\[[A-za-z]+er\]		{yytext[yyleng-3]=0;printf("%sent",yytext+1);}
%%
int main(int argc,char *argv[]) {
	yylex();
}
