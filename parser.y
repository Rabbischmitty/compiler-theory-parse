/* CMSC 430 Compiler Theory and Design
   Project 2 Skeleton
   UMGC CITE
   Summer 2023 

   Project 2 Parser */

%{

#include <string>

using namespace std;

#include "listing.h"

int yylex();
void yyerror(const char* message);

%}

%define parse.error verbose

%token IDENTIFIER INT_LITERAL CHAR_LITERAL REAL_LITERAL HEX_LITERAL

%token ADDOP MULOP ANDOP RELOP OROP NOTOP MODOP EXPOP NEGOP ARROW

%token LPAREN RPAREN SEMICOLON COLON COMMA 

%token BEGIN_ CASE CHARACTER ELSE ELSIF END ENDSWITCH FUNCTION INTEGER IS LIST OF OTHERS
	RETURNS SWITCH WHEN ENDFOLD ENDIF FOLD IF LEFT RIGHT THEN REAL


%left ADDOP
%left MULOP MODOP 
%right EXPOP
%left ANDOP OROP 
%left NOTOP NEGOP 


%%

function: function_header variables body

variables: /* empty */ | variables variable

function_header: FUNCTION IDENTIFIER parameters_opt RETURNS type SEMICOLON
	| error SEMICOLON
	;

parameters_opt: /* empty */ | parameters

variable: IDENTIFIER COLON type IS statement
	| IDENTIFIER COLON LIST OF type IS list SEMICOLON 
	| error SEMICOLON 
	;

list: LPAREN expressions RPAREN

expressions: expression 
	| expressions COMMA expression
	;

parameters: parameter 
	| parameters COMMA parameter
	;

parameter: IDENTIFIER COLON type

type: INTEGER | REAL | CHARACTER

body: BEGIN_ statements END SEMICOLON 
	| error SEMICOLON

statements: statement | statements statement

statement: expression SEMICOLON
         | WHEN condition COMMA expression COLON expression SEMICOLON 
         | SWITCH expressions IS cases OTHERS ARROW statements ENDSWITCH SEMICOLON 
         | IF condition THEN statement elsif_clauses else_clause ENDIF SEMICOLON
         | FOLD direction operator list_choice ENDFOLD SEMICOLON
	;

elsif_clauses: /* empty */ | ELSIF condition THEN statement elsif_clauses

else_clause: ELSE statements

cases: case 
	| cases case

case: CASE INT_LITERAL ARROW statement
	| error SEMICOLON
	;

direction: LEFT | RIGHT

operator: ADDOP | MULOP

list_choice: list | IDENTIFIER

condition: expression RELOP expression
	 | condition logical_operator condition  
         | LPAREN condition RPAREN 
         | NOTOP condition

logical_operator:
	ANDOP | OROP

expression: term 
	| expression ADDOP term

term: factor 
	| term MULOP factor 
	| term MODOP factor

factor: base 
	| NEGOP factor

base: primary 
	| base EXPOP primary

primary: INT_LITERAL 
       | REAL_LITERAL 
       | CHAR_LITERAL
       | HEX_LITERAL 
       | IDENTIFIER 
       | IDENTIFIER LPAREN expressions_opt RPAREN 
       | LPAREN expression RPAREN
	;

expressions_opt: /* empty */ | expressions

%%

void yyerror(const char* message) {
	appendError(SYNTAX, message);
}

int main(int argc, char *argv[]) {
	firstLine();
	yyparse();
	lastLine();
	return 0;
} 
