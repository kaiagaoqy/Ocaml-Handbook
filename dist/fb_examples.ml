(* ************************************** *)
(* ****** Programming In Fb ************* *)
(* ************************************** *)

(*   
   This file contains a series of Fb example programs.  They are formatted
   as strings which can be parsed and evaluated using the debug utilities.

   To run these examples in your interpeter, type shell command

   $ dune utop ./Fb

   To use the reference interpreter, type

   $ ./reference/Fb/toplevel.exe

   Once you have one of these utop's running, to make functions available type

   open Debugutils;;
   open Fbdk.Ast;;

*)

(* Note this file does not perform the actual evaluations; 
   some example evaluations are in comments such as
   
   peu "3+2";;
   
   -- the peu function abreviates unparse (eval (parse "3+2"))) - parse, eval, and pretty print. 
   
   Also remember you can use parse, eval, and unparse 
   individually on these examples to understand the underlying OCaml 
   AST representations and to debug your code. 

   Lastly, if you want to easily "copy/paste" all these examples in this file
   into the top loop you can type

   #use "fb_examples.ml";;

   Assuming you launched utop in the directory where this file is.
   If you are in the wrong directory you can use the usual Linux/Mac
   directory path stuff to load the file.  Also utop has #cd and #pwd which 
   work like the Linux/Mac terminal commands.

*)

open Fbdk.Ast;;
open Debugutils;;

let ex1 = "If Not(1 = 2) Then 3 Else 4";;

let ex2 = "(Fun x -> x + 1) 5" ;;

let ex3 = "(Fun x -> Fun y -> x + y) 4 5" ;;

let ex4 = "Let Rec fib x =
    If x = 1 Or x = 2 Then 1 Else fib (x - 1) + fib (x - 2)
    In fib 6" ;;

let ex5 = "(Fun x -> x + 2)(3 + 2 + 5)" ;;

let ex6 = "(Fun x -> Fun x -> x) 3" ;;

let ex7 = "Fun x -> Fun y -> x + y + z";;

let ex8 =
 "Let Rec x1 x2 =
     If x2 = 1 Then
          (Fun x3 -> x3 (x2 - 1)) (Fun x4 -> x4)
     Else
          x1 (x2 - 1)
  In x1 100";;

(* Here is a formatter for strings that are programs *)
(* unit type has only one value () *)
(* Unit is used when you need to take an argument or return a value, 
   but there’s no interesting value to pass or return. 
   It is the equivalent of void in Java, and is similar to None in Python. 
   There’s a special syntax that can be used to chain together multiple functions that return unit. 
   The expression e1; e2 first evaluates e1, which should evaluate to ()*)
let format s = s |> parse |> unparse |> print_string |> print_newline;; 
(* e1 |> e2 is just another way of writing e2 e1, we don’t need to state the semantics for |>:*)

let ex9 = "If 3 = 4 Then 5 Else 4 + 2" ;;

let ex10 = "(Fun x -> If 3 = x Then 5 Else x + 2) 4 " ;;

let ex11 = "(Fun x -> x x)(Fun y -> y)" ;;

let ex12 = "(Fun f -> Fun x -> f(f(x)))
           (Fun x -> x - 1) 4" ;;

let ex13 = "(Fun x -> Fun y -> x + y)
    ((Fun x -> If 3 = x Then 5 Else x + 2) 4)
    ((Fun f -> Fun x -> f (f x))
            (Fun x -> x - 1) 4 )" ;;

let ex14 = "Let Rec f x =
    If x = 1 Then 1 Else x + f (x - 1)
In f 3" ;;


let ex15 = "Let Rec f x =
    If x = 1 Then 1 Else x + f (x - 1)
  In f" ;;


let omega = "(Fun w -> w w)" ;;
let diverger = omega^omega ;;

let combI = "Fun x -> x";;
let combK = "Fun x -> Fun y -> x";;
let combS = "Fun x -> Fun y -> Fun z -> (x z) (y z)";;
let combD = "Fun x -> x x";;


(* ************************************************** *)
(* ****** Macro Encoding Features in Fb ************* *)
(* ************************************************** *)

