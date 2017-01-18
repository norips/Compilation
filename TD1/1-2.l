%{
int res = 0;
int position = 0;
int pattern[4][100];
int c1=0,c2=0,c3=0,c4=0;

%}

%%
[abc] {position++;}
[^abc\n] { res = 0; return(res);}
cabb { res = 1; pattern[0][c1++] = position; position+=yyleng; }
cbab { res = 2; pattern[1][c2++] = position; position+=yyleng;}
cbb { res = 3; 	pattern[2][c3++] = position; position+=yyleng;}
cbbba {res = 4; pattern[3][c4++] = position; position+=yyleng;}
%%
int main() {
	yylex();
	for(int i = 0; i < c1; i++) {
		printf("(%d,0)",pattern[0][i]);
	}
	for(int i = 0; i < c2; i++) {
		printf("(%d,1)",pattern[1][i]);
	}
	for(int i = 0; i < c3; i++) {
		printf("(%d,2)",pattern[2][i]);
	}
	for(int i = 0; i < c4; i++) {
		printf("(%d,3)",pattern[3][i]);
	}
}
