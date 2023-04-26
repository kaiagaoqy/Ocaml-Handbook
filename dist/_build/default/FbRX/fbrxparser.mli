
(* The type of tokens. *)

type token = 
  | WITH
  | TRY
  | THEN
  | STRING of (string)
  | SEMICOLON
  | RPAREN
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
  | INT of (int)
  | IN
  | IF
  | IDENT of (string)
  | GOESTO
  | FUNCTION
  | EXN of (string)
  | EQUAL
  | EOEX
  | ELSE
  | DOT
  | BOOL of (bool)
  | APPEND
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Fbrxast.expr)
