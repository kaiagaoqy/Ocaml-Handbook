
val name: string

module Ast: sig
  type label = Tfbsrxast.label =
    | Lab of string

  type exnid = string

  type ident = Tfbsrxast.ident =
    | Ident of string

  type fbtype = Tfbsrxast.fbtype = 
    | TInt 
    | TBool 
    | TArrow of fbtype * fbtype
    | TRec of (label * fbtype) list 
    | TRef of fbtype
    | TBottom (* Perchance it be useful *)

  type expr = Tfbsrxast.expr =
    (* basic and literal *)
    | Var of ident
    | Int of int 
    | Bool of bool

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
    | Function of ident * fbtype * expr
    | Appl of expr * expr
    | LetRec of ident * ident * fbtype * expr * fbtype * expr

    (* records *)
    | Record of (label * expr) list 
    | Select of  label * expr 

    (* exception *)
    | Raise of exnid * fbtype * expr
    | Try of expr * exnid * ident * fbtype * expr

    (* state *)
    | Ref of expr 
    | Set of expr * expr 
    | Get of expr 
    | Cell of int

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
end

module Version: sig
  val version: string
  val build_date: string
end