type ident = Ident of string
  [@@deriving show { with_path = false }]

type expr =
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
  | Function of ident * expr
  | Appl of expr * expr
  | Let of ident * expr * expr
  | LetRec of ident * ident * expr * expr
  [@@deriving show { with_path = false }]

type fbtype = 
  | TInt 
  | TBool 
  | TArrow of fbtype * fbtype 
  | TVar of string
  [@@deriving show { with_path = false }]
  
