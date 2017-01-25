%{
int res;
%}
%s EVEN_A_EVEN_B EVEN_A_ODD_B ODD_A_EVEN_B ODD_A_ODD_B
%%

<EVEN_A_EVEN_B,INITIAL>a	{BEGIN(ODD_A_EVEN_B); printf("Begin ODD_A_EVEN_B\n");}
<EVEN_A_ODD_B>a			{BEGIN(ODD_A_EVEN_B); printf("Begin EVEN_A_EVEN_B\n");}
<ODD_A_EVEN_B>a			{BEGIN(EVEN_A_EVEN_B); printf("Begin ODD_A_ODD_B\n");}
<ODD_A_ODD_B>a			{BEGIN(EVEN_A_ODD_B); printf("Begin ODD_A_EVEN_B\n");}


<EVEN_A_EVEN_B,INITIAL>b	{BEGIN(EVEN_A_ODD_B); printf("Begin EVEN_A_ODD_B\n");}
<EVEN_A_ODD_B>b			{BEGIN(EVEN_A_EVEN_B); printf("Begin EVEN_A_EVEN_B\n");}
<ODD_A_EVEN_B>b			{BEGIN(ODD_A_ODD_B); printf("Begin ODD_A_ODD_B\n");}
<ODD_A_ODD_B>b			{BEGIN(ODD_A_EVEN_B); printf("Begin ODD_A_EVEN_B\n");}

<EVEN_A_ODD_B><<EOF>>		{return 1;}
<<EOF>>				{return 0;}
[^abc\n] 			{ res = 0; return(res);}
%%
int main() {
	if(yylex())
		printf("Valid\n");
	else
		printf("Invalid\n");
}
