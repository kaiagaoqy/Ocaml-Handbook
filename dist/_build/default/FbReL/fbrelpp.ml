open Fbrelast;;

let ff = Format.fprintf

let paren_if cond pp fmt e =
  if cond e then
    ff fmt "(%a)" pp e
  else
    ff fmt "%a" pp e

let is_compound_expr = 
  function
  | Bool(_) | Int(_) | Var(_) | Select(_) | Record(_) 
  | EmptyList | Cons(_) -> false
  | _ -> true


let rec pp_expr fmt =
  function
  | Var(Ident(x)) -> 
      ff fmt "%s" x
  | Int(x)      -> ff fmt "%d" x
  | Bool(true)  -> ff fmt "True"
  | Bool(false) -> ff fmt "False"

  | Plus(e1, e2) ->
      ff fmt "%a + %a" pp_expr e1 pp_expr e2
  | Minus(e1, e2) ->
      ff fmt "%a - %a" pp_expr e1 pp_expr e2
  | Equal(e1, e2) ->
      ff fmt "%a = %a" pp_expr e1 pp_expr e2
  
  | And(e1, e2) ->
      ff fmt "%a And %a" pp_expr e1 pp_expr e2
  | Or(e1, e2) ->
      ff fmt "%a Or %a" pp_expr e1 pp_expr e2
  | Not(e1) ->
      ff fmt "Not %a" pp_expr e1
  | If(e1, e2, e3) ->
      ff fmt "@[<hv>If %a Then@;<1 4>%a@;<1 0>Else@;<1 4>%a@]"
        pp_expr e1 pp_expr e2 pp_expr e3
      
  | Function(Ident(i), x) ->
      ff fmt "@[<hv>Function %s ->@;<1 4>%a@]" i pp_expr x
  | Appl(e1, e2) ->
      let is_compound_exprL = function
        | Appl(_) -> false
        | other -> is_compound_expr other
      in
      ff fmt "%a %a" 
        (paren_if is_compound_exprL pp_expr) e1
        (paren_if is_compound_expr  pp_expr) e2
  | Let(Ident(i), e1, e2) ->
      ff fmt "@[<hv>Let %s =@;<1 4>%a@;<1 0>In@;<1 4>%a@]"
        i pp_expr e1 pp_expr e2

  | Record([]) -> ff fmt "{}"
  | Record((Lab(name1), e1) :: fields) -> 
      ff fmt "{@[<hv>@;<0 4>%s = %a" name1 pp_expr e1;
      fields |> List.iter (fun (Lab(name), e) ->
        ff fmt ";@;<1 4>%s = %a" name pp_expr e
      );
      ff fmt "@,@]}"

  | Select(Lab(lbl), e) ->
      ff fmt "%a.%s"
        (paren_if is_compound_expr pp_expr) e lbl

  | Match(disc, e_nil, Ident(i_hd), Ident(i_tl), e_cons) ->
      ff fmt "@[<hv>Match %a With@;<1 0>| [] ->@;<1 4>%a@;<1 0>| %s::%s ->@;<1 4>%a@]"
        pp_expr disc
        pp_expr e_nil
        i_hd i_tl
        pp_expr e_cons

  | EmptyList ->
      ff fmt "[]"

  | Cons(e_hd, e_tl) -> 
      ff fmt "[@[<hv>@;<0 4>%a%a" pp_expr e_hd pp_list_tail e_tl

and pp_list_tail fmt =
  function
  | EmptyList -> ff fmt "@,@]]"
  | Cons(e_hd, e_tl) -> ff fmt ";@;<1 4>%a%a" pp_expr e_hd pp_list_tail e_tl 
  | _ -> failwith "impossible"
  

let rec pp_fbtype fmt =
  function
  | Untyped -> ff fmt "Untyped"
  
  (* function
  | TInt -> ff fmt "Int"
  | TBool -> ff fmt "Bool"
  | TArrow(t1, t2) ->
    begin match t1 with
    | TArrow(_,_) -> 
      ff fmt "(%a) -> %a" pp_fbtype t1 pp_fbtype t2
    | _ -> 
      ff fmt "%a -> %a" pp_fbtype t1 pp_fbtype t2
    end
  | TVar(s) -> 
      ff fmt "%s" s *)

      
let show_expr e =
  Format.asprintf "%a" pp_expr e

let show_fbtype t =
  Format.asprintf "%a" pp_fbtype t