open Tfbsrxast;;

let ff = Format.fprintf

let paren_if cond pp fmt e =
	if cond e then
		ff fmt "(%a)" pp e
	else
		ff fmt "%a" pp e

let is_compound_expr = 
	function
	| Bool(_) | Int(_) | Var(_) | Select(_) | Record(_) -> false
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
			
	| Function(Ident(i), ty, x) ->
			ff fmt "@[<hv>Function %s : %a ->@;<1 4>%a@]" i pp_fbtype ty pp_expr x
	| Appl(e1, e2) ->
			let is_compound_exprL = function
					| Appl(_) -> false
					| other -> is_compound_expr other
			in
			ff fmt "%a %a" 
					(paren_if is_compound_exprL pp_expr) e1
					(paren_if is_compound_expr  pp_expr) e2

	| LetRec(Ident(i1), Ident(i2), ty1, e1, ty2, e2) ->
			ff fmt "@[<hv>Let Rec %s %s : %a =@;<1 4>%a@;<1 4>: %a@;<1 0>In@;<1 4>%a@]"
					i1 i2 pp_fbtype ty1 pp_expr e1 pp_fbtype ty2 pp_expr e2    

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

	| Ref(e1) -> ff fmt "Ref %a" pp_expr e1
	| Set(e1, e2) -> ff fmt "%a := %a" pp_expr e1 pp_expr e2
	| Get(e1) -> 
			ff fmt "!%a" (paren_if is_compound_expr pp_expr) e1
	| Cell(i) -> ff fmt "<Cell #%d/>" i
	
  | Raise(n, ty, e1) ->
			ff fmt "Raise #%s@%a %a" n pp_fbtype ty pp_expr e1
	| Try(e1, n, Ident(i1), ty, e2) ->
			ff fmt "@[<hv>Try@;<1 4>%a@;<1 0>With #%s@%a %s ->@;<1 4>%a@]"
				pp_expr e1 n pp_fbtype ty i1 pp_expr e2


and pp_fbtype fmt =
	function
	| TInt -> ff fmt "Int"
	| TBool -> ff fmt "Bool"
	| TArrow(t1, t2) ->
			let is_arrow = function 
				| TArrow(_,_) -> true 
				| _ -> false 
			in
			ff fmt "%a -> %a" 
				(paren_if is_arrow pp_fbtype) t1 
				pp_fbtype t2
	
	| TRec([]) -> ff fmt "{}"
	| TRec((Lab(name1), ty1) :: fields) -> 
			ff fmt "{@[<hv>@;<0 4>%s : %a" name1 pp_fbtype ty1;
			fields |> List.iter (fun (Lab(name), ty) ->
				ff fmt ";@;<1 4>%s : %a" name pp_fbtype ty
			);
			ff fmt "@,@]}"
			
	| TRef(t1) -> 
			let is_arrow = function 
				| TArrow(_,_) -> true 
				| _ -> false 
			in
			ff fmt "%a Ref"
				(paren_if is_arrow pp_fbtype) t1

	| TBottom -> 
			ff fmt "BOTTOM"



let show_expr e =
	Format.asprintf "%a" pp_expr e

let show_fbtype t =
	Format.asprintf "%a" pp_fbtype t