
%{
  #include <stdio.h>
  #include <stdlib.h> 
  void printLexeme();
%}

DIGIT	[0-9]


%%
END	  		{ printf("Exiting interpreter\n"); exit(0);}
; 			{ printf("END_STATEMENT\n");}
	  		{ printf("POINT\n");}
 			{ printf("LINE\n");}
			{ printf("CIRCLE\n");}
			{ printf("RECTANGLE\n");}
			{ printf("SET_COLOR\n");}
{DIGIT}+     		{ printf("INT\t"); printLexeme();}
{DIGIT}+"."{DIGIT}* 	{ printf("FLOAT\t"); printLexeme();}
[A-Za-z]  		{ printf("ALPHA_CHAR\t"); printLexeme();}
.			{ printf("UNRECOGNIZED CHAR\t");}
[\t|\n]+	 	/*Ignoring whitespace, tabs, newlines, and spaces*/;

%%
void printLexeme(){
	printf("(%s)\n", yytext);
}



int main(int argc, char** argv){
	yylex(); //Lex this boy up!
	exit(0);
	return 0;

}