(* 
   * Many features not present in Fb directly are in fact indirectly accessible as programming patterns
      - e.g. tuples, lists, recursion (even with out let rec), etc.
      - Possible with patterns of coding which serve the same effect as having the actual feature
   * In order to make these patterns 100% repeatable we more strongly show how they are expressible as *macros*
*)

(* ************************************************************ *)
(* ****** Simple Fb Macros Using String Concatenation ********* *)
(* ************************************************************ *)

(* 
   * Macros are simply functions on *code* aka *code templates*
   * They are run (expanded) by a compiler preprocessor to produce the final code object which is then compiled
   * They run like how our Fb evaluator runs: **substitute**
   * In an actual macro system you can use the full language syntax; C:

   #define double(n) (n + n) /* Full C syntax on RHS of this C macro */
      ... double(x-32) .. u code turns in to `(x-32) + (x-32)`
   Simple version for Fb: 
     * Use OCaml as the macro language
     * Represent Fb programs in OCaml just as the concrete syntax -- strings
     * Could instead use the Fb abstract syntax inside OCaml but harder to read
     * This approach is not ideal as we will see, but it is very simple. 
 *)

(* Here is a simple macro for a doubling function *)
(* use ^ to concate two strings *)
let double n = "(" ^ n ^ ") + (" ^ n ^ ")";; (* n is a _macro parameter_, a string *)


double "2 + 4";; (* "(2 + 4) + (2 + 4)" *)
(* peu(double "2+4") ==> "12" *)

(* 
   * Why didn't we just write n ^"+" ^ n above?? We need parens around all
   macro parameters like the n to not change the parse order.
   * This is the downside of working over concrete syntax as strings
   * Notice also that macros do not do any evaluation -- `2 + 4` not `6` in the above.
*)
(*
If we omit the two parens, then the prder would change from (2+4)+(2+4) to  2+4+2+4,    
*)

(* Macros can be used in other Fb code (strings) by appending them in 
   This is in principle how C etc macros work, but they work at the level of the parse tree *)

let quad = "Fun z -> " ^ double "z" ^ " + " ^ double "z";;
  
(* this returns "Fun z -> (z) + (z) + (z) + (z)" *)

(* If we just wrote "Fun z -> double z + double z" the `double` would be an Fb variable
   - not what we want!  Program would not be closed!  *)

(* Example of a bad string-based macro *)
let apply_bad f x = f^" "^x;; (* sort of looks OK here for f x ... *)
let apply_bad_eg = apply_bad "Fun x -> x" "0";; (* oops! this is string "Fun x -> x 0"  which is "Fun x -> (x 0)" *)

(* Fixed version - parens around each macro parameter *)
let apply f x = "("^f^")("^x^")";;
let apply_eg = apply "Fun x ->x" "0";; (* "(Fun x ->x)(0)", parsing is correct! *)

(* A more principled way to write Fb macros in OCaml would be to use ASTs as input and output to macros *)

let double_ast n = Plus(n,n);;
let quad_ast n = Plus(double_ast n, double_ast n);;
let eg_quad = quad_ast (Int 5);;

