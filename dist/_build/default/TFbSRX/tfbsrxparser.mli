
(* The type of tokens. *)

type token = 
  | WITH
  | TRY
  | THEN
  | SET
  | SEMI
  | RPAREN
  | REF
  | REC
  | RCURLY
  | RAISE
  | PLUS
  | OR
  | NOT
  | MINUS
  | LPAREN
  | LET
  | LCURLY
  | INTTYPE
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | GOESTO
  | GET
  | FUNCTION
  | EXN of (string)
  | EQUAL
  | EOEX
  | ELSE
  | DOT
  | COLON
  | BOOLTYPE
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Tfbsrxast.expr)
