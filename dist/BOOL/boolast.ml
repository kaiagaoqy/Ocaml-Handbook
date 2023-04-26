type expr = 
  | True 
  | False 
  | And of expr * expr 
  | Or of expr * expr 
  | Implies of expr * expr
  | Not of expr 
  [@@deriving show { with_path = false }]

type fbtype = 
  TBool
  [@@deriving show { with_path = false }]
