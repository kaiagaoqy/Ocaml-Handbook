
(* The type of tokens. *)

type token = 
  | THEN
  | SET
  | SEMI
  | RPAREN
  | REF
  | REC
  | RCURLY
  | PLUS
  | OR
  | NOT
  | MINUS
  | LPAREN
  | LET
  | LCURLY
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | GOESTO
  | GET
  | FUNCTION
  | EQUAL
  | EOEX
  | ELSE
  | DOT
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Fbsrast.expr)
