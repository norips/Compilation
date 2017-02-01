%{

%}

%s COMMENT
%%

\/\*[ ]begindebug         {BEGIN COMMENT;}
<COMMENT>enddebug[ ]\*\/           {BEGIN INITIAL;} 
<COMMENT>.                 {}
<COMMENT>[ \n\t]                 {}
%%
int main(int argc,char *argv[]) {
	yylex();
}
