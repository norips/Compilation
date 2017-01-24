%{
int nb_a = 0;
int nb_b = 0;
int res;
%}

%%
[^abc\n] 	{ res = 0; return(res);}
a		{nb_a++;}
b		{nb_b++;}
%%
int main() {
	yylex();
	if(!(nb_a%2) && nb_b%2)
		printf("Valid\n");
	else
		printf("Invalid\n");
}
