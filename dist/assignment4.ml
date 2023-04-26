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
        let ycomb = 
         "(Fun code -> 
             Let repl = Fun self -> Fun x -> code (self self) x 
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
                
   let fb_mult = "("^ycomb_quad^mult_code^") 0";;

   let fb_abs = "(Fun x -> If (("^fb_geq^") x 0) Then x Else (0-x))";;

   let div_abs_code = "(Fun rec -> Fun cnt -> Fun target -> Fun arg -> If target = 0 Then 0 
                                                                        Else If arg = target Then (cnt+1)
                                                                        Else If (("^fb_geq^") arg target) Then cnt Else rec (cnt+1) (target-arg) arg)";;
   let fb_div_abs = "("^ycomb_quad^div_abs_code^") 0";;
   let fb_compare = "(Fun a -> Fun b -> If (("^fb_geq^") a 0 ) And  (("^fb_geq^") b 0 ) Then True
                                        Else If (("^fb_geq^") 0 a) And  (("^fb_geq^") 0 b ) Then True
                                        Else False)";;
   let div_code = "(Fun cnt -> Fun target -> Fun arg -> If target = 0 Then 0 
                                                        Else If arg = 0 Then 0
                                                        Else If (("^fb_compare^") arg target) Then ("^fb_div_abs^") (("^fb_abs^") target) (("^fb_abs^") arg)
                                                        Else (0- (("^fb_div_abs^") (("^fb_abs^") target) (("^fb_abs^") arg)) ) )";;
    
    
                                                                    
   let fb_div = "("^div_code^") 0";;
   
      
   (*
      assert(peu ("("^fb_geq^") 33 3") = "True");;
         --> 33 >= 3 => True
      assert(peu ("("^fb_geq^") (-1) 3") = "False");;
         --> -1 >= 3 => False
      assert(peu ("("^fb_mult^") 5 3") = "15");;
         --> 5 * 3 => 15
      assert(peu ("("^fb_mult^") (-3) 5") = "-15");;
         --> (-3) * 5 => (-15)
      assert(peu ("("^fb_div^") 33 3") = "11");;
         --> 33 / 3 => 11
      assert(peu ("("^fb_div^") 87 4") = "21");;
         --> 87 / 4 => 21
   *)
      
   (* Part 2 question 2.
   
      Fb is a simple language. But even it contains more constructs than strictly 
      necessary.
      For example, you don't even need integers! They can be encoded 
      by functions using what is called Church's encoding.
      (For more information, see http://en.wikipedia.org/wiki/Church_encoding)
   
      Essentially this encoding allows us to represent integers as 
      functions. 
      
       Here's some examples of the integer representation:
   
           0 --> Function f -> Function x -> x
           1 --> Function f -> Function x -> f x
           2 --> Function f -> Function x -> f (f x)
   
      Remember that all your answers should generate Fb programs as 
      strings.     
   
   *)
   
   (* In this first part, you can assume that we are dealing with only 
   *non-negative* integers. *)
   
   (* Write a Fb function to convert a church encoded int to an Fb native int.*)
   let ycomb_fif = 
    "(Fun code -> 
      Let repl = Fun self -> Fun x -> Fun y -> Fun z -> Fun p -> code (self self) x y z p
      In repl repl)";;
   let unchurch_code = "(Fun rec -> Fun round -> Fun f -> Fun x -> If round = 0 Then (Fun f -> Fun x) Else rec (round-1) f (f(x)))";;
   let fb_unchurch = "Fun church -> church (Fun sum -> sum + 1) 0";;
      
   (* Write a Fb function to convert an Fb native int to a church encoded int *)
   let church_code = "(Fun rec -> Fun round -> Fun f -> Fun x -> If round = 0 Then x Else rec (round-1) f (f(x)))";;
   let fb_church = ycomb_quad^church_code;;
      
   (*
   let church2 = "Function f -> Function x -> f (f x)";;
   assert ( peu ("("^fb_unchurch^")("^church2^")") = "2" );;
   assert ( peu ("("^fb_church^" 4) (Function n -> n + n) 3") = "48" );;
   *)
   
   (* Write a function to add two church encoded values *)
   let fb_church_add = "(Fun church_a -> Fun church_b ->("^fb_church^")((("^fb_unchurch^") church_a) + (("^fb_unchurch^") church_b)))";;
   
   (* Write a function to multiply two church encoded values *)
   let fb_church_mult = "(Fun church_a -> Fun church_b ->("^fb_church^")(("^fb_mult^") (("^fb_unchurch^") church_a) (("^fb_unchurch^") church_b)))";;
   
   (*
   let church2 = "(Function f -> Function x -> f (f x))";;
   let church3 =  "(Function f -> Function x -> f (f (f x)))" ;;
   assert ( peu ("("^fb_unchurch^") (("^fb_church_add^")"^church3^church2^")") = "5" );;
   assert ( peu ("("^fb_unchurch^") (("^fb_church_mult^")"^church3^church2^")") = "6" );;
   *)
   
   (* So far our encoding only deals with positive integers. However, we can 
      introduce negative integers to the system by making our encodings just a bit
      more complex.
      
      In order to achieve this, we need to first define pairs in this system.
      The pair is represented as a higher-order function that takes a function 
      argument that represents "operation to be performed on the componenets".
      And when given an argument, it will apply the function to pair's components.
      This is how we encoded pairs in lecture,
      
      For simplicity's sake, we've provided the definition for the pair constructor
      for you.
   
   *)
   
   let fb_church_pair = "Function x -> Function y -> Function f -> f x y"
   
   (* Write a function to get the first component of the pair *)
   let fb_church_fst = "Fun p -> p (Fun x -> Fun y -> x)";;
   
   (* Write a function to get the second component of the pair *)
   let fb_church_snd = "Fun p -> p (Fun x -> Fun y -> y)";;
   
   (*
   let church2 = "(Function f -> Function x -> f (f x))";;
   let church3 =  "(Function f -> Function x -> f (f (f x)))" ;;
   assert ( peu ("("^fb_unchurch^") ("^"("^fb_church_fst^") ("^"("^fb_church_pair^")"^church3^church2^")"^")") = "3" );;
   *)
   
   (* Now, we can redefine signed integers as a pair of integers, where the actual
      value is the difference between the two integers in the pair. *)
   
   let empty_church = "(Function f -> Function x -> (x))";;
   let fb_church_signed = "(Fun sign -> If (("^fb_geq^") sign 0) Then (("^fb_church_pair^") (("^fb_church^") sign) ("^empty_church^"))
                                                                 Else (("^fb_church_pair^") ("^empty_church^") (("^fb_church^") (0-(sign)))) )";; 
   
   let fb_unchurch_signed = "(Fun church -> (("^fb_unchurch^")(("^fb_church_fst^") church)) -  (("^fb_unchurch^")(("^fb_church_snd^") church)))";;
   
   (*
   assert ( peu @@ "("^fb_unchurch_signed^") (("^fb_church_signed^") 1)" = "1" );;
   assert ( peu @@ "("^fb_unchurch_signed^") (("^fb_church_signed^") (-3))" = "-3" );;
   *)
   
   (* Redefine the plus function using this new representation *)
   
   let fb_church_add_signed = "(Fun l -> Fun r -> ("^fb_church_signed^") ( (("^fb_unchurch_signed^") (l)) + (("^fb_unchurch_signed^") (r))) )";; 
   
   (*
   let church2 = "((" ^ fb_church_signed ^ ") 2)";;
   let churchn3 = "((" ^ fb_church_signed ^ ") (-3))";;
   assert (peu @@ "("^ fb_unchurch_signed ^")" ^ "((" ^ fb_church_add_signed ^ ") " ^ church2 ^ churchn3 ^")" = "-1" );;
   *)