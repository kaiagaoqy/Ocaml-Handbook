
let cheapY = 
   "(Fun code -> 
      Let repl = Fun self -> Fun x ->  code (self self) x 
      In repl repl) ";;
    
      
let cheapY = 
  "(Fun code -> 
     Let repl = Fun self -> Fun z -> Fun x ->  If z = 0 Then (0 0) Else code (self self (z-1))  x 
     In repl repl) ";;

     
let repl = "(Fun f -> Fun self -> Fun x -> f (self self) x)";;
let cheapY = "(Fun code -> Fun x ->
               Let f = code In (f(f(f(f(f(f(f(f (f (f f)))))))))) x)";;
let code = "(Fun this -> Fun x -> If x = 1 Then 1 Else x + this (x-1))";; 


"("^cheapY^code^") 10"

let test = "Let f = 
   Fun this -> Fun x -> If x = 0 Then 0 Else x + this (x - 1)
In 
Let one = f(f(f(f(f(f(f(f(f (f (f f)))))))))) In
one 1"
let re =  "("^cheapY^code^" 10)";;


let emptylist = "{l=True;v={};r={}}";;
let cons = "(Fun left -> Fun right -> {l=False; v=left; r=right})";;
let head = "(Fun e -> e.v)";;
let tail = "(Fun e -> e.r)";;


let eglist = cons^"1 ("^cons^" 2 ("^cons^" 3 "^emptylist^"))";;


(* 
   utop # parse emptylist;;
- : expr = (Record [])

utop # peu ("("^cons^")3"^emptylist);;
- : string =
"{l = False; v = 3; r = {l = True; v = {}; r = {}}}"
utop # peu ("("^head^")("^eglist^")");;
- : string = "1"
utop # peu ("("^head^")("^tail^"("^eglist^"))");;
- : string = "2"
*)


