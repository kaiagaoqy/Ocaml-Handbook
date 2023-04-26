
(* The type of tokens. *)

type token = 
  | TRUE
  | RPAREN
  | OR
  | NOT
  | LPAREN
  | IMPLIES
  | FALSE
  | EOEX
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Boolast.expr)
