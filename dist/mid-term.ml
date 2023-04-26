let ycomb = 
  "(Fun odd -> Fun even ->
      Let repl = Fun self -> Fun flag -> Fun x -> If flag Then odd (self self False) x  Else even (self self True) x  
      In repl repl )";;

let odd = "Fun rec -> Fun x -> If x=0 Then False Else rec (x-1)"
let even = "Fun rec -> Fun x -> If x=0 Then True Else rec (x-1)"
let isEven = 
  " Let yy = "^ycomb^" In
  Let odd = "^odd^" In 
  Let even = "^even^" In 
  Let isEven= (yy odd even) False In
  isEven ";;
let isOdd = 
  " Let yy = "^ycomb^" In
  Let odd = "^odd^" In 
  Let even = "^even^" In 
  Let isOdd = (yy odd even) True In
  isOdd ";;

  let eval expr = 
    let rec evaluate expr = 
      match expr with
      | Equal(e1, e2) ->  (
        match evaluate e1, evaluate e2 with
        (* Int *)
        | Int(v1), Int(v2) -> if v1 = v2 then Bool(true) else Bool(false)
        (* Boolean *)
        | Bool(true),Bool(true) -> Bool(true)
        | Bool(false), Bool(false) -> Bool(true)
        | Bool(true),Bool(false) -> Bool(false)
        | Bool(false),Bool(true) -> Bool(false)
        (* Variant *)
        | Variant(n1,v1),Varient(n2,v2) -> Bool(n1=n2 && v1=v2)
        | _ -> raise TypeMismatch )
      |...