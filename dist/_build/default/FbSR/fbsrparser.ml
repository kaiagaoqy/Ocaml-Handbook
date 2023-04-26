
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | THEN
    | SET
    | SEMI
    | RPAREN
    | REF
    | REC
    | RCURLY
    | PLUS
    | OR
    | NOT
    | MINUS
    | LPAREN
    | LET
    | LCURLY
    | INT of (
# 23 "FbSR/fbsrparser.mly"
       (int)
# 29 "FbSR/fbsrparser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 20 "FbSR/fbsrparser.mly"
       (string)
# 36 "FbSR/fbsrparser.ml"
  )
    | GOESTO
    | GET
    | FUNCTION
    | EQUAL
    | EOEX
    | ELSE
    | DOT
    | BOOL of (
# 12 "FbSR/fbsrparser.mly"
       (bool)
# 48 "FbSR/fbsrparser.ml"
  )
    | AND
  
end

include MenhirBasics

# 1 "FbSR/fbsrparser.mly"
  

open Fbsrast


# 62 "FbSR/fbsrparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState01 : (('s, _menhir_box_main) _menhir_cell1_REF, _menhir_box_main) _menhir_state
    (** State 01.
        Stack shape : REF.
        Start symbol: main. *)

  | MenhirState02 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 02.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState03 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 03.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState04 : (('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : LET.
        Start symbol: main. *)

  | MenhirState05 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_state
    (** State 05.
        Stack shape : LET REC.
        Start symbol: main. *)

  | MenhirState07 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 07.
        Stack shape : LET REC ident_decl.
        Start symbol: main. *)

  | MenhirState09 : ((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : LET REC ident_decl ident_decl.
        Start symbol: main. *)

  | MenhirState10 : (('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_state
    (** State 10.
        Stack shape : LCURLY.
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : label.
        Start symbol: main. *)

  | MenhirState18 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 18.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState19 : (('s, _menhir_box_main) _menhir_cell1_GET, _menhir_box_main) _menhir_state
    (** State 19.
        Stack shape : GET.
        Start symbol: main. *)

  | MenhirState20 : (('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_state
    (** State 20.
        Stack shape : FUNCTION.
        Start symbol: main. *)

  | MenhirState22 : ((('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 22.
        Stack shape : FUNCTION ident_decl.
        Start symbol: main. *)

  | MenhirState25 : (('s, _menhir_box_main) _menhir_cell1_simple_expr, _menhir_box_main) _menhir_state
    (** State 25.
        Stack shape : simple_expr.
        Start symbol: main. *)

  | MenhirState30 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 30.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState32 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 32.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState34 : (('s, _menhir_box_main) _menhir_cell1_appl_expr, _menhir_box_main) _menhir_state
    (** State 34.
        Stack shape : appl_expr.
        Start symbol: main. *)

  | MenhirState36 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 36.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState38 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 38.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState40 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 40.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState42 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 42.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState46 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : IF expr.
        Start symbol: main. *)

  | MenhirState48 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 48.
        Stack shape : IF expr expr.
        Start symbol: main. *)

  | MenhirState51 : ((('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 51.
        Stack shape : label expr.
        Start symbol: main. *)

  | MenhirState54 : (((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 54.
        Stack shape : LET REC ident_decl ident_decl expr.
        Start symbol: main. *)

  | MenhirState57 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 57.
        Stack shape : LET ident_decl.
        Start symbol: main. *)

  | MenhirState59 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 59.
        Stack shape : LET ident_decl expr.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_appl_expr = 
  | MenhirCell1_appl_expr of 's * ('s, 'r) _menhir_state * (Fbsrast.expr)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Fbsrast.expr)

and ('s, 'r) _menhir_cell1_ident_decl = 
  | MenhirCell1_ident_decl of 's * ('s, 'r) _menhir_state * (Fbsrast.ident)

and ('s, 'r) _menhir_cell1_label = 
  | MenhirCell1_label of 's * ('s, 'r) _menhir_state * (Fbsrast.label)

and ('s, 'r) _menhir_cell1_simple_expr = 
  | MenhirCell1_simple_expr of 's * ('s, 'r) _menhir_state * (Fbsrast.expr)

and ('s, 'r) _menhir_cell1_FUNCTION = 
  | MenhirCell1_FUNCTION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GET = 
  | MenhirCell1_GET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LCURLY = 
  | MenhirCell1_LCURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REC = 
  | MenhirCell1_REC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REF = 
  | MenhirCell1_REF of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Fbsrast.expr) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 97 "FbSR/fbsrparser.mly"
      ( _1 )
# 256 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 99 "FbSR/fbsrparser.mly"
      ( Appl(_1,_2) )
# 264 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_03 =
  fun _1 ->
    (
# 66 "FbSR/fbsrparser.mly"
      ( _1 )
# 272 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 68 "FbSR/fbsrparser.mly"
      ( Plus(_1, _3) )
# 280 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 70 "FbSR/fbsrparser.mly"
      ( Minus(_1, _3) )
# 288 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 72 "FbSR/fbsrparser.mly"
      ( And(_1, _3) )
# 296 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 74 "FbSR/fbsrparser.mly"
      ( Or(_1, _3) )
# 304 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_08 =
  fun _2 ->
    (
# 76 "FbSR/fbsrparser.mly"
      ( Not _2 )
# 312 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 78 "FbSR/fbsrparser.mly"
      ( Equal(_1, _3) )
# 320 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_10 =
  fun _2 _4 ->
    (
# 80 "FbSR/fbsrparser.mly"
      ( Function(_2, _4) )
# 328 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_11 =
  fun _3 _4 _6 _8 ->
    (
# 82 "FbSR/fbsrparser.mly"
      ( LetRec(_3, _4, _6, _8) )
# 336 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_12 =
  fun _2 _4 _6 ->
    (
# 84 "FbSR/fbsrparser.mly"
      ( If(_2, _4, _6) )
# 344 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_13 =
  fun _2 _4 _6 ->
    (
# 86 "FbSR/fbsrparser.mly"
      ( Let(_2, _4, _6) )
# 352 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_14 =
  fun _2 ->
    (
# 88 "FbSR/fbsrparser.mly"
      ( Ref _2 )
# 360 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_15 =
  fun _1 _3 ->
    (
# 90 "FbSR/fbsrparser.mly"
      ( Set(_1, _3) )
# 368 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_16 =
  fun _2 ->
    (
# 92 "FbSR/fbsrparser.mly"
      ( Get _2 )
# 376 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_17 =
  fun _1 ->
    (
# 137 "FbSR/fbsrparser.mly"
      ( Ident _1 )
# 384 "FbSR/fbsrparser.ml"
     : (Fbsrast.ident))

let _menhir_action_18 =
  fun _1 ->
    (
# 132 "FbSR/fbsrparser.mly"
      ( Var _1 )
# 392 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_19 =
  fun _1 ->
    (
# 128 "FbSR/fbsrparser.mly"
      ( Lab _1 )
# 400 "FbSR/fbsrparser.ml"
     : (Fbsrast.label))

let _menhir_action_20 =
  fun _1 ->
    (
# 61 "FbSR/fbsrparser.mly"
            ( _1 )
# 408 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_21 =
  fun _1 _3 ->
    (
# 121 "FbSR/fbsrparser.mly"
      ( [(_1, _3)] )
# 416 "FbSR/fbsrparser.ml"
     : ((Fbsrast.label * Fbsrast.expr) list))

let _menhir_action_22 =
  fun _1 _3 _5 ->
    (
# 123 "FbSR/fbsrparser.mly"
      ( (_1, _3)::_5 )
# 424 "FbSR/fbsrparser.ml"
     : ((Fbsrast.label * Fbsrast.expr) list))

let _menhir_action_23 =
  fun _1 ->
    (
# 104 "FbSR/fbsrparser.mly"
      ( Int _1 )
# 432 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_24 =
  fun _1 ->
    (
# 106 "FbSR/fbsrparser.mly"
      ( Bool _1 )
# 440 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_25 =
  fun _1 ->
    (
# 108 "FbSR/fbsrparser.mly"
      ( _1 )
# 448 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_26 =
  fun _2 ->
    (
# 110 "FbSR/fbsrparser.mly"
      ( Record _2 )
# 456 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_27 =
  fun () ->
    (
# 112 "FbSR/fbsrparser.mly"
      ( Record [] )
# 464 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_28 =
  fun _1 _3 ->
    (
# 114 "FbSR/fbsrparser.mly"
      ( Select(_3, _1) )
# 472 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_action_29 =
  fun _2 ->
    (
# 116 "FbSR/fbsrparser.mly"
      ( _2 )
# 480 "FbSR/fbsrparser.ml"
     : (Fbsrast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BOOL _ ->
        "BOOL"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | EOEX ->
        "EOEX"
    | EQUAL ->
        "EQUAL"
    | FUNCTION ->
        "FUNCTION"
    | GET ->
        "GET"
    | GOESTO ->
        "GOESTO"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | LCURLY ->
        "LCURLY"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | MINUS ->
        "MINUS"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PLUS ->
        "PLUS"
    | RCURLY ->
        "RCURLY"
    | REC ->
        "REC"
    | REF ->
        "REF"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | SET ->
        "SET"
    | THEN ->
        "THEN"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_REF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REC ->
          let _menhir_stack = MenhirCell1_REC (_menhir_stack, MenhirState04) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v =
                let _1 = _v in
                _menhir_action_17 _1
              in
              let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState05, _v) in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_1 =
                    let _1 = _v_0 in
                    _menhir_action_17 _1
                  in
                  let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState07, _v_1) in
                  (match (_tok : MenhirBasics.token) with
                  | EQUAL ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | REF ->
                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | NOT ->
                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | LPAREN ->
                          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | LET ->
                          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | LCURLY ->
                          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | INT _v_2 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_2 in
                          let _v = _menhir_action_23 _1 in
                          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
                      | IF ->
                          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | IDENT _v_4 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _v_5 =
                            let _1 = _v_4 in
                            _menhir_action_17 _1
                          in
                          let _v_6 =
                            let _1 = _v_5 in
                            _menhir_action_18 _1
                          in
                          let _1 = _v_6 in
                          let _v = _menhir_action_25 _1 in
                          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
                      | GET ->
                          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | FUNCTION ->
                          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                      | BOOL _v_8 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_8 in
                          let _v = _menhir_action_24 _1 in
                          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState04, _v) in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REF ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | NOT ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | LPAREN ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | LET ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | LCURLY ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | INT _v_10 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_10 in
                  let _v = _menhir_action_23 _1 in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
              | IF ->
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | IDENT _v_12 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_13 =
                    let _1 = _v_12 in
                    _menhir_action_17 _1
                  in
                  let _v_14 =
                    let _1 = _v_13 in
                    _menhir_action_18 _1
                  in
                  let _1 = _v_14 in
                  let _v = _menhir_action_25 _1 in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
              | GET ->
                  _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | FUNCTION ->
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState57
              | BOOL _v_16 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_16 in
                  let _v = _menhir_action_24 _1 in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState57 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_27 () in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LCURLY (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_simple_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState03 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState57 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState54 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_35 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_appl_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BOOL _ | ELSE | EOEX | EQUAL | IDENT _ | IN | INT _ | LCURLY | LPAREN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMI | SET | THEN ->
          let MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_02 _1 _2 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_28 _1 _3 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_appl_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | LCURLY ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_23 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | IDENT _v_2 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_3 =
            let _1 = _v_2 in
            _menhir_action_17 _1
          in
          let _v_4 =
            let _1 = _v_3 in
            _menhir_action_18 _1
          in
          let _1 = _v_4 in
          let _v = _menhir_action_25 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | BOOL _v_6 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_6 in
          let _v = _menhir_action_24 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34 _tok
      | AND | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMI | SET | THEN ->
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState02 ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState57 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState54 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_66 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOEX ->
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          MenhirBox_main _v
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | BOOL _ | ELSE | EOEX | EQUAL | IDENT _ | IN | INT _ | LCURLY | LPAREN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMI | SET | THEN ->
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_GET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState20, _v) in
          (match (_tok : MenhirBasics.token) with
          | GOESTO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REF ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | NOT ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | LPAREN ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | LET ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | LCURLY ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_0 in
                  let _v = _menhir_action_23 _1 in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
              | IF ->
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | IDENT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_3 =
                    let _1 = _v_2 in
                    _menhir_action_17 _1
                  in
                  let _v_4 =
                    let _1 = _v_3 in
                    _menhir_action_18 _1
                  in
                  let _1 = _v_4 in
                  let _v = _menhir_action_25 _1 in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
              | GET ->
                  _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | FUNCTION ->
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
              | BOOL _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_6 in
                  let _v = _menhir_action_24 _1 in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_64 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_REF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_REF (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_14 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_63 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_08 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_61 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_29 _2 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_60 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMI | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_13 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_58 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REF ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | NOT ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LET ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LCURLY ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_23 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | IF ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_17 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_18 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | GET ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | FUNCTION ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_24 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_55 : type  ttv_stack. ((((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMI | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_REC (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _8 = _v in
          let _v = _menhir_action_11 _3 _4 _6 _8 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_53 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REF ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | NOT ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | LET ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | LCURLY ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_23 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | IF ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_17 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_18 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | GET ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | FUNCTION ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState54
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_24 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState54 _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMI ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState51 _tok
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RCURLY ->
          let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_21 _1 _3 in
          _menhir_goto_record_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_label (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REF ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | NOT ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | LET ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | LCURLY ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_23 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
          | IF ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_17 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_18 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
          | GET ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | FUNCTION ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_24 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_record_body : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState51 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState10 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_52 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expr (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_22 _1 _3 _5 in
      _menhir_goto_record_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LCURLY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_26 _2 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_49 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMI | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_12 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_47 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REF ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | NOT ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | LET ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | LCURLY ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_23 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
          | IF ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_17 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_18 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
          | GET ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | FUNCTION ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_24 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REF ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | NOT ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | LPAREN ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | LET ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | LCURLY ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_23 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
          | IF ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_17 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_18 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
          | GET ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | FUNCTION ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_24 _1 in
              _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
          | _ ->
              _eRR ())
      | SET ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_GET -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_GET (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_16 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | OR | RCURLY | RPAREN | SEMI | SET | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ELSE | EOEX | EQUAL | IN | OR | RCURLY | RPAREN | SEMI | SET | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_39 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_05 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMI | SET | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_07 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_04 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMI | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_15 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_29 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SET ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMI | THEN ->
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_10 _2 _4 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REF ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NOT ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LCURLY ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_23 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_17 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_18 _1
          in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | GET ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | FUNCTION ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_24 _1 in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 140 "FbSR/fbsrparser.mly"
  

# 2191 "FbSR/fbsrparser.ml"
