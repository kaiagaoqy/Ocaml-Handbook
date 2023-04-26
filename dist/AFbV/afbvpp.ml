open Afbvast;;

let ff = Format.fprintf

let paren_if cond pp fmt e =
  if cond e then
    ff fmt "(%a)" pp e
  else
    ff fmt "%a" pp e
	
let rec is_list = function
	| EmptyList -> true 
	| Cons(e1, e2) -> is_list e2 
	| _ -> false

let is_compound_expr = 
  function
	| Bool(_) | Int(_) | Var(_) | String(_) | EmptyList -> false
	| Cons(_,tl) -> not (is_list tl)
  | _ -> true

let rec pp_expr fmt =
	let pp_parens = paren_if is_compound_expr pp_expr in
  function
  | Var(Ident(x)) -> ff fmt "%s" x
  | Int(x)        -> ff fmt "%d" x
  | Bool(true)    -> ff fmt "True"
  | Bool(false)   -> ff fmt "False"
	| String(s)     -> ff fmt "%S" s

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
      ff fmt "@[<hv>If %a Then@;<1 2>%a@;<1 0>Else@;<1 2>%a@]"
        pp_expr e1 pp_expr e2 pp_expr e3
      
  | Function(Ident(i), x) ->
      ff fmt "@[<hv>Fun %s ->@;<1 2>%a@]" i pp_expr x
  | Appl(e1, e2) ->
      let is_compound_exprL = function
        | Appl(_) -> false
        | other -> is_compound_expr other
      in
      ff fmt "%a %a" 
        (paren_if is_compound_exprL pp_expr) e1
        (paren_if is_compound_expr  pp_expr) e2
  | Let(Ident(i), e1, e2) ->
      ff fmt "@[<hv>Let %s =@;<1 2>%a@;<1 0>In@;<1 2>%a@]"
        i pp_expr e1 pp_expr e2

	| Pair(e1, e2) ->
			ff fmt "%a, %a" pp_parens e1 pp_parens e2
	| Fst(e1) ->
			ff fmt "Fst %a" pp_parens e1
	| Snd(e1) ->
			ff fmt "Snd %a" pp_parens e1

	| Variant(Name name, e1) ->
			ff fmt "%s %a" name pp_parens e1
	| Match(disc, branches) ->
			ff fmt "@[<hv>Match %a With" pp_expr disc;
			branches |> List.iter begin fun (Name name, Ident i1, body) ->
				ff fmt "@;<1 0>| %s %s ->@;<1 2>%a" name i1 pp_expr body
			end;
			ff fmt "@]"

	| EmptyList ->
			ff fmt "[]"
	| Cons(e_hd, e_tl) -> 
			if is_list e_tl then	
				ff fmt "[@[<hv>@;<0 2>%a%a" pp_expr e_hd pp_list_tail e_tl
			else
				ff fmt "%a :: %a" (paren_if is_compound_expr pp_expr) e_hd pp_expr e_tl

	| Head(e1) ->
			ff fmt "Head %a" pp_parens e1
	| Tail(e1) ->
			ff fmt "Tail %a" pp_parens e1
	
	| Actor(Name name) ->
			ff fmt "<Actor %s/>" name
	| Send(e1, e2) ->
			ff fmt "%a <- %a" pp_parens e1 pp_expr e2
	| Create(e1, e2) ->
			let is_pair = function
				| Pair(_,_) -> true
				| _ -> false
			in
			ff fmt "Create(%a, %a)"
				(paren_if is_pair pp_expr) e1
				(paren_if is_pair pp_expr) e2
	| Print(e1) ->
			ff fmt "Print %a" pp_parens e1
	| Seq(e1, e2) ->
			ff fmt "@[<hv>%a;@;<1 0>%a@]" pp_expr e1 pp_expr e2

and pp_list_tail fmt =
	function
	| EmptyList -> ff fmt "@,@]]"
	| Cons(e_hd, e_tl) -> ff fmt ";@;<1 2>%a%a" pp_expr e_hd pp_list_tail e_tl 
	| _ -> failwith "Impossible"


let pp_fbtype fmt Untyped =
	ff fmt "Untyped"


let show_expr e =
	Format.asprintf "%a" pp_expr e

let show_fbtype t =
	Format.asprintf "%a" pp_fbtype t