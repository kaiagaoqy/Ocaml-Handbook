## 1. `Let` -- Naming Values
#### 1.1 `Let` variant can give names to values in **local** and **global** syntexs

``` ocaml
let name = expr1 in expr2;;
(* give expr1 the name within expr2*)
```
Local defination: name is only available in expr2, or we can say that the name is local to the body of `let`

examples:
```ocaml
 # let n = 2 in n*n;; (* int -> int *)
- : int = 4
```
One important difference from the other languages is that *the entire `Let` defination itself is an expression, where should return a value or function*

**EXPRESSION: EVERYTHING in OCaml RETURNS VALUES**

#### 1.2 `Let` can be nested
The let syntexs should be read inside out.
	1.  let a = 3 in a+b : int -> int = \<func\> ---> b+3
	2. let b = 2 in b+3 ---> 5
	3. let a = 1 in a+5 ---> 6 // stop
```ocaml
# let a = 1 in
  a + let b = 2  in
		    let a = 3 in
		      a+b;;
- : int = 6
```

#### 1.3 Full nested scope and Shadowing
1. Full nested scope: nested `let` establishes bindings that variables are all visible in the innermost `let` body
	- ex: let b = 2 is visible in a+b, to search for b, the innermost body will expand the searching to the nearest bound.(a=3 -> b =2)
2. shadowing: a name has a previous binding (in an outer scope) and you bind the same name again (like a in the above example); then the previous definded variable will be shadowed, and only the newest variable with the same name will be available
	- ex: when find (a + let b = 2) syntex, (a+b) will return with given a =3, b= 2; the syntex will not keep searching the next binding.
	- The value of the first a will not be overwritten!!!


#### 1.4 `let` and functions
To declare a function `squared` with `x` its one parameter. `return` is implicit.

``` OCaml
let squared x = x * x;; 
squared 4;; (* to call a function -- separate arguments with S P A C E S *)
```

-   OCaml has no `return` statement; value of the whole body-expression is what gets returned
-   Type is automatically **inferred** and printed as domain `->` range
-   OCaml functions in fact always take only one argument - ! multiple arguments can be encoded (later)