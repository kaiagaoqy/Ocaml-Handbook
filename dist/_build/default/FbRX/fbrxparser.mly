%{

open Fbrxast;;
exception DuplicateLabel

let mkexn n =
  "#" ^ n
%}

/*
 * Tokens
 */

/* basic */
%token LPAREN
%token RPAREN
%token EOEX
%token <string> IDENT

/* literal */
%token <string> STRING
%token <bool> BOOL
%token <int> INT

/* int */
%token PLUS
%token MINUS
%token EQUAL

/* bool */
%token AND
%token NOT
%token OR
%token IF
%token THEN
%token ELSE

/* func and let */
%token FUNCTION
%token GOESTO
%token LET
%token REC
%token IN

/* record */
%token LCURLY
%token RCURLY
%token DOT
%token SEMICOLON
%token APPEND

/* exception */
%token TRY
%token RAISE
%token WITH
%token <string> EXN

/*
 * Precedences and associativities.  Lower precedences come first.
 */
%right prec_let                         /* Let x = ... In ... */
%right prec_fun                         /* function declaration */
%right SEMICOLON                        /* Sequence */
%left EXN
%right prec_if                          /* If ... Then ... Else */
%right OR                               /* Or */
%right AND                              /* And */
%left EQUAL                             /* = */
%left PLUS MINUS                        /* + - */
%right NOT                              /* not e */

/*
 * The entry point.
 */
%start main
%type <Fbrxast.expr> main

%%

main:
  expr EOEX { $1 }
;

expr:
  | appl_expr
      { $1 }
  | expr PLUS expr
      { Plus($1, $3) }
  | expr MINUS expr
      { Minus($1, $3) }
  | expr AND expr
      { And($1, $3) }
  | expr OR expr
      { Or($1, $3) }
  | NOT expr
      { Not $2 }
  | expr EQUAL expr
      { Equal($1, $3) }
  | expr APPEND expr
      { Append($1, $3) }
  | FUNCTION ident_decl GOESTO expr %prec prec_fun
      { Function($2, $4) }
  | IF expr THEN expr ELSE expr %prec prec_if
      { If($2, $4, $6) }
  | LET REC ident_decl ident_decl EQUAL expr IN expr %prec prec_fun
      { LetRec($3, $4, $6, $8) }
  | LET ident_decl EQUAL expr IN expr %prec prec_let
      { Let($2, $4, $6) }
  | TRY expr WITH exn_def IDENT GOESTO expr
      { let n = $4 in Try($2, mkexn n, Ident $5, $7) }
  | RAISE exn_def expr
      { let n = $2 in Raise(mkexn n, $3) }
;

appl_expr:
    simple_expr
      { $1 }
  | appl_expr simple_expr
      { Appl($1,$2) }
;

simple_expr:
    INT
      { Int $1 }
  | BOOL
      { Bool $1 }
  | STRING
      { String $1 }
  | ident_usage
      { $1 }
  | LCURLY record_body RCURLY
      { Record $2 }
  | LCURLY RCURLY
      { Record [] }
  | simple_expr DOT label
      { Select($3, $1) }

  | LPAREN expr RPAREN
      { $2 }
;

record_body:
    label EQUAL expr
      { [($1, $3)] }
  | label EQUAL expr SEMICOLON record_body
      { let rec addifnotpresent (lab, e) l =
          match l with [] -> [(lab,e)]
	   | (l1,e1) :: tl -> if l1=lab then (raise DuplicateLabel) else (l1,e1) :: (addifnotpresent (lab, e) tl)
          in addifnotpresent ($1, $3) $5 }
;

label:
    IDENT
      { Lab $1 }

ident_usage:
    ident_decl
      { Var $1 }
;

ident_decl:
    IDENT
      { Ident $1 }
;

exn_def:
    EXN
       { $1 }
  | LPAREN exn_def RPAREN
       { $2 }
%%
