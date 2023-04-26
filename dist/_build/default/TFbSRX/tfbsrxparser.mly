%{

open Tfbsrxast;;
open Tfbsrxpp;;

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
%token GET
%token GOESTO
%token <string> IDENT
%token IF
%token IN
%token <int> INT
%token LCURLY
%token LET
%token LPAREN
%token MINUS
%token NOT
%token OR
%token PLUS
%token RCURLY
%token REC
%token REF
%token RPAREN
%token SEMI
%token SET
%token THEN
%token COLON
%token TRY
%token RAISE
%token WITH
%token <string> EXN

%token INTTYPE
%token BOOLTYPE

/*
 * Precedences and associativities.  Lower precedences come first.
 */
%right prec_fun GOESTO                  /* function declaration, with clause */
%left EXN
%right prec_if                          /* If ... Then ... Else */
%left RAISE                             /* Raise e */
%right SET                              /* := (assignment) */
%right OR                               /* Or */
%right AND                              /* And */
%left EQUAL                             /* = */
%left PLUS MINUS                        /* + - */
%right NOT REF GET                      /* !e, not e, ref e, etc. */

/*
 * The entry point.
 */
%start main
%type <Tfbsrxast.expr> main

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
  | FUNCTION ident_decl COLON type_decl GOESTO expr %prec prec_fun
      { Function($2, $4, $6) }
  | LET REC ident_decl ident_decl COLON type_decl EQUAL expr COLON type_decl IN expr %prec prec_fun
      { LetRec($3, $4, $6, $8, $10, $12) }
  | IF expr THEN expr ELSE expr %prec prec_if
      { If($2, $4, $6) }
  | REF expr
      { Ref $2 }
  | expr SET expr
      { Set($1, $3) }
  | GET expr
      { Get $2 }
  | TRY expr WITH exn_def IDENT GOESTO expr
      { let (n, t) = $4 in Try($2, n, Ident $5, t, $7) }
  | RAISE exn_def expr
      { let (n, t) = $2 in Raise(n, t, $3) }
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
  | LPAREN expr RPAREN
      { $2 }
  | simple_expr DOT label
      { Select($3, $1) }
;

record_body:
    label EQUAL expr
      { [($1, $3)] }
  | label EQUAL expr SEMI record_body
      { ($1, $3)::$5 }
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


type_decl:
    INTTYPE
      { TInt }
  | BOOLTYPE
      { TBool }
  | type_decl GOESTO type_decl %prec prec_fun
      { TArrow($1, $3) }
  | LCURLY record_type RCURLY
      { TRec $2 }
  | type_decl REF
      { TRef $1 }
  | LPAREN type_decl RPAREN
      { $2 }
;

record_type:
    label COLON type_decl
      { [($1, $3)] }
  | label COLON type_decl SEMI record_type
      { ($1, $3)::$5 }
;

exn_def:
    EXN type_decl
       { ($1, $2) }
  | LPAREN exn_def RPAREN
       { $2 }
%%
