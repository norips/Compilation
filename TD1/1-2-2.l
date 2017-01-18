%{
int res = 0;
int position = 0;
int pattern[4][100];
int c1=0,c2=0,c3=0,c4=0;

%}

%%
[abc] {position++;}
[^abc\n] { res = 0; return(res);}
cabbb { res = 1; pattern[0][c1++] = position; /*position+=yyleng;*/ REJECT}
bbc { res = 2; pattern[1][c2++] = position; /*position+=yyleng;*/ REJECT}
%%
int main() {
	yylex();
	for(int i = 0; i < c1; i++) {
		printf("(%d,0)",pattern[0][i]);
	}
	for(int i = 0; i < c2; i++) {
		printf("(%d,1)",pattern[1][i]);
	}
}
