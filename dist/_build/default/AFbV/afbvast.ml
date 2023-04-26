type ident = Ident of string
  [@@deriving show { with_path = false }]

type name = Name of string
  [@@deriving show { with_path = false }]

type expr = 
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
  [@@deriving show { with_path = false }]
  
type fbtype = 
  Untyped
  [@@deriving show { with_path = false }]