open Fbast;;


(*
 * Replace this with your interpreter code.
 *)
let rec eval ex = 
  match ex with
    (* basic and literal *)
      Var(e) -> ex
    | Bool(e) -> ex
    | Int(e) -> ex

    (* int *)
  | Plus(e1,e2) ->
    (
      match (eval e1, eval e2) with 
      (Int(v1),Int(v2)) -> Int(v1+v2)
      |_ -> failwith "WrongType"
    )
  | Minus(e1,e2) ->
    (
      match (eval e1, eval e2) with 
      (Int(v1),Int(v2)) -> Int(v1-v2)
      |_ -> failwith "WrongType"
    )
  | Equal(e1,e2) ->
    (
      match (eval e1, eval e2) with 
      (Int(v1),Int(v2)) -> if v1=v2 then Bool(true) else Bool(false)
      |_ -> failwith "WrongType"
    )
    (* bool *)
    | Not(e) -> 
      (match eval e with 
        Bool(v) -> Bool(not v)
        |_ -> failwith "WrongType"
      )

    | And(e1,e2) -> 
      (
        match (eval e1, eval e2) with
        (Bool(v1),Bool(v2)) -> Bool(v1&&v2)
      | _ -> failwith "WrongType"
      )
    | Or(e1,e2) -> 
      (
        match (eval e1, eval e2) with
        (Bool(v1),Bool(v2)) -> Bool(v1||v2)
      | _ -> failwith "WrongType"
      )

    | If(e1,e2,e3) -> 
      (
        match eval e1 with
          Bool(true) -> eval e2
        | Bool(false) -> eval e3
        | _ -> failwith "WrongType"
      )

    (* func and let *)
    | Function(x,e) -> ex
    | Appl(e1,e2) -> ex
      (* (
      match (eval e1,eval e2) with
        (Function(x,e),v2) -> ex
      
      ) *)
    
    | Let(x,e1,e2) -> (
      Appl(e2,e1)
    )
    | LetRec(x1,x2,e1,e2) -> ex
  

    

let is_value:expr->bool = function
| Int _ | Bool _ -> true
| _ -> false


(** [subst e v x] is [e] with [v] substituted for [x], that
    (* is, [e{v/x}]. *)
let rec subst e v x = match e with
    (*One arg*)
    | Var y -> if x = y then v else e
    | Bool _ -> e
    | Int _ -> e
    | Not(e) -> Not(subst e v x)
    (* Bi arg*)
    | Plus(e1,e2) -> Plus(subst e1 v x, subst e2 v x)
    | Minus(e1,e2) -> Minus(subst e1 v x, subst e2 v x)
    | Equal(e1,e2) -> Equal(subst e1 v x, subst e2 v x)
    | And(e1,e2) -> And(subst e1 v x, subst e2 v x)
    | Or(e1,e2) -> Or(subst e1 v x, subst e2 v x)
    (* Tri arg*)
    | Let (y, e1, e2) ->
      let e1' = subst e1 v x in
      if x = y
      then Let (y, e1', e2)
      else Let (y, e1', subst e2 v x)
    | If (e1, e2, e3) ->
      If (subst e1 v x, subst e2 v x, subst e3 v x) *)

(** [subst e v x] is [e{v/x}]. *)
let subst _ _ _ =
  failwith "See next section"
(* 
let rec step : expr -> expr = function
  | Int _ | Bool _ -> failwith "Does not step"
  | Var _ -> failwith "Unbound variable"
  | Binop (bop, e1, e2) when is_value e1 && is_value e2 ->
    step_bop bop e1 e2
  | Binop (bop, e1, e2) when is_value e1 ->
    Binop (bop, e1, step e2)
  | Binop (bop, e1, e2) -> Binop (bop, step e1, e2)
  | Let (x, e1, e2) when is_value e1 -> subst e2 e1 x
  | Let (x, e1, e2) -> Let (x, step e1, e2)
  | If (Bool true, e2, _) -> e2
  | If (Bool false, _, e3) -> e3
  | If (Int _, _, _) -> failwith "Guard of if must have type bool"
  | If (e1, e2, e3) -> If (step e1, e2, e3) *)

(** [step_bop bop v1 v2] implements the primitive operation
    [v1 bop v2].  Requires: [v1] and [v2] are both values. *)
(* and step_bop bop e1 e2 = match bop, e1, e2 with
  | Add, Int a, Int b -> Int (a + b)
  | Mult, Int a, Int b -> Int (a * b)
  | Leq, Int a, Int b -> Bool (a <= b)
  | _ -> failwith "Operator and operand type mismatch" *)
(* 
(* Let *)

let fblet x e1 e2 = "(Fun "^x^" -> "^e2^")("^e1^")";;

(* Pair with boolean*)

let pr l r= "(Fun x -> Fun y -> Fun b -> If b Then x Else y) "^"("^l^")"^"("^r^")";; (* Use capitals*)

let left p = "(Fun p -> p True)"^"("^p^")";;
let right p = "(Fun p -> p False)"^"("^p^")";;

(* List *)
let empty = pr "True" "0";;
let cons h t= "("^pr "False" (pr h t)^")";;
let isEmpty pr = left pr;;
let head pr = "("^left(right pr)^")";;(*"(Fun p -> ("^left (right "p")^"))"^"("^pr^")";; *)
let tail pr = "("^right(right pr)^")";;

let li_eg = cons "1" (cons "2" (cons "3" empty));; *)