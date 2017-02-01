%{
#define NB_FUNC 10
struct func{
    int nbParms;
    char *word;
} func;
struct func funcFound[NB_FUNC];
int nbFunc = 0;
int currFunc = 0;
int currArgs = 0;
%}

%s FUN COUNT
END [)]
COM [,]
INT int
BOOL bool
ARRAY array[ ]of[ ]type

%%

defun[ ][A-Za-z0-9]+               {   BEGIN FUN; 
                                    funcFound[nbFunc].word = malloc(sizeof(char) * (strlen(yytext)+1));
                                    strcpy(funcFound[nbFunc].word,yytext+6);
                                    funcFound[nbFunc].nbParms=0;}
<FUN>{INT}{COM}                 {funcFound[nbFunc].nbParms++;}
<FUN>{BOOL}{COM}                {funcFound[nbFunc].nbParms++;}
<FUN>{ARRAY}[{INT}|{BOOL}]{COM} {funcFound[nbFunc].nbParms++;}

<FUN>{INT}{END}                 {funcFound[nbFunc].nbParms++;nbFunc++;BEGIN INITIAL;}
<FUN>{BOOL}{END}                {funcFound[nbFunc].nbParms++;nbFunc++;BEGIN INITIAL;}
<FUN>{ARRAY}[{INT}|{BOOL}]{END} {funcFound[nbFunc].nbParms++;nbFunc++;BEGIN INITIAL;}

[A-za-z0-9]+                     {
                                    for(int i = 0; i < nbFunc; i++) {
                                        if(strcmp(funcFound[i].word,yytext) == 0){
                                            BEGIN COUNT;
                                            currFunc=i;
                                        }
                                    }
                                }

<COUNT>,                        {currArgs++;}
<COUNT>\)                        {
                                    BEGIN INITIAL; currArgs++; 
                                    if(funcFound[currFunc].nbParms == currArgs) {
                                        printf("Valid %s\n",funcFound[currFunc].word);
                                    } else {
                                        printf("Invalid %s\n",funcFound[currFunc].word);
                                    }
                                    currArgs = 0;
                                    currFunc = 0;
                                }
.
%%
int main(int argc,char *argv[]) {
	yylex();
	for(int i = 0; i < nbFunc;i++) {
	    printf("Fun=%s,parms=%d\n",funcFound[i].word,funcFound[i].nbParms);
	}
	
}
