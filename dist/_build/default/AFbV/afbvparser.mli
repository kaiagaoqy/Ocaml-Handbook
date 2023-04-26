
(* The type of tokens. *)

type token = 
  | WITH
  | VARIANT of (string)
  | THEN
  | TAIL
  | STRING of (string)
  | SND
  | SENDTO
  | SEMICOLON
  | RPAREN
  | RBRACKET
  | PRINT
  | PLUS
  | PIPE
  | OR
  | NOT
  | MINUS
  | MATCH
  | LPAREN
  | LET
  | LBRACKET
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | HEAD
  | GOESTO
  | FUNCTION
  | FST
  | EQUAL
  | EOEX
  | ELSE
  | CREATE
  | CONS
  | COMMA
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Afbvast.expr)
