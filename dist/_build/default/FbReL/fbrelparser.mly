%{

open Fbrelast;;
exception DuplicateLabel

%}

/*
 * Tokens
 */

%token AND
%token <bool> BOOL
%token DOT
%token ELSE
%token EOEX
%token EQUAL
%token FUNCTION
%token GOESTO
%token <string> IDENT
%token IN
%token IF
%token <int> INT
%token LET
%token LCURLY
%token LPAREN
%token MINUS
%token NOT
%token OR
%token PLUS
%token RCURLY
%token RPAREN
%token THEN
%token SEMICOLON
%token MATCH
%token WITH
%token PIPE
%token LBRACKET
%token RBRACKET
%token CONS

/*
 * Precedences and associativities.  Lower precedences come first.
 */
%right prec_let                         /* Let x = ... In ... */
%right prec_fun                         /* function declaration */
%left prec_match_body                   /* Match ... With | ... -> e */
%right SEMICOLON                        /* Sequence */
%right prec_if                          /* If ... Then ... Else */
%right OR                               /* Or */
%right AND                              /* And */
%left EQUAL                             /* = */
%left PLUS MINUS                        /* + - */
%right NOT                              /* not e */
%right CONS                             /* :: */

/*
 * The entry point.
 */
%start main
%type <Fbrelast.expr> main

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
  | FUNCTION ident_decl GOESTO expr %prec prec_fun
      { Function($2, $4) }
  | IF expr THEN expr ELSE expr %prec prec_if
      { If($2, $4, $6) }
  | LET ident_decl EQUAL expr IN expr %prec prec_let
      { Let($2, $4, $6) }
  | MATCH expr WITH  LBRACKET RBRACKET GOESTO expr
       PIPE ident_decl CONS ident_decl GOESTO expr %prec prec_match_body
      { Match($2, $7, $9, $11, $13) }
  | LBRACKET RBRACKET
      { EmptyList }
  | LBRACKET expr RBRACKET
      {
        let rec seq_to_list e = match e with
          | Cons(e1, e2) -> Cons(e1, seq_to_list e2)
          | v -> Cons(v, EmptyList)
        in
          seq_to_list $2
      }
  | expr SEMICOLON expr
      { Cons($1, $3) } /* OK this is a hack.. need to restrict it to lists  */
  | expr CONS expr
      { Cons($1, $3) }
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


%%
