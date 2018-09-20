%{
	/*Declaracoes C diversas */
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	int cont = 0;

	FILE *fp;
	

	/*REVER A REGRA FUNCTION2 E BASHPROMPT*/

%}

%x body rest

URL (((http|ftp|https):\/{2})+(([0-9a-z_-]+\.)+(aero|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|ac|ad|ae|af|ag|ai|al|am|an|ao|aq|ar|as|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|cr|cu|cv|cx|cy|cz|cz|de|dj|dk|dm|do|dz|ec|ee|eg|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|io|iq|ir|is|it|je|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mk|ml|mn|mn|mo|mp|mr|ms|mt|mu|mv|mw|mx|my|mz|na|nc|ne|nf|ng|ni|nl|no|np|nr|nu|nz|nom|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|ps|pt|pw|py|qa|re|ra|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sj|sk|sl|sm|sn|so|sr|st|su|sv|sy|sz|tc|td|tf|tg|th|tj|tk|tl|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|za|zm|zw|arpa)(:[0-9]+)?((\/([~0-9a-zA-Z\#\+\%@\.\/_-]+))?(\?[0-9a-zA-Z\+\%@\/&\[\];=_-]+)?)?))

INTNUM [0-9]+

CAMELCASE [a-z]+[A-Z0-9][a-z0-9]+[A-Za-z0-9]*

FLOATNUM ({INTNUM}|[0-9]*"."[0-9]+)

BOOLOP ("<"|">"|"<="|">="|"=="|"!=")


VARNAME [A-Za-z_.\[\]]{1}[A-Za-z_0-9.\[\]]*

KEYWORDS ("switch"|"class"|"extends"|"instanceof"|"protected"|"auto"|"long"|"switch"|"break"|"enum"|"register"|"typedef"|"case"|"extern"|"return"|"union"|"char"|"float"|"short"|"unsigned"|"const"|"signed"|"void"|"continue"|"goto"|"sizeof"|"volatile"|"default"|"static"|"int"|"struct"|"double"|"public"|"private"|"final")

TYPE ("long"|"char"|"float"|"short"|"unsigned"|"void"|"int"|"double"|"String"|"signed")

COMMENT "/*"([^*]|\*+[^*/])*\*+"/"

FUNCTION1 {KEYWORDS}*[ ]*{TYPE}[ ]+{VARNAME}[ ]*"(".*")"[ ]*"{"[^}]*"}"

FUNCTION2 {KEYWORDS}*[ ]*{TYPE}{0,1}[ ]+{VARNAME}[ ]*"(".*")"("{"){0,1}[^;"\n"]*[";"]*("{"){0,1}

FUNCTIONPY "def"[ ]+{METHODCALL}[ ]*":"("\n"[  ]+.*)+

BOOLEXP [A-Za-z_0-9]+[ ]*{BOOLOP}[ ]*[A-Za-z_0-9]+[^";"];

DECLARE {TYPE}[ ]+{VARNAME}[ ]*[^;"\n"]*";"

CICLO ("for"|"while")[ ]*"("[^)]+")"[ ]*("{"[^}]+"}"|[^;]*;)

CLASSICIFELSE "if"[ ]*"("[^)]+")"[ \n]*([^;]*";"|"{"[^}]+"}")

IFELSEINT "("[^)]*")?"[^:"\n"]*":"[^;"\n"]*";"

INCDEF ("#"("define "|"include ").*)|(("import "|"package "|"require ").*";")|("import ".*)

JAVACLASS ({CAMELCASE}|" ")+"{"([^}]+"}")+

METHODCALL [A-Za-z_0-9.]+"("[^)]*")"[;]{0,1}

JAVAASSIGN ({KEYWORDS}|{TYPE})+[ ]+[^;"\n"]*";"

BASHPROMPT [A-Za-z_0-9-]+("@"){0,1}[A-Za-z_0-9-]+:[^"$"'\n']*("$").*


%%

(([^"<code>"]*"<code>"(.|"\n")*"</code>")|{URL}) {/*printf("%d",++cont);*/ fprintf(fp, "%s",yytext ); }

"<a "[^">"]*">"[^"</a>"]*"</a>" {/*printf("%d",++cont);*/ fprintf(fp, "%s",yytext ); }

{DECLARE} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{COMMENT} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{JAVACLASS} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{FUNCTIONPY} {fprintf(fp,"<code language=\"PYTHON\">%s</code>",yytext); }

{JAVAASSIGN} {fprintf(fp,"<code language=\"C/JAVA\">%s</code>",yytext); }

{FUNCTION1} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

(({TYPE}|{KEYWORDS})|{VARNAME})[ ]+{VARNAME}*[ ]*"="[ ]*[^;"<code>"]+";" {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{VARNAME}[ ]*"="[ ]*[^;"\n"]+[;})"] {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{CICLO} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{METHODCALL} {fprintf(fp,"<code language=\"C/JAVA\">%s</code>",yytext); }

{BOOLEXP} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{IFELSEINT} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{CLASSICIFELSE} {fprintf(fp,"<code language=\"C/Java\">%s</code>",yytext); }

{INCDEF} {fprintf(fp,"<code language=\"C/Java/Python\">%s</code>",yytext); }

{BASHPROMPT} {fprintf(fp,"<code language=\"BASHPROMPT\">%s</code>",yytext); }

\<\?php.+?\?\> {fprintf(fp,"<code language=\"PHP\">%s</code>",yytext); }




.|\n {fprintf(fp,"%s",yytext);}
%%

int yywrap(){
	return(1);
}

int main(int agrc, char* argv[]) {
	fp = fopen("tagged.out", "w");
	yylex();
	fclose(fp);
	return 0;
}
