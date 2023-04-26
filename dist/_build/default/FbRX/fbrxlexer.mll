{
  open Fbrxparser;;
  
  exception StringSyntaxError of string
} 

let blank = [' ' '\t' '\n' '\r']
let decimal_literal = ['0'-'9']+
let lowercase = ['a'-'z' '\223'-'\246' '\248'-'\255' '_']
let identchar = 
  ['A'-'Z' 'a'-'z' '_' '\192'-'\214' '\216'-'\246' '\248'-'\255' '\'' '0'-'9']

rule token = parse
  ['(']['*']([^'*']|['*'][^')'])*['*'][')'] 
    {token lexbuf} (* Ignore comments *)

(* basic *)
| blank+               { token lexbuf }
| lowercase identchar* { IDENT (Lexing.lexeme lexbuf) }
| ";;"                 { EOEX }
| eof                  { raise Exit }
| '('                  { LPAREN }
| ')'                  { RPAREN }

(* literal *)
| '"'                  { STRING (read_string lexbuf) }
| decimal_literal      { INT (int_of_string(Lexing.lexeme lexbuf)) }
| "False"              { BOOL false }
| "True"               { BOOL true }

(* int *)
| '+'                  { PLUS }
| '-'                  { MINUS }
| '='                  { EQUAL }

(* bool *)
| "And"                { AND }
| "Or"                 { OR }
| "Not"                { NOT }
| "If"                 { IF }
| "Then"               { THEN }
| "Else"               { ELSE }

(* func and let *)
| "Fun"                { FUNCTION }
| "Function"           { FUNCTION }
| "Let"                { LET }
| "Rec"                { REC }
| "In"                 { IN }
| "->"                 { GOESTO }

(* record *)
| '{'                  { LCURLY }
| '}'                  { RCURLY }
| '.'                  { DOT }
| ';'                  { SEMICOLON }
| '@'                  { APPEND }

(* exception *)
| "Try"                { TRY }
| "Raise"              { RAISE }
| "With"               { WITH }
| ['#'] (identchar+ as id)   { EXN id } 

and read_string =
  parse
  | [^ '"' '\\']+ { 
                    (* Must _explicitly_ force ordering due to side effects *)
                    let text = Lexing.lexeme lexbuf in
                    let rest = read_string lexbuf in
                    text ^ rest
                  }
  | '"'           { "" }
  | '\\' '/'      { "/" ^ read_string lexbuf }
  | '\\' '\\'     { "\\" ^ read_string lexbuf }
  | '\\' '"'      { "\"" ^ read_string lexbuf }
  | '\\' 'n'      { "\n" ^ read_string lexbuf }
  | '\\' 'r'      { "\r" ^ read_string lexbuf }
  | '\\' 't'      { "\t" ^ read_string lexbuf }
  | _             { raise (StringSyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }
  | eof           { raise (StringSyntaxError ("String is not terminated")) }

{} 



