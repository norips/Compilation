%{
int nb_a = 0;
int nb_b = 0;
int nb_c = 0;
int res;
%}

%%
(aa)+b		{	
			printf("[");
			for(int i = 0; i < yyleng; i++) {
				if(yytext[i] == 'a')
					printf("b");
				if(yytext[i] == 'b')
					printf("c");
			}
			printf("]");		
		}
(ab)+b		{	
			printf("[");
			for(int i = 0; i < yyleng; i++) {
				if(yytext[i] == 'a')
					printf("c");
				if(yytext[i] == 'b')
					printf("d");
			}
			printf("]");		
		}
[a,b]		{printf("[%s]",yytext);}
[^abc\n] 	{ res = 0; return(res);}
%%
int main() {
	yylex();
}
