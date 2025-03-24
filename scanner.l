/* CMSC 430 Compiler Theory and Design
   Project 1 Skeleton
   UMGC CITE
   Summer 2023 */

/* This file contains flex input file */

%{
#include <cstdio>
#include <string>

using namespace std;

#include "listing.h"
#include "tokens.h"

%}

%option noyywrap

ws		[ \t\r]+
comment		"//".*\n
line_comment	"--".*\n
line		[\n]
id		[A-Za-z]+("_"?"_"?[A-Za-z0-9]+)*
digit		[0-9]
dec		{digit}+
realit  	{digit}*("."{digit}*)?([eE][+-]?{digit}+)?
hex		\#[0-9A-Fa-f]+
escape      	\\[btnrf']
char        	\'([^'\\]|{escape})\'
punc		[\(\),:;]
%%

{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine(); }
{line_comment}	{ ECHO; nextLine(); }
{line}		{ ECHO; nextLine(); }
"+"		{ ECHO; return(ADDOP); }
"-"		{ ECHO; return(ADDOP); }
"*"		{ ECHO; return(MULOP); }
"/"		{ ECHO; return(MULOP); }
"&"		{ ECHO; return(ANDOP); }
"<"		{ ECHO; return(RELOP); }
"="		{ ECHO; return(RELOP); }
"<>"		{ ECHO; return(RELOP); }
">"		{ ECHO; return(RELOP); }
">="		{ ECHO; return(RELOP); }
"<="		{ ECHO; return(RELOP); }
"|"		{ ECHO; return(OROP); }
"!"		{ ECHO; return(NOTOP); }
"%"		{ ECHO; return(MODOP); }
"^"		{ ECHO; return(EXPOP); }
"~"		{ ECHO; return(NEGOP); }
"=>"		{ ECHO; return(ARROW); }
"("		{ ECHO; return(LPAREN); }
")"		{ ECHO; return(RPAREN); }
":"		{ ECHO; return(COLON); }
";"		{ ECHO; return(SEMICOLON); }
","		{ ECHO; return(COMMA); }
begin		{ ECHO; return(BEGIN_); }
case		{ ECHO; return(CASE); }
character	{ ECHO; return(CHARACTER); }
end		{ ECHO; return(END); }
endswitch	{ ECHO; return(ENDSWITCH); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
list		{ ECHO; return(LIST); }
of		{ ECHO; return(OF); }
others		{ ECHO; return(OTHERS); }
returns		{ ECHO; return(RETURNS); }
switch		{ ECHO; return(SWITCH); }
when		{ ECHO; return(WHEN); }
else		{ ECHO; return(ELSE); }
elsif		{ ECHO; return(ELSIF); }
endfold		{ ECHO; return(ENDFOLD); }
endif		{ ECHO; return(ENDIF); }
fold		{ ECHO; return(FOLD); }
if		{ ECHO; return(IF); }
left		{ ECHO; return(LEFT); }
right		{ ECHO; return(RIGHT); }
then		{ ECHO; return(THEN); }
real		{ ECHO; return(REAL); }

{id}		{ ECHO; return(IDENTIFIER);}
{dec}		{ ECHO; return(INT_LITERAL); }
{hex}		{ ECHO; return(HEX_LITERAL); }
{realit}	{ ECHO; return(REAL_LITERAL); }
{char}		{ ECHO; return(CHAR_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }
%%