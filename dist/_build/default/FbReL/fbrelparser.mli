
(* The type of tokens. *)

type token = 
  | WITH
  | THEN
  | SEMICOLON
  | RPAREN
  | RCURLY
  | RBRACKET
  | PLUS
  | PIPE
  | OR
  | NOT
  | MINUS
  | MATCH
  | LPAREN
  | LET
  | LCURLY
  | LBRACKET
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | GOESTO
  | FUNCTION
  | EQUAL
  | EOEX
  | ELSE
  | DOT
  | CONS
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Fbrelast.expr)
