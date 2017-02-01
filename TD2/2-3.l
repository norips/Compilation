%{
#include <string.h>
#define NB_COUPLE 10
int res = 0;
struct couple{
    int nbocc;
    char *word;
} couple;

int currCouple = 0;
struct couple coupleFound[NB_COUPLE];
%}

%%

[A-Z][A-Za-z0-9]*    {  int found = 0;
                        for(int i = 0; i < currCouple && i < NB_COUPLE; i++) {
                            if(strcmp(coupleFound[i].word,yytext)==0) {
                                coupleFound[i].nbocc++;
                                found = 1;
                                break;
                            }
                        }
                        if(!found) {
                            coupleFound[currCouple].nbocc = 1;
                            coupleFound[currCouple].word = malloc(sizeof(char)*(strlen(yytext)+1));
                            strcpy(coupleFound[currCouple++].word,yytext);
                        }
                     }
                        
.
%%
int main(int argc,char *argv[]) {
	yylex();
	for(int i = 0; i < currCouple && i < NB_COUPLE; i++) {
	    printf("(%s=%d)",coupleFound[i].word,coupleFound[i].nbocc);
	}
	
}
