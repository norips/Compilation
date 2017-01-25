%{
int res=0;
%}

%%
abb {res = res + 1;}
[^abc\n] {res = 0;return(res);}
%%
int main(int argc,char *argv[]) {
	yylex();
	if(res != 0){
		printf("Pattern match %d",res);
	}	
}