(* But, it is hard for humans to code in the above 
 so we use strings.
   Real macro languages such as #define in C or ppx in OCaml will parse the strings *)

(* ******************************************************** *)
(* ********* Macro Encodings of features in Fb ************ *)
(* ******************************************************** *)

(* We now show how features not directly expressible can be simply encoded
     - shows the power of Fb and of how features relate to each other
     - the encodings can be inefficient and make programs harder to read so want actual feature in eventually *)

(* ****** Encoding Pairs in Fb ********* *)   

(* First lets encode some by hand, then write a general macro. *)

(* Fact: the following odd thing can be made to behave a lot like OCaml's "(3,2)" *)

let pair_eg = "Fun d -> d 3 2";;

(* Proof: we can "get left side out" (and similarly for right) *)

let get_left = "Let p = Fun d -> d 3 2 In 
                p (Fun x -> Fun y -> x)"

(* A too-simple pair macro reflecting what we did above  *)

let pr_simple c1 c2  =  "Fun d -> d ("^c1^") ("^c2^")";;
let pair_eg_again = pr_simple "3" "2";;

(* pr_simple works for the above, but it makes a *lazy* pair, the components are not evaluated *)

let lazy_pair_eg = pr_simple "2+3" "3";; 
(* peu lazy_pair_eg  -- does not compute the 2+3 --> LAZY pair, not what OCaml does 
   -- here 2+3 will need to be computed every time first projection taken - inefficient! 
   (note that lazy languages such as Haskell in fact cache so are not this inefficient) *)

(* Macro which makes an eager pair, which is the OCaml form 
   Idea is to use Let to force the components to compute first. *)
let pr l r  =
  "(Let lft = ("^l^") In Let rgt = ("^r^") In
      Fun x -> x lft rgt)";;

let pc = pr "34+3" "45";; (* peu pc is "Fun x -> x 37 45" -- the eager pair that we wanted *)

(* Macros for extracting contents of pairs *)
let left c =  "Let p = "^c^" In p (Fun x -> Fun y -> x)";;
let right c =  "Let p = "^c^" In p (Fun x -> Fun y -> y)";;
let use_pr = left pc;;

(* peu use_pr;; *)

(* A use of pairs: an Fb function which takes a pair, adds up components 
   High level idea is Fun p -> left p + right p, add ^'s and ()'s  
   Since pair encoding is via macros you need to escape to OCaml to use them *)

let pair_add = "Fun p -> ("^ left "p" ^ ") + (" ^ right "p" ^ ")";;
let use_pair_add =  "(" ^ pair_add ^ ")(" ^ pc ^ ")";;


(* Note we could have instead directly made pr a 2-argument Fb function.
   - There is a trade-off of doing something in OCaml level (macro) or in Fb itself.
   In fact in a way this is easier since Fb makes sure the components were evaluated
   -- no Let needed.
*)

let pr_fb = "(Fun lft -> Fun rgt -> Fun x -> x lft rgt)";;
let pr_fb_eg = pr_fb ^ "(4+2) 5";;

(* ****** Encoding Lists ********* *)

(* See the book section 2.3.4. *)

(* First lets just make lists as pairs of (head,tail), 
   which has a bug *)

let cons_buggy e1 e2 = pr e1 e2;; (* use the above pair macro in cons (::) macro *)
let emptylist_buggy = pr "0" "0";; (* make something up here *)
let head_buggy e = left e;;
let tail_buggy e = right e;;

 (* [0;4;2] is informally encoded (0,(4,(2,(0,0)))): *)
let eglist = cons_buggy "0" (cons_buggy "4" (cons_buggy "2" emptylist_buggy));;
let eghd = head_buggy eglist;; (* evals to 0 *)
let egtl = tail_buggy eglist;;
let eghdtl = head_buggy (tail_buggy eglist);; (* evals to 4 *)

(* peu eghdtl;; *)

(* All good so far..  but, can't test for empty list!! - this encoding is broken
   Seems like "tl l = 0" would work but if l is not empty it would get stuck. *)

(* Solution: tag each element with a flag of emptylist or not *)
(* Makes lists triples of (tag,head,tail), tag True iff list is empty

   Informally, the list [1;2;3] would then be the nested triple

   (False, 1, (False, 2, (False, 3, (True, 0, 0))))

   Lets make triple macros *)

let triple a b c = pr (pr a b) c;; (* triples in terms of pairs (could have also made triples directly) *)
let tfirst t = left (left t);;
let tsecond t = right (left t);;
let tthird t = (right t);;

(* Now let us encode lists using triples as outined above *)
let cons (e1, e2) = triple "False" e1 e2;; (* tag False means its not emptylist *)
let empty_list = triple "True" "0" "0";; (* tag True --> empty list!  0's are filler *)
let head e = tsecond e;;
let tail e = tthird e;;
let isempty e = tfirst e;; (* Pull out the tag: True -> empty list, False -> not *)

let eglist = cons("0",cons("4",cons("2",empty_list)));;
(* This is informally (False, (0, (False, 4, (False, 2, (True, 0, 0))))) if Fb had primitive triples *)
let eghd = head eglist;;
let egtl = tail eglist;;
let eghdtl = head (tail eglist);;

(* Now for a real program: compute the length of a list *)

let length =
 "Let Rec len l =
      If "^isempty "l"^"
      Then 0
      Else
          1 + len ("^tail "l"^")
   In len";;

let eglength = "("^length^")("^eglist^")";;

(* peu eglength;; (* 3 *) *)

(* ****** Freeze and thaw macros ********* *)

(* Idea: stop and start evaluation explicitly. 
   These can be used to encode lazy data structures including infinite lists *)

(* Informal idea: put a dummy "Fun _ ->" in front to stop eval  *)
let fr = "(Fun _ -> 5 + 2 + 10922)";;
(* peu fr;; -- observe how evaluating this does nothing - don't evaluate function body *)
let thaw_fr = fr ^ "0";; (* any application will "thaw" it. *) 

(* Now let us make a macro for this simple operation *)

let freeze e = "(Fun _ -> ("^e^"))";; (* the Fun blocks the evaluator from e *)
let thaw e = "(("^e^") 0)";; (* the 0 here is arbitrary *)

(* Using Freeze and Thaw *)

let lazy_num = freeze "5 + 2 + 10922";;
(* peu lazy_num (* notice no arithmetic evaluation is taking place *) *)
let lazy_double = "(Fun nl -> "^thaw "nl"^" + "^thaw "nl"^")";;
let using_lazy = "Let f = "^lazy_double^" In f "^lazy_num;;
(* peu using_lazy;; *)

(* Freeze above has a bug if _ occurs free in expression e. 
   (Fb treats _ just like a variable, a flaw really) *)

let bad_freeze_use = "Let _ = 5 In ("^freeze "1 + _"^")"
let thaw_bad = thaw bad_freeze_use;; (* should be 6 but returns 1 *)
(*Take the value defined in thaw as the value of _*)
(* A somewhat-fix *)
let freeze e = "(Fun x_9282733 -> ("^e^"))";; 
(* above is a hack; really should change Fb parser to disallow `_` as variable use *)
(* This issue is called a _hygiene condition_ and real-world macro systems need to address this *)

(* ****** Encoding Let as function application ********* *)

(* Let is built-in but it is also easy to define as a macro: it is just a function call.
*)

(* Here is the idea of the encoding on an example *)

let let_eg = "Let x = 3+4 In x - 44";;
let let_as_application =  "(Fun x -> x - 44) (3+4)";; 
(* Has exact same effect as previous Let: both
   1. evaluate the 3+4
   2. get 7 as result there
   3. replace all x's with 7 in `x - 44` getting `7-44`
   4. running that to get `-37` *)

(* Here it is as a macro instead of just a coding pattern like the above: *)

let fblet x e1 e2 = "(Fun "^x^" -> "^e2^")("^e1^")";;
let let_ex = fblet "z" (* = *) "2+3" (* In *) "z + z";; (* encodes "Let z = 2 + 3 In z + z" *)
(* format let_ex;; - returns `(Fun z -> z + z) (2 + 3)` *)
(* peu let_ex;; - returns "10" *)

(* *********************** Equivalence ************************* *)

(* Observe that the application and the let form are *equivalent* 
    - replace a Let with a macro-let or vice-versa and get same answers 

   Formally, we can say the Let-version and the macro version are always equivalent:
      Let x = e in e'   ~=   (Fun x -> e')(e)   for any possible expressions e and e' and any variable x 
      e.g. Let x = 3+4 In x - 44 ~= (Fun x -> x - 44) (3+4) by above
      -- the ~= relation is called *operational equivalence*, we will define precisely later.
      -- informally, replacing one with the other will not change overall program result.
      -- it is an equivalence relation and lets us do "algebra on programs"
      -- we will use ~= below to help our understanding.
*)

(* Here are some classic equivalences from 90+ years ago:

  alpha-equivalence: rename parameter
      Fun x -> x ~= Fun y -> y   
      (can rename any variable definition with alpha, just change all uses as well)
  eta-equivalence: explicit forwarding of argument is a no-op
      (Fun x -> e x) ~= e     if e is a function
  beta-equivalance: "inlining a function call anywhere preserves meaning"
      (Fun x -> e) v ~= e[v/x] (with a subtle side-condition we skip for now)
      e.,g. (Fun z -> z + 1) 7 ~= 7 + 1 .. ~= 8
  Also  ~= is transitive, reflexive, symmetric, and we can always "substitute ~= for ~=".  Plus, arithmetic laws, etc.
*)

(* ************************************************************ *)
(* ********* Encoding Recursion With The Y Combinator ********* *)
(* ************************************************************ *)

(* Yes there is Let Rec syntax in Fb, but it is not needed! 
  First we will write recursive programs by hand and then we will
  make a general macro, the Y-combinator. *)

(*  As a warm-up, recall the logical paradox program: *)

let paradox = "Let p = (Fun s -> Not(s s)) In p p";;
(* peu paradox;; will get a stack overflow. 
   Good news: it is recursing
   Bad news: no base case! *)

(* Useful recursion by extending the above idea - add argument and base case *)

let summate0 = "(Fun self -> Fun arg ->
    If arg = 0 Then 0 Else arg + self self (arg - 1))";;

let summate0test = (summate0 ^ summate0 ^ "5");;

(* Key idea in the above is like the P P paradox but with arg and a base case:
   in particular for the case arg = 0 observe there is no recursion.

   Paradox is BAD for proofs (which must terminate), GOOD for coding!!
   Note that C++ and Python objects in fact do something like this self passing under hood *)

(* Here is summate as an independent function *)

let summate = (summate0 ^ summate0)

let summate0test' = (summate ^ "5");;

(*

  Let us *just* apply the first argument of the two above to see what is going on:

  format @@ peu (summate0^summate0);; -- returns:
  Fun arg ->
    If arg = 0 Then
        0
    Else
        arg + (Fun self ->
                   Fun arg ->
                       If arg = 0 Then 0 Else arg + self self (arg - 1)) 

              (Fun self ->
                   Fun arg -> 
                       If arg = 0 Then 0 Else arg + self self (arg - 1)) 
                       
              (arg - 1)

   which is informally just
   
   Fun arg ->
    If arg = 0 Then 0
    Else arg + summate0 summate0 (arg - 1)


  -- we can see the 2nd parameter `5` will come into the variable `arg` here 
  -- and the inner pattern is like what we started with, two summate0's applied to 5-1 ~= 4
  -- so, the pattern repeats.  Fortunately it stops when arg = 0, no infinite looping like paradoxes.

  Now, lets make a more user-friendly Y-macro for defining recursive functions.
  1) get rid of extra self parameter in recursive calls (turn `self self` into `rec`) and     
  2) get rid of the need to do the final line as a separate thing    
     -- lets make one master combinator to do all this. *)

