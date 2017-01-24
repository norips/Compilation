%{
int nb_a = 0;
int nb_b = 0;
int nb_c = 0;
int res;
%}

%%
(aa)+b		{printf("[%s]",yytext);}
(ab)+b		{printf("[%s]",yytext);}
[a,b]		{printf("[%s]",yytext);}
[^abc\n] 	{ res = 0; return(res);}
%%
int main() {
	yylex();
}
