open Fbrxast

exception NotClosed

let fbLabelNotFound = Raise("#LabelNotFound", Int(0))
let fbTypeMismatch = Raise("#TypeMismatch", Int(0))


let (@:) f x = f x;;

let list_empty lst = 
  match lst with 
  | [] -> true
  | h :: t -> false
;;

let rec lookupRecord body (Lab l) = 
  match body with
  | [] -> fbLabelNotFound
  | (Lab a, v)::t -> if l = a then v else lookupRecord t (Lab l)
;;
let rec checkIfExists a (Lab l) = 
  match a with
  [] -> false
  | (Lab b, v)::t -> if l = b then true else checkIfExists t (Lab l)
;;

let rec appendLists a b = 
  match a with
  | [] -> b
  | (Lab l, v) :: t -> if checkIfExists b (Lab l) = true then appendLists t b  else appendLists t ((Lab l, v) :: b)
;;
(**
 * Determines whether or not an expression is closed
 *
 * expr: Fbast.ident
 *)
let check_closed expr =
  (* helper function *)
  let rec check vars expr = 
    match expr with 
    (* base cases *)
    | Var(ident) -> 
        if List.mem ident vars then true
        else if ident = Ident "stash" || ident = Ident "unstash" then true
        else false

    | Int(_) -> true

    | Bool(_) -> true

    | String(_) -> true

    (* int *)
    | Plus(expr1, expr2) ->
      check vars expr1 && check vars expr2

    | Minus(expr1, expr2) -> 
        check vars expr1 && check vars expr2

    | Equal(expr1, expr2) -> 
        check vars expr1 && check vars expr2
    
    (* bool *)
    | And(expr1, expr2) ->
      check vars expr1 && check vars expr2

    | Or(expr1, expr2) ->
        check vars expr1 && check vars expr2

    | Not(expr) ->
        check vars expr

    | If(condi, expr1, expr2 ) -> 
        check vars condi && check vars expr1 && check vars expr2
    
   (* Func and Let *)
    | Function(ident, expr) -> 
        check (ident::vars) expr

    | Appl(expr1, expr2) -> 
        check vars expr1 && check vars expr2

    | Let(ident,expr1, expr2) -> check vars expr1 && check (ident::vars) expr2

    (* Let Rec f x = e1 In e2 
     * f, x are bound in e1
     * f bound in e2 *)
    | LetRec(f, x, expr1, expr2) -> 
        check (f :: x :: vars) expr1 &&
        check (f :: vars) expr2
    
    (* Record *)
    | Record(expr) -> true
    | Select(label,expr) -> check vars expr
    | Append(expr1,expr2) -> check vars expr1 && check vars expr2 

    | Raise(exnid,expr) -> check vars expr
    | Try(expr1,exnid,ident,expr2) -> check vars expr1
  
  in
  check [] expr
;;


(**
 * Variable substitution
 *
 * expr : Fbast.expr given expression to be substitued
 * v    : Fbast.expr the value used to substituion
 * ident: Fbast.ident the indent of the varible need to be substituted
 *
 *)