(* So, our goal is to make a function ycomb such that:

ycomb (Fun rec -> Fun arg ->
    If arg = 0 Then 0 Else arg + rec (arg - 1)) 5

    computes to 15.

*)

(* Background: refactorings in Fb code *)

(* First a very common functional programming refactoring:
   Extract out a concrete operation as a (function) parameter.
   Allows a different operation to be "plugged in" easily

   Consider this starting program:
*)

let bump = "(Fun x -> If x = 0 Then 1 Else 0)";;

(* Suppose we wanted to convert this to code where the    
   equivalence relation `=` was instead a parameter, `op`
      -- makes for more general code *)

let bump_general = "(Fun op -> Fun x -> If op x 0 Then 1 Else 0)";;

(* Now feed in a concrete function for equivalence *)

let new_bump = bump_general^"(Fun n1 -> Fun n2 -> n1 = (n2 + 0))";;

(* The following two tests should give the same result *)

let test1 = bump^"4";;
(* peu test1;; *)

let test2 = new_bump^"4";;
(* peu test2;; *)

(* In general, we have bump ~= new_bump -- in *any* scenario we can replace one with the other safely *)

(* So, that was a really simple example, next is a somewhat more complex one
    - will allow us to turn `self self` into just `rec` with the spirit of this next one *)

