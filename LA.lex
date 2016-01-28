%{
#include<stdio.h>
int c=0;
int f=0;
%}

h #include<[a-z]+\.h>
key (auto)|(break)|(case)|(char)|(const)|(continue)|(default)|(do)|(double)|(else)|(enum)|(extern)|(float)|(for)|(goto)|(if)|(int)|(long)|(register)|(return)|(short)|(signed)|(sizeof)|(static)|(struct)|(switch)|(typedef)|(union)|(unsigned)|(void)|(volatile)|(while)
co "("
fo "{"
cc ")"
fc "}"


id [a-z]+[0-9]*_?
conint ([1-9][0-9]*(\.[0-9]+)?)|(0)

constr \"[^\"]\"
op  [-+=/*/^]
func [a-z0-9]+\([^)]*\)
slcomm "//".*
mlcommop "/*"
mlcommcl "*/"
new      \n 
sc	     ;



%%
{h}        {printf("%s is a header\n",yytext);}

{key}      {printf("%s is a keyword\n",yytext);}

{id}       {printf("%s is an identifier\n",yytext);}

{conint}   {printf("%s is an integer constant\n",yytext);}

{constr}   {printf("%s is a string\n",yytext);}

{op}       {printf("%s is a operator\n",yytext);}

{func}     {printf("%s is a function call\n",yytext);}

{co}       {c++;}
{cc}       {c--;}
{fo}       {f++;}
{fc}       {f--;}

<<EOF>>    { if(c!=0)
	     			 {
							 printf("Unmatched parentheses\n");
						 }
             if(f!=0)
						 {
             	 printf("Unmatched braces\n");
             }
           }

{new}      {if(c!=0)
						{
							printf("Unmatched parentheses.\n");
            }}

{slcomm}		{printf("%s is a comment\n",yytext);}

%%


int main(int argc, char **argv)
{
	FILE *in;
	if(argc==2 && (in=fopen(argv[1],"r")))
	{
		yyin=in;
	}
	yylex();
	return 0;
}   