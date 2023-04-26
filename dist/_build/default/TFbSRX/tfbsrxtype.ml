open Tfbsrxast;;
open Tfbsrxpp;;

exception TypecheckerNotImplementedException;;
(*
 * If you would like typecheckingamma to be enabled by your interpreter by default,
 * then changammae the followingamma value to true.  Whether or not typecheckingamma is
 * enabled by default, you can explicitly enable it or disable it usingamma
 * command-line argammauments. 
 *) 
let typecheck_default_enabled = true;;

(*
 * Replace this with your typechecker code.  Your code should not throw the
 * followingamma exception; if you need to raise an exception, create your own
 * exception type here.
 *) 
exception TypeError;;
exception LabelNotFound;;

let rec lookup gamma e = (
    match gamma with 
    | [] -> raise TypeError
    | (a, b) :: c -> (
        if  e=a then
            b
        else
            lookup c e
    )

);;

let rec typecheck_env gamma e =
    match e with
    (* lookup returns the first mapping of x in gamma *)
        (* basic and literal *)
        | Var(a) -> lookup gamma a
        | Bool(_) -> TBool
        | Int(_) -> TInt

        (* bool *)
        | Not(expr) -> 
          ( match typecheck_env gamma expr with
          |TBool -> TBool
          |TBottom -> TBool
          | _ -> raise TypeError
        )
        | Or(e1, e2) -> 
            (match typecheck_env gamma e1, typecheck_env gamma e2 with
                | TBool, TBool -> TBool
                | TBottom, TBottom -> TBool
                | TBottom, TBool -> TBool
                | x, TBottom -> TBool
                | _, _ -> raise TypeError
            )
        | And(e1, e2) ->
            (match typecheck_env gamma e1, typecheck_env gamma e2 with
                | TBool, TBool -> TBool
                | TBottom, TBottom -> TBool
                | TBottom, TBool ->TBool
                | TBool, TBottom -> TBool
                | _, _ -> raise TypeError
            )
        
        (* int *)
        | Plus(e1, e2) ->
            (match typecheck_env gamma e1, typecheck_env gamma e2 with
                | TInt, TInt -> TInt
                | TBottom, TBottom -> TInt
                | TBottom, TInt -> TInt
                | TInt, TBottom -> TInt
                | _, _ -> raise TypeError
            )
        | Minus(e1, e2) ->
          (match typecheck_env gamma e1, typecheck_env gamma e2 with
          | TInt, TInt -> TInt
          | TBottom, TBottom -> TInt
          | TBottom, TInt -> TInt
          | TInt, TBottom -> TInt
          | _, _ -> raise TypeError
      )
        | Equal(e1, e2) ->
          (match typecheck_env gamma e1, typecheck_env gamma e2 with
          | TInt, TInt -> TBool
          | TBottom, TBottom -> TBool
          | TBottom, TInt -> TBool
          | TInt, TBottom -> TBool
          | _, _ -> raise TypeError
      )
        
        (* func and let *)
        | Function (ide, t, expr) -> 
            (let outputType = typecheck_env ((ide, t) :: gamma) expr 
          in TArrow(t, outputType))
        | If(a, e1, e2) -> 
            (match typecheck_env gamma a with 
            | TBool -> 
                (let d =  typecheck_env gamma e1 in let e = typecheck_env gamma e2 in
                if equal_fbtype d e then
                    d
                else
                  (match d, e with
                | TBottom, TBottom -> TBottom
                | TBottom, x -> x
                | x, TBottom -> x
                | _, _ -> raise TypeError
              ))
            
            | _ -> raise TypeError
                    
        )
        | Appl(e1, e2) -> 
            (match typecheck_env gamma e1, typecheck_env gamma e2 with
            | TArrow(t1, t_out), t_in -> (
                if equal_fbtype t1 t_in then
                  t_out
                else
                    if equal_fbtype t_in TBottom then t_out
            
                    else if compare_rec t1 t_in then t_out

            
                    else
                        raise LabelNotFound
            )
            | _ -> raise TypeError
        )
        | LetRec(id1, id2, fbtype1, e1, fbtype2, e2) ->
          (let t1 = typecheck_env ((id1, TArrow(fbtype1, fbtype2))::(id2, fbtype2)::(gamma)) e1 
        in let t2 =
          typecheck_env ((id1, TArrow(t1, fbtype2))::(id2, fbtype2)::gamma) e2 in (t2))
        
        (* exception *)
        | Raise(id, t, expr) -> (* (Raise #Exn@Int 1) *)
            let outType = typecheck_env gamma expr in (
                if t = outType then
                    TBottom
                else
                    raise TypeError
            )
        | Try(e1, exn, id, typeOf, e2) -> (
            let out1 = (typecheck_env gamma e1) in let out2 = (typecheck_env ((id, typeOf)::gamma) e2)
            in (
                match out1, out2 with
                | TBool, TBool -> TBool
                | TInt, TInt -> TInt
                | TBottom, TBottom -> (
                    match e1, e2 with
                    | Raise(e, f, gamma), Raise(h, i, j) -> TBottom
                    | _, _ -> raise TypeError
                )
                | TBottom, x -> x
                | x, TBottom -> x
                | _, _ -> raise TypeError
            )
        )
        
        (* state *)
        |Ref(expr) -> (
          match typecheck_env gamma expr with
          | TBottom -> (match expr with 
            | Raise(id, t, e) -> TRef(t)
            | _ -> raise TypeError)
          | t ->TRef(t)
        )
        |Set(e1,e2) -> (match (typecheck_env gamma e1) with
          | TRef(t1) -> if equal_fbtype (typecheck_env gamma e2) t1 then t1 else raise TypeError 
          | _ -> raise TypeError
          )   
        |Get(expr) ->  (match (typecheck_env gamma expr) with
          | TRef(t1) -> t1
          | _ -> raise TypeError
        )
        
        (* records *)
        | Record(expr)-> TRec(record_type gamma expr)
        | Select(label,expr) ->  (match typecheck_env gamma expr with 
          | TRec(record)-> (lookupRecord record label)
          | _ -> raise TypeError)
        | _ -> raise TypeError

    and 
        record_type gamma li = (match li with 
        |[]-> []
        |(label,expr)::t -> (label, (typecheck_env gamma expr))::(record_type gamma t)
        )
    and 
    lookupRecord body (Lab l) = 
      (match body with
      | [] -> raise LabelNotFound
      | (Lab a, expr)::t -> if l = a then expr else lookupRecord t (Lab l)
      )
    and
    compare_rec t1 t2 =
  match t1, t2 with
  | TRec fields1, TRec fields2 ->
      let order (Lab l1,_) (Lab l2,_) = compare l1 l2 in
      let fields1 = List.sort order fields1 in
      let fields2 = List.sort order fields2 in
      begin try 
        List.for_all2 (fun (Lab l1, ty1) (Lab l2, ty2) -> l1 = l2 && compare_rec ty1 ty2  )
          fields1 fields2 
      with
      | Invalid_argument(_) -> false
      end
  | TInt, TInt -> true
  | TBool, TBool -> true
  | TArrow(t11,t12), TArrow(t21,t22) ->
    compare_rec t11 t21 && compare_rec t12 t22
  | TRef t1, TRef t2 -> compare_rec t1 t2
  | _, TBottom -> true
  | TBottom, _ -> true
  | _,_ -> false
;;




let rec typecheck e = 
    (typecheck_env [] e)

;;