(* 
  Suppose `x + x` appeared in multiple places in some 
  code, but want the programmer to just write `xpx`, and rig 
  a harness to pass in `x + x` in place of x.
  (Sort of like the double macro above but all in Fb)

  This will be more clear from the example below. *)

(* Suppose we actually want this code: *)
let goal_code =
   "(Fun x -> Fun y -> If y = 1 Then (x + x) Else (x + x) + 1)";;

(* But we want to let programmer to write the simpler *)   
let code = "(Fun xpx -> Fun y -> If y = 1 Then xpx Else xpx + 1)";; 

(* Here is converter Fb code that will do it: its just a function
   taking code as argument and producing something with goal_code behavior *)
let cvrt = "(Fun code -> Fun x -> Fun y -> code (x + x) y)";;

(* Observe: cvrt turns code into goal_code - inserts `x + x` for `xpx` *)
let converted_code = "("^cvrt^")("^code^")";;

(* Test to show it works *)
(* First lets run the goal *)
let run0 = goal_code^"5 2";;  (* peu run0;; *)
(* The converted code has the same value *)
let run = converted_code^" 5 2";; (* peu run;; *)

(* Observe how it 
    -- replaces the Fun xpx parameter with Fun x, 
    -- keeps the Fun y parameter 
    -- passes code `x + x` and `y`, meaning y just forwarded, x doubled and forwarded *)

