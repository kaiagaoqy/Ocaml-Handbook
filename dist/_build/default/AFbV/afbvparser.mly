%{

open Afbvast;;

%}

/*
 * Tokens
 */

%token AND
%token <bool> BOOL
%token ELSE
%token EOEX
%token EQUAL
%token FUNCTION
%token GOESTO
%token <string> IDENT
%token IN
%token IF
%token <int> INT
%token <string> STRING
%token LET
%token LPAREN
%token MINUS
%token NOT
%token OR
%token PLUS
%token RPAREN
%token THEN
%token SEMICOLON
%token COMMA
%token MATCH
%token WITH
%token FST
%token SND
%token <string> VARIANT
%token PIPE
%token CREATE
%token SENDTO
%token PRINT
%token LBRACKET
%token RBRACKET
%token HEAD
%token TAIL
%token CONS

/*
 * Precedences and associativities.  Lower precedences come first.
 */
%right prec_let                         /* Let x = ... In ... */
%right prec_fun                         /* function declaration */
%left prec_match_body                   /* Match ... With | ... -> e */
%right SEMICOLON                        /* Sequence */
%right prec_if                          /* If ... Then ... Else */
%right SENDTO                           /* <- */
%left COMMA                             /* Pair */
%right OR                               /* Or */
%right AND                              /* And */
%left EQUAL                             /* = */
%left PLUS MINUS                        /* + - */
%left prec_appl                         /* function application */
%left prec_send                         /* send to actor */
%right NOT                              /* not e */
%right CONS                             /* :: */

/*
 * The entry point.
 */
%start main
%type <Afbvast.expr> main

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
  | expr SEMICOLON expr
      { Seq($1, $3) }
  | LET ident_decl EQUAL expr IN expr %prec prec_let
      { Let($2, $4, $6) }
  | expr COMMA expr
      { Pair($1, $3) }
  | FST simple_expr
      { Fst $2 }
  | SND simple_expr
      { Snd $2 }
  | VARIANT expr %prec prec_appl
      { Variant(Name $1, $2) }
  | MATCH expr WITH pattern_list
      { Match($2, $4) }
  | expr CONS expr
      { Cons($1, $3) }
  | HEAD expr %prec prec_appl
      { Head $2 }
  | TAIL expr %prec prec_appl
      { Tail $2 }
  | CREATE LPAREN expr COMMA expr RPAREN
      { Create($3, $5) }
  | expr SENDTO expr %prec prec_send
      { Send($1, $3) }
  | PRINT expr %prec prec_appl
      { Print $2 }
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
  | LPAREN expr RPAREN
      { $2 }
  | LBRACKET RBRACKET
      { EmptyList }
  | LBRACKET expr RBRACKET
      {
        let rec seq_to_list e = match e with
          | Seq(e1, e2) -> Cons(e1, seq_to_list e2)
          | v -> Cons(v, EmptyList)
        in
          seq_to_list $2
      }
;

ident_usage:
    ident_decl
      { Var $1 }
;

ident_decl:
    IDENT
      { Ident $1 }
;

pattern_list:
    pattern
      { [$1] }
  | pattern_list PIPE pattern
      { $1 @ [$3] }
;

pattern:
    VARIANT pattern_ident GOESTO expr %prec prec_match_body
      { ((Name $1), $2,$4) }
  | PIPE VARIANT pattern_ident GOESTO expr %prec prec_match_body
      { ((Name $2), $3, $5) }
;

pattern_ident:
    ident_decl
       { $1 }
  | LPAREN pattern_ident RPAREN
       { $2 }
;

%%
