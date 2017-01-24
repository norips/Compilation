%{
int res;
%}
%s EVEN_A EVEN_B ODD_A ODD_B
%%
<ODD_A>a			{BEGIN(EVEN_A); printf("Begin EVEN_A\n");}
a				{BEGIN(ODD_A); printf("Begin ODD_A\n");}
<ODD_B>b			{BEGIN(EVEN_B); printf("Begin EVEN_A\n");}
b				{BEGIN(ODD_B); printf("Begin ODD_B\n");}
<EVEN_A,ODD_B><<EOF>>		{return 1;}
<<EOF>>				{return 0;}		
[^abc\n] 			{ res = 0; return(res);}
%%
int main() {
	if(yylex())
		printf("Valid\n");
	else
		printf("Invalid\n");
}