(* We can see how we are doing code surgery if we just apply code argument: *)

(* format @@ peu converted_code;; -- shows how we plugged in the x + x; this prints
Fun x ->
    Fun y ->
        (Fun xpx -> Fun y -> If y = 1 Then xpx Else xpx + 1) (x + x) y 
*)

(* Note the above is not identical to goal_code, but it is *equivalent*:

   converted_code ~= goal_code

   Why ~=?  Informally, the evaluator stopped by Fun x before it could plug in (x + x), 
   but when x & y are applied the `x + x` will get run.
*)

(* Now back to Y above.. lets do the same trick, but
   instead of replacing xpx with (x + x) lets replace
   rec with (self self) to get something like summate0 as the goal code. *)

(* Here is the code we would like to write *)
let code = "(Fun rec -> Fun arg -> 
               If arg = 0 Then 0 Else arg + rec (arg - 1))" (* no `rec rec` just `rec` *)

(* here is the replacer -- replace rec with (self self) in above
   The f here will be something like `code` *)

let repl = "(Fun f -> Fun self -> Fun x -> f (self self) x)";;

(* Do the replacer -- should make something like summate0 *)
let summate0again = "("^repl^code^")";;
(* As with the above x + x case we get an *equivalent* but not *identical* program:
format @@ peu summate0again;; returns 
Fun self ->
    Fun x ->
        (Fun rec ->
             Fun arg -> If arg = 0 Then 0 Else arg + rec (arg - 1)) (self self) x

   -- "in our heads" we can see that the (self self) will be passed in for rec giving the desired result
   -- this is a bit subtle as recall our functions are call-by-value so it will in fact first compute
        self to a value so it won't even exactly be (self self).. a bit ugly!
*)
let go = summate0again^summate0again^"(5)";;
(* peu go;; (* verify it works *) *)

(* Now lets put this together to make a single ycomb to do it all.
   ycomb0 just packages what we did above into a function:
   feed it a `code`-shaped function as argument, run repl on it, and self-apply.
*)

let ycomb0 =
  "(Fun code -> 
      Let repl = Fun f -> Fun self -> Fun x -> f (self self) x 
      In
        (repl code)(repl code))";; (* recall `(repl code)` is ~= summate0 so this is ~= summate0 summate0 *)

(* Lets verify it works *)
let goy0 = ycomb0^code^" 5";;
(* peu goy0;; *)

(* The above works fine but we can simplify it a bit:
   inline variable code for repl's parameter f in ycomb0  
   to get ycomb that is in the book 
   -- this is an example of the beta ~= law mentioned above *)

let ycomb = 
   "(Fun code -> 
       Let repl = Fun self -> Fun x -> code (self self) x 
       In repl repl)";;

(* Again lets verify this works *)
let goy = ycomb^code^" 5";;
(* peu goy;; *)

(* Equivalent way with Fb names for things via `Let` .. 
   for HW4 part 2 this way may be easier to make sense of. *)
let goy' = 
"Let yy = "^ycomb^" In 
Let cc = "^code^" In 
Let summate = yy cc In
summate 5";;