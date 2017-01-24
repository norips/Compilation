%{
int nb_a = 0;
int nb_b = 0;
int nb_c = 0;
int res;
%}

%%
a		{nb_a++;}
b		{nb_b++;}
c		{nb_c++;}
[^abc\n] 	{ res = 0; return(res);}
%%
int main() {
	yylex();
	if(nb_a == nb_b && nb_b == nb_a)
		printf("Valid\n");
	else
		printf("Invalid\n");
}
