%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "1607114.tab.h"
%}

alpha [a-zA-Z]
digit [0-9]
header					"import"[ ]*+[^\n]+[.h][ ]*
keyWord					IF|ELSE|FOR|RETURN|INTEGER|FLOAT|CHAR|SWITCH|CASE|BREAK|DEFAULT|PF
singleLineComment		[ ]*[#][#][a-zA-Z0-9@$%^&*(){}_+-,.:\|?>< ]*
multipleLineComment		[ ]*[!][#][a-zA-Z0-9@$*(){}_+-,.:\|?><\n\t ]*[#][!]

%%

{digit}+	{ yylval = atoi(yytext); return NUM; }
{alpha}	    { yylval = *yytext - 'a'; return	VAR; }

SWITCH 		   { return SWITCH; }
Print 		       { return PF; }
CASE   		   { return CASE;  }
IF 			   { return IF;   }
ELSE 		   { return ELSE; }
BREAK  		   { return BREAK;  }
DEFAULT 	   { return DEFAULT; }
"{" 		   { return START;  }
"}"  		   { return END;	}
FOR 		   { return FOR;}
SIN			   {return SIN;}
COS            {return COS;}
TAN            {return TAN;}
LOG			   {return LOG;}
LOG10 		   {return LOG10;}
BIGMOD  	   {return BIGMOD;}
FACT          {return FACT;}
GCD         {return GCD;}
LCM 				{ return LCM;}
PRIME				{return PRIME;}
POWER				{return POWER;}
PYRAMID     {return PYRAMID;}
WHILE  			{return WHILE;}



{singleLineComment}		{}
{multipleLineComment}	{}
{header}  				{}
[-+/*<>=,():;%^]     {yylval = yytext[0];	return *yytext;	}
INTEGER  			 {return INT;}
CHAR 		         {return CHAR;}
FLOAT 			 	{return FLOAT;}
"main"	   { return MAIN; }
"Func_"([a-z]|{alpha})+ { return FUNC;}
[ ]*	    			{}
[\n]*					{}
[\t]*					{}
.						{printf("%s --> invalid\n",yytext);}


%%
int yywrap()
{
	return 1;
}

int main()
{
	freopen("input.txt","r",stdin);
	freopen("output.txt","w",stdout);
	yyparse();

	return 0;
}
