%{
	/*Declaracoes C diversas */
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#define JAVAENDLEN 24
	#define JAVABEGINLEN 7

	int cont = 0;

	FILE *fp;
	
	/**
    * Retorna os caracteres que se encontram entre </code> e <code [^>]*>
    * @param s String ainda com tags
    * @param len Tamanho da string s
    * @return string que se encontram entre </code> e <code [^>]*>
	*/
	char * btwinTags(char * s, int len){
		int i = JAVABEGINLEN, j = 0;
		char * string = (char *)malloc(len * sizeof(char));
		while(i<len-JAVAENDLEN)
			string[j++] = s[i++];
		return string;
	}

%}

%x body rest

%%


"</code>"["\n" {};|()$&]*"<code "[^>]*">"  {fprintf(fp,"%s",btwinTags(yytext,yyleng)); }

.|\n {fprintf(fp,"%s",yytext);}
%%

int yywrap(){
	return(1);
}

int main(int agrc, char* argv[]) {
	fp = fopen("final.out", "w");
	yylex();
	fclose(fp);
	return 0;
}
