
(* The type of tokens. *)

type token = 
  | THEN
  | RPAREN
  | REC
  | PLUS
  | OR
  | NOT
  | MINUS
  | LPAREN
  | LET
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | GOESTO
  | FUNCTION
  | EQUAL
  | EOEX
  | ELSE
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Fbast.expr)