let rec subst expr v ident = 
  match expr with
  (* basic and literal *)
  | Var(ident_expr) -> 
    (* x[v/x] --> v *)
      if ident_expr = ident then v
    (* x'[v/x] --> x' *)
      else expr 

    (* True[v/x] --> True ; n[v/x] --> n \in Z *)
  | Bool(_) | Int(_) -> expr

  (* int *)
    (* (e1+e2)[v/x] --> e1[v/x]+e2[v/x] *)
  | Plus(e1, e2) -> Plus(subst e1 v ident, subst e2 v ident)
  
  | Minus(e1, e2) -> Minus(subst e1 v ident, subst e2 v ident)
  
  | Equal(e1, e2) -> Equal(subst e1 v ident, subst e2 v ident)
  
  (* bool *)
    (* (e1 And e2)[v/x] = e1[v/x] And e2[v/x] *)
  | Or(e1, e2) -> Or(subst e1 v ident, subst e2 v ident)

  | And(e1, e2) -> And(subst e1 v ident, subst e2 v ident) 
    (* Not(e)[v/x] --> Not(e[v/x]) *)
  | Not(e) -> Not(subst e v ident)

  (* func and let *)
  | Function(x, body) ->
      (* shadowlling (Function x -> Function x -> x + x) 2 *)
      (* (Fun x -> e)[v/x] *)
      if x = ident then expr 
      (* (Fun x -> e)[v/y] *)
      else Function(x, subst body v ident) 

  | Appl(e1, e2) -> Appl(subst e1 v ident, subst e2 v ident)

  
  | Let(x,e1,e2) -> 
    (* (Let x = e1 in e2)[v/x] --> Let x = e1[v/x] in e2 *)
    if x = ident then Let(x,subst e1 v ident, e2)
    (* (Let x' = e1 in e2)[v/x] --> Let x' = e1[v/x] in e2[v/x] *)
    else Let(x,subst e1 v ident, subst e2 v ident)
  

  (* Let Rec f x = e1 In e2 
     * f, x are bound in e1
     * f bound in e2 *)
    
  | LetRec(f, x, e1, e2) ->
      if ident != f && ident != x then
        LetRec(f, x, subst e1 v ident, subst e2 v ident)
      else if ident != f then
        LetRec(f, x, e1, subst e2 v ident)
      else
        expr
  | If(e1, e2, e3) -> If(subst e1 v ident, subst e2 v ident, subst e3 v ident)
  | _ -> expr
  
;;
(* type stashType = {mutable i: int; mutable b:bool; mutable s:string}
let stash = {i=0; b=true;s="s"} *)
let rec list_map = fun f -> fun expr -> match expr with 
| [] -> []
| (Lab l, e)::tl -> f (Lab l, e) :: list_map f tl

type stashType = {mutable exp:expr}
let stash = {exp = String("empty")}
let eval expr = 
  let rec evaluate expr = 
    match expr with
    | Not(e) -> (
        match evaluate e with
        | Bool(v) -> Bool(not v)
        | Raise(exnid, e) -> Raise(exnid,evaluate e)
        | _ -> fbTypeMismatch )

    | And(e1, e2) -> (
        match evaluate e1, evaluate e2 with
        | Bool(v1), Bool(v2) -> Bool(v1 && v2)
        | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
        | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
        | _ -> fbTypeMismatch )
    
    | Or(e1, e2) -> (
        match evaluate e1, evaluate e2 with
        | Bool(v1), Bool(v2) -> Bool(v1 || v2)
        | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
        | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
        | _ -> fbTypeMismatch )

    | Plus(e1, e2) -> (
        match evaluate e1, evaluate e2 with
        | Int(v1), Int(v2) -> Int(v1+v2)
        | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
        | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
        | _ -> fbTypeMismatch )

    | Minus(e1, e2) -> (
        match evaluate e1, evaluate e2 with
        | Int(v1), Int(v2) -> Int(v1-v2)
        | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
        | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
        | _ -> fbTypeMismatch )

    | Equal(e1, e2) ->  (
        match evaluate e1, evaluate e2 with
        | Int(v1), Int(v2) -> if v1 = v2 then Bool(true) else Bool(false)
        | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
        | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
        | _,_ -> fbTypeMismatch )

    | If(condi, e1, e2 ) -> (
        match evaluate condi with
        | Raise(exnid, e)-> Raise(exnid,evaluate e)
        | Bool(v) ->(if v then match evaluate e1 with 
                  | Raise(exnid, e)-> Raise(exnid,evaluate e)
                  | v1 -> v1
                  else match evaluate e2 with 
                  | Raise(exnid, e)-> Raise(exnid,evaluate e)
                  | v2 -> v2)
        | _ -> fbTypeMismatch)

    | Appl(e1, e2) -> (
      match evaluate e1, evaluate e2 with
      | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
      | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
      | Var(Ident "stash"), v2 -> let _ = stash.exp <- v2 in stash.exp
      | _,_ -> (match evaluate e1, evaluate e2 with 
        | Function(x, body),  sub -> evaluate @: subst body sub x
        | _,_ -> fbTypeMismatch)
      )

    |Let(x,e1,e2) -> (match evaluate e1, evaluate @: subst e2 (evaluate e1) x with
    | Raise(exnid, e),_ -> Raise(exnid,evaluate e)
    | _,Raise(exnid, e)-> Raise(exnid,evaluate e)
    | v1,v2 -> v2
    )

    (* 
     * e2[Function x -> e1[(Function x -> Let Rec f x = e1 In f x)/f]/f] ) => v 
     * Let Rec f x = e1 In e2) => v
     * *)
    | LetRec(f, x, e1, e2) ->
        let mk_rec_subt = 
          subst (Function(x, e1)) 
                ( Function(x, LetRec(f, x, e1, Appl(Var(f), Var(x)))) ) 
                f in 
        evaluate @: subst e2 (mk_rec_subt ) f
    

    | Var(Ident "unstash") -> if stash.exp = String("empty") then raise NotClosed else stash.exp
    | Var(Ident "stash") -> Var(Ident "stash")
    | Var(_) -> raise NotClosed

    (* Record *)
    | Record(expr) -> Record(evalRecord expr)

    | Select(label,expr) -> 
      (match evaluate expr with
      | Record(e) -> lookupRecord e label
      | _ -> fbLabelNotFound 
      )
    | Append(expr1,expr2) -> 
      (match evaluate expr1, evaluate expr2 with  
      |Record(e1),Record(e2) -> Record(appendLists e1 e2)
      |_,_ -> fbTypeMismatch
    )

    | Raise(exnid, e) -> 
      (
        match e with
        | Raise(exnid1, e1) -> Raise(exnid1, (evaluate e1))
        | _ -> Raise(exnid, evaluate e)
      )
    | Try(e1, exnid, var, e2) -> (
        let v1 = (evaluate e1) in
          match v1 with
          | Raise(exnid1, e3) -> evaluate @: subst e2 (evaluate e3) var
          | _ -> (evaluate e1)
      )

    (* Bool, Int, Function *)
    | _ -> expr

 and evalRecord body = (
      match body with
      | [] -> []
      | (Lab l, e)::t -> (Lab l, evaluate e)::evalRecord t)
  in
  if not (check_closed expr) then raise NotClosed
  else evaluate expr
;;




(* Test examples
1. Function
eval((Appl ((Function ((Ident "x"), (Plus ((Var (Ident "x")), (Int 1))))), (Int 1))));; --> Int 2

2. Application
eval(Appl ((Plus ((Var (Ident "x")), (Int 1))), (Int 1)));; --> Notclosed
eval(Appl ((Function ((Ident "x"), (Plus ((Var (Ident "x")), (Int 1))))), (Int 1)));; --> Int 2

3. Let
let x = 1 in x+1
eval((Let ((Ident "x"), (Int 1) , (Plus ((Var (Ident "x")), (Int 1))))));; --> Int 2

eval((Let ((Ident "x"), Var (Ident "x") , (Int 1))));; --> NotClosed
4. stash
eval((Let ((Ident "_"), (Appl ((Var (Ident "stash")), (Int 42))),
   (Var (Ident "unstash")))));;

5. Try
peu "Try (Raise #Return (4 + 4)) - 8 With #Return n -> n";; ---> "Raise #Return 8"
  
*)