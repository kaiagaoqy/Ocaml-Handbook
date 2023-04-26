open Boolast;;

let ff = Format.fprintf

let rec pp_expr fmt =
  function
  | True -> ff fmt "True"
  | False -> ff fmt "False"
  | And(e1, e2) -> 
      ff fmt "(%a And %a)" pp_expr e1 pp_expr e2 
  | Or(e1, e2) -> 
      ff fmt "(%a Or %a)" pp_expr e1 pp_expr e2
  | Implies(e1, e2) ->
      ff fmt "(%a Implies %a)" pp_expr e1 pp_expr e2
  | Not e ->
      ff fmt "(Not %a)" pp_expr e

let pp_fbtype fmt TBool =
  ff fmt "Bool"


let show_expr e =
  Format.asprintf "%a" pp_expr e

let show_fbtype t =
  Format.asprintf "%a" pp_fbtype t