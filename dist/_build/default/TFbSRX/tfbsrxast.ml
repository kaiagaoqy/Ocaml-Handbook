type ident = Ident of string
  [@@deriving show { with_path = false }]

type exnid = string
  [@@deriving show { with_path = false }]

type label = Lab of string
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
  [@@deriving show { with_path = false }]
  
  
and fbtype =
  | TInt 
  | TBool 
  | TArrow of fbtype * fbtype
	| TRec of (label * fbtype) list 
  | TRef of fbtype
  | TBottom (* Perchance it be useful *)
  [@@deriving show { with_path = false }]

  
let rec equal_fbtype t1 t2 =
  match t1, t2 with
  | TInt, TInt -> true
  | TBool, TBool -> true
  | TArrow(t11,t12), TArrow(t21,t22) ->
      equal_fbtype t11 t21 && equal_fbtype t12 t22
  | TRef t1, TRef t2 -> equal_fbtype t1 t2
  | TBottom, TBottom -> true
  | TRec fields1, TRec fields2 ->
      let order (Lab l1,_) (Lab l2,_) = compare l1 l2 in
      let fields1 = List.sort order fields1 in
      let fields2 = List.sort order fields2 in
      begin try 
        List.for_all2 (fun (Lab l1, ty1) (Lab l2, ty2) -> l1 = l2 && equal_fbtype ty1 ty2) 
          fields1 fields2 
      with
      | Invalid_argument(_) -> false
      end
  | _ -> false