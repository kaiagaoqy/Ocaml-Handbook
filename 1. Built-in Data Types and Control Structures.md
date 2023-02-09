## 1. Built-in Data Types and Operations
1. Integer
	-  \+ - \* /
	``` ocaml
	let a = 1;; (*  int *)
	30980314323422L;; (* 64-bit integers *)
	```
2. Float
	- .+ .- .\* /
	```ocaml
	4.5;; (* floats *)
	
	4.5 +. 4.3;; (* operations are +. etc not just + which is for ints only *)
	```
3. Boolean
	-  `not`   `||`   `&&`
``` ocaml
let b = true;;

b && false;;
true || false;;
1 = 2;; (* = not == for equality comparison - ! *)
1 <> 2;;  (* <> not != for not equal *)
```

4. Char and String
``` ocaml
'c';; (* characters *)
"and of course strings";;

# "a"^"b";;
- : string = "ab"
# "abc".[1];;
- : char = 'b'
```

## 2. Control Structures
#### 2.1 Conditional Expression
``` ocaml
if expr then expr else expr
```
- you use parentheses around any _expr_ **only if necessary to disambiguate**, and that the entire conditional is itself an expression
- no standard layout and indent requirements
```ocaml
(if (x = 3) then 5 else 6) * 2;; (* (x==3)?5:6; *)
(* (if (x = 3) then 5.4 else 6) * 2;; *) (* type errors:  two branches of if must have same type *)
```
#### 2.2 Loop
##### a. For Loop
```ocaml
	for name = expr1 to expr2 do expr3 done
    for name = expr1 downto expr2 do expr3 done
```
-  _expr3_ is executed repeatedly
- The _name_ is bound in the loop body _expr3_
- The _name_ is bound to the integer values between `expr1` and `expr2` **inclusive**, either increasing (to) or decreasing (downto). 
``` ocaml
# for i = 1 to 3 do print_endline (string_of_int i) done;;
1
2
3
- : unit = ()
```
- `string_of_int` converts an int to a string
- and `print_endline` prints a string to standard output, terminating it with a newline.
- 
##### b. While Loop
```ocaml
  while _expr1_ do _expr2_ done
```
