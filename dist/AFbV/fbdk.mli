
val name: string

module Ast: sig
  type ident = Afbvast.ident =
    | Ident of string

  type name = Afbvast.name =
    | Name of string

  type expr = Afbvast.expr =
    (* basic and literal *)
    | Var of ident
    | Int of int 
    | Bool of bool
    | String of string

    (* int *)
    | Plus of expr * expr
    | Minus of expr * expr
    | Equal of expr * expr

    (* bool *)
    | And of expr * expr
    | Or of expr * expr
    | Not of expr
    | If of expr * expr * expr

    (* func and let *)
    | Function of ident * expr
    | Appl of expr * expr
    | Let of ident * expr * expr

    (* pairs *)
    | Pair of expr * expr 
    | Fst of expr 
    | Snd of expr 
    
    (* variants *)
    | Variant of name * expr 
    | Match of expr * (name * ident * expr) list

    (* lists *)
    | EmptyList 
    | Cons of expr * expr 
    | Head of expr
    | Tail of expr

    (* actors, side-effects *)
    | Actor of name 
    | Send of expr * expr 
    | Create of expr * expr
    | Print of expr
    | Seq of expr * expr 

  type fbtype = Afbvast.fbtype = 
    | Untyped

  val show_expr: expr -> string
  val pp_expr: Format.formatter -> expr -> unit
    [@@ocaml.toplevel_printer]

  val show_fbtype: fbtype -> string
  val pp_fbtype: Format.formatter -> fbtype -> unit
    [@@ocaml.toplevel_printer]
end

module Parser: sig
  type token
  val main:
    (Lexing.lexbuf -> token) -> Lexing.lexbuf -> Ast.expr
end

module Lexer: sig
  val token: Lexing.lexbuf -> Parser.token
end

module Typechecker: sig
  (* This exception is used to allow a language to dynamically signal that it *)
  (* does not have a typechecker.  If it is raised, it should be raised by a *)
  (* Typechecker module's typecheck function. *)
  exception TypecheckerNotImplementedException

  val typecheck: Ast.expr -> Ast.fbtype
  val typecheck_default_enabled: bool
end

module Pp: sig
  val show_expr: Ast.expr -> string
  val pp_expr: Format.formatter -> Ast.expr -> unit
    
  val show_fbtype: Ast.fbtype -> string
  val pp_fbtype: Format.formatter -> Ast.fbtype -> unit
end

module Interpreter: sig
  val eval: Ast.expr -> Ast.expr
end

module Options: sig
  val options: (Arg.key * Arg.spec * Arg.doc) list
  val show_messages : bool ref
  val show_states : bool ref
  val deterministic_delivery : bool ref
end

module Version: sig
  val version: string
  val build_date: string
end