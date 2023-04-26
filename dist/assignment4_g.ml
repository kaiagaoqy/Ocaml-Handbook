(*

PoPL Assignment 4 part 2
Your Name : Qingying Gao
List of Collaborators :

   For this part, you will write some programs in Fb.  Your answers for
   this section must be in the form of OCaml strings which parse
   to Fb ASTs.  If you want a macro for repeated code, you are welcome to use OCaml
   to put strings together as we did in the `fb_examples.ml` file.
   You are also welcome to copy-paste any code from that file into here.

   Remember to test your Fb code below against the reference Fb binaries (not just
   your own implementation of Fb which could in theory be buggy) to ensure that your
   functions work correctly.

 *)

(*
   Do realize this is a VERY primitive macro system, you will want to put () around
   any definition you make or when appended the parse order could change.

   For questions in this section you are not allowed to use the Let Rec syntax even
   if you have implemented it in your interpreter. Any recursion that you use must
   entirely be in terms of Functions. Feel free to implement an Fb Y-combinator
   here.  For examples and hints, see the file "fbdk/debugscript/fb_examples.ml".

   Remember to test your code against the standard Fb binaries (and not just your own
   implementation of Fb) to ensure that your functions work correctly.

*)

(* Part 2 question 1.

   Fb fails to provide any operations over integers more complex
   than addition and subtraction.  Below, define the following
   2-argument Fb functions: greater-than-or-equal-to, multiplication, 
   and integer division.  
   (Hint: if you get stuck, try getting them
   working for positive numbers first and then dealing with
   negatives.)  *)

   let ycomb_tri = 
    "(Fun code -> 
        Let repl = Fun self -> Fun x -> Fun y -> code (self self) x y
        In repl repl)";;
   let ycomb_quad = 
    "(Fun code -> 
        Let repl = Fun self -> Fun x -> Fun y -> Fun z -> code (self self) x y z
        In repl repl)";;
   let geq_code = "(Fun rec->Fun cnt -> Fun fst-> Fun snd -> If fst  = snd Then True
                                                            Else If (fst-snd) = cnt Then True
                                                            Else If (fst-snd) = (0-cnt) Then False
                                                            Else rec (cnt+1) fst snd)";;

   let fb_geq = "("^ycomb_quad^geq_code^") 0";;

   let mult_code = "(Fun rec -> Fun cnt -> Fun arg -> Fun round -> If ((round = cnt) Or ((0-round) = cnt)) Then 0 Else If (("^fb_geq^") round 0) Then (arg + (rec (cnt+1) arg round)) Else ((rec (cnt+1) arg round)-arg) )";;
                
   let fb_mult = parse("("^ycomb_quad^mult_code^") 0);;