
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WITH
    | TRY
    | THEN
    | STRING of (
# 21 "FbRX/fbrxparser.mly"
       (string)
# 18 "FbRX/fbrxparser.ml"
  )
    | SEMICOLON
    | RPAREN
    | REC
    | RCURLY
    | RAISE
    | PLUS
    | OR
    | NOT
    | MINUS
    | LPAREN
    | LET
    | LCURLY
    | INT of (
# 23 "FbRX/fbrxparser.mly"
       (int)
# 35 "FbRX/fbrxparser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 18 "FbRX/fbrxparser.mly"
       (string)
# 42 "FbRX/fbrxparser.ml"
  )
    | GOESTO
    | FUNCTION
    | EXN of (
# 56 "FbRX/fbrxparser.mly"
       (string)
# 49 "FbRX/fbrxparser.ml"
  )
    | EQUAL
    | EOEX
    | ELSE
    | DOT
    | BOOL of (
# 22 "FbRX/fbrxparser.mly"
       (bool)
# 58 "FbRX/fbrxparser.ml"
  )
    | APPEND
    | AND
  
end

include MenhirBasics

# 1 "FbRX/fbrxparser.mly"
  

open Fbrxast;;
exception DuplicateLabel

let mkexn n =
  "#" ^ n

# 76 "FbRX/fbrxparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState01 : (('s, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_state
    (** State 01.
        Stack shape : TRY.
        Start symbol: main. *)

  | MenhirState03 : (('s, _menhir_box_main) _menhir_cell1_RAISE, _menhir_box_main) _menhir_state
    (** State 03.
        Stack shape : RAISE.
        Start symbol: main. *)

  | MenhirState04 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState08 : ((('s, _menhir_box_main) _menhir_cell1_RAISE, _menhir_box_main) _menhir_cell1_exn_def, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : RAISE exn_def.
        Start symbol: main. *)

  | MenhirState09 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState10 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 10.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState11 : (('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_state
    (** State 11.
        Stack shape : LET.
        Start symbol: main. *)

  | MenhirState12 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : LET REC.
        Start symbol: main. *)

  | MenhirState14 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 14.
        Stack shape : LET REC ident_decl.
        Start symbol: main. *)

  | MenhirState16 : ((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : LET REC ident_decl ident_decl.
        Start symbol: main. *)

  | MenhirState17 : (('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_state
    (** State 17.
        Stack shape : LCURLY.
        Start symbol: main. *)

  | MenhirState23 : (('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_state
    (** State 23.
        Stack shape : label.
        Start symbol: main. *)

  | MenhirState25 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 25.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState26 : (('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_state
    (** State 26.
        Stack shape : FUNCTION.
        Start symbol: main. *)

  | MenhirState28 : ((('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 28.
        Stack shape : FUNCTION ident_decl.
        Start symbol: main. *)

  | MenhirState31 : (('s, _menhir_box_main) _menhir_cell1_simple_expr, _menhir_box_main) _menhir_state
    (** State 31.
        Stack shape : simple_expr.
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

  | MenhirState44 : (('s, _menhir_box_main) _menhir_cell1_appl_expr, _menhir_box_main) _menhir_state
    (** State 44.
        Stack shape : appl_expr.
        Start symbol: main. *)

  | MenhirState46 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState48 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 48.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState51 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 51.
        Stack shape : IF expr.
        Start symbol: main. *)

  | MenhirState53 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 53.
        Stack shape : IF expr expr.
        Start symbol: main. *)

  | MenhirState56 : ((('s, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 56.
        Stack shape : label expr.
        Start symbol: main. *)

  | MenhirState59 : (((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 59.
        Stack shape : LET REC ident_decl ident_decl expr.
        Start symbol: main. *)

  | MenhirState62 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 62.
        Stack shape : LET ident_decl.
        Start symbol: main. *)

  | MenhirState64 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 64.
        Stack shape : LET ident_decl expr.
        Start symbol: main. *)

  | MenhirState71 : ((('s, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 71.
        Stack shape : TRY expr.
        Start symbol: main. *)

  | MenhirState74 : (((('s, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_exn_def _menhir_cell0_IDENT, _menhir_box_main) _menhir_state
    (** State 74.
        Stack shape : TRY expr exn_def IDENT.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_appl_expr = 
  | MenhirCell1_appl_expr of 's * ('s, 'r) _menhir_state * (Fbrxast.expr)

and ('s, 'r) _menhir_cell1_exn_def = 
  | MenhirCell1_exn_def of 's * ('s, 'r) _menhir_state * (string)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Fbrxast.expr)

and ('s, 'r) _menhir_cell1_ident_decl = 
  | MenhirCell1_ident_decl of 's * ('s, 'r) _menhir_state * (Fbrxast.ident)

and ('s, 'r) _menhir_cell1_label = 
  | MenhirCell1_label of 's * ('s, 'r) _menhir_state * (Fbrxast.label)

and ('s, 'r) _menhir_cell1_simple_expr = 
  | MenhirCell1_simple_expr of 's * ('s, 'r) _menhir_state * (Fbrxast.expr)

and ('s, 'r) _menhir_cell1_FUNCTION = 
  | MenhirCell1_FUNCTION of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 18 "FbRX/fbrxparser.mly"
       (string)
# 265 "FbRX/fbrxparser.ml"
)

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

and ('s, 'r) _menhir_cell1_RAISE = 
  | MenhirCell1_RAISE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REC = 
  | MenhirCell1_REC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TRY = 
  | MenhirCell1_TRY of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Fbrxast.expr) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 117 "FbRX/fbrxparser.mly"
      ( _1 )
# 300 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 119 "FbRX/fbrxparser.mly"
      ( Appl(_1,_2) )
# 308 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_03 =
  fun _1 ->
    (
# 168 "FbRX/fbrxparser.mly"
       ( _1 )
# 316 "FbRX/fbrxparser.ml"
     : (string))

let _menhir_action_04 =
  fun _2 ->
    (
# 170 "FbRX/fbrxparser.mly"
       ( _2 )
# 324 "FbRX/fbrxparser.ml"
     : (string))

let _menhir_action_05 =
  fun _1 ->
    (
# 86 "FbRX/fbrxparser.mly"
      ( _1 )
# 332 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 88 "FbRX/fbrxparser.mly"
      ( Plus(_1, _3) )
# 340 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 90 "FbRX/fbrxparser.mly"
      ( Minus(_1, _3) )
# 348 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_08 =
  fun _1 _3 ->
    (
# 92 "FbRX/fbrxparser.mly"
      ( And(_1, _3) )
# 356 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 94 "FbRX/fbrxparser.mly"
      ( Or(_1, _3) )
# 364 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_10 =
  fun _2 ->
    (
# 96 "FbRX/fbrxparser.mly"
      ( Not _2 )
# 372 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_11 =
  fun _1 _3 ->
    (
# 98 "FbRX/fbrxparser.mly"
      ( Equal(_1, _3) )
# 380 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_12 =
  fun _1 _3 ->
    (
# 100 "FbRX/fbrxparser.mly"
      ( Append(_1, _3) )
# 388 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_13 =
  fun _2 _4 ->
    (
# 102 "FbRX/fbrxparser.mly"
      ( Function(_2, _4) )
# 396 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_14 =
  fun _2 _4 _6 ->
    (
# 104 "FbRX/fbrxparser.mly"
      ( If(_2, _4, _6) )
# 404 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_15 =
  fun _3 _4 _6 _8 ->
    (
# 106 "FbRX/fbrxparser.mly"
      ( LetRec(_3, _4, _6, _8) )
# 412 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_16 =
  fun _2 _4 _6 ->
    (
# 108 "FbRX/fbrxparser.mly"
      ( Let(_2, _4, _6) )
# 420 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_17 =
  fun _2 _4 _5 _7 ->
    (
# 110 "FbRX/fbrxparser.mly"
      ( let n = _4 in Try(_2, mkexn n, Ident _5, _7) )
# 428 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_18 =
  fun _2 _3 ->
    (
# 112 "FbRX/fbrxparser.mly"
      ( let n = _2 in Raise(mkexn n, _3) )
# 436 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_19 =
  fun _1 ->
    (
# 163 "FbRX/fbrxparser.mly"
      ( Ident _1 )
# 444 "FbRX/fbrxparser.ml"
     : (Fbrxast.ident))

let _menhir_action_20 =
  fun _1 ->
    (
# 158 "FbRX/fbrxparser.mly"
      ( Var _1 )
# 452 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_21 =
  fun _1 ->
    (
# 154 "FbRX/fbrxparser.mly"
      ( Lab _1 )
# 460 "FbRX/fbrxparser.ml"
     : (Fbrxast.label))

let _menhir_action_22 =
  fun _1 ->
    (
# 81 "FbRX/fbrxparser.mly"
            ( _1 )
# 468 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_23 =
  fun _1 _3 ->
    (
# 144 "FbRX/fbrxparser.mly"
      ( [(_1, _3)] )
# 476 "FbRX/fbrxparser.ml"
     : ((Fbrxast.label * Fbrxast.expr) list))

let _menhir_action_24 =
  fun _1 _3 _5 ->
    (
# 146 "FbRX/fbrxparser.mly"
      ( let rec addifnotpresent (lab, e) l =
          match l with [] -> [(lab,e)]
	   | (l1,e1) :: tl -> if l1=lab then (raise DuplicateLabel) else (l1,e1) :: (addifnotpresent (lab, e) tl)
          in addifnotpresent (_1, _3) _5 )
# 487 "FbRX/fbrxparser.ml"
     : ((Fbrxast.label * Fbrxast.expr) list))

let _menhir_action_25 =
  fun _1 ->
    (
# 124 "FbRX/fbrxparser.mly"
      ( Int _1 )
# 495 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_26 =
  fun _1 ->
    (
# 126 "FbRX/fbrxparser.mly"
      ( Bool _1 )
# 503 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_27 =
  fun _1 ->
    (
# 128 "FbRX/fbrxparser.mly"
      ( String _1 )
# 511 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_28 =
  fun _1 ->
    (
# 130 "FbRX/fbrxparser.mly"
      ( _1 )
# 519 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_29 =
  fun _2 ->
    (
# 132 "FbRX/fbrxparser.mly"
      ( Record _2 )
# 527 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_30 =
  fun () ->
    (
# 134 "FbRX/fbrxparser.mly"
      ( Record [] )
# 535 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_31 =
  fun _1 _3 ->
    (
# 136 "FbRX/fbrxparser.mly"
      ( Select(_3, _1) )
# 543 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_action_32 =
  fun _2 ->
    (
# 139 "FbRX/fbrxparser.mly"
      ( _2 )
# 551 "FbRX/fbrxparser.ml"
     : (Fbrxast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | APPEND ->
        "APPEND"
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
    | EXN _ ->
        "EXN"
    | FUNCTION ->
        "FUNCTION"
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
    | RAISE ->
        "RAISE"
    | RCURLY ->
        "RCURLY"
    | REC ->
        "REC"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | STRING _ ->
        "STRING"
    | THEN ->
        "THEN"
    | TRY ->
        "TRY"
    | WITH ->
        "WITH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TRY (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | APPEND | BOOL _ | ELSE | EOEX | EQUAL | IDENT _ | IN | INT _ | LCURLY | LPAREN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMICOLON | STRING _ | THEN | WITH ->
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_21 _1
          in
          let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_31 _1 _3 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_simple_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState74 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState64 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState62 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState53 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState51 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_45 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_appl_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | APPEND | BOOL _ | ELSE | EOEX | EQUAL | IDENT _ | IN | INT _ | LCURLY | LPAREN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMICOLON | STRING _ | THEN | WITH ->
          let MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_02 _1 _2 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_appl_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_27 _1 in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState44 _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | LCURLY ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_2 in
          let _v = _menhir_action_25 _1 in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState44 _tok
      | IDENT _v_4 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_5 =
            let _1 = _v_4 in
            _menhir_action_19 _1
          in
          let _v_6 =
            let _1 = _v_5 in
            _menhir_action_20 _1
          in
          let _1 = _v_6 in
          let _v = _menhir_action_28 _1 in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState44 _tok
      | BOOL _v_8 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_8 in
          let _v = _menhir_action_26 _1 in
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState44 _tok
      | AND | APPEND | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let _1 = _v in
          let _v = _menhir_action_05 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RAISE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState03
      | EXN _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState03 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | EXN _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_04 _2 in
          _menhir_goto_exn_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_exn_def : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState71 ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState03 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_72 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exn_def (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | GOESTO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRY ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | STRING _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_1 in
                  let _v = _menhir_action_27 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState74 _tok
              | RAISE ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | NOT ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | LPAREN ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | LET ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | LCURLY ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | INT _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_3 in
                  let _v = _menhir_action_25 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState74 _tok
              | IF ->
                  _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | IDENT _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_6 =
                    let _1 = _v_5 in
                    _menhir_action_19 _1
                  in
                  let _v_7 =
                    let _1 = _v_6 in
                    _menhir_action_20 _1
                  in
                  let _1 = _v_7 in
                  let _v = _menhir_action_28 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState74 _tok
              | FUNCTION ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState74
              | BOOL _v_9 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_9 in
                  let _v = _menhir_action_26 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState74 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState09 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REC ->
          let _menhir_stack = MenhirCell1_REC (_menhir_stack, MenhirState11) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v =
                let _1 = _v in
                _menhir_action_19 _1
              in
              let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState12, _v) in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_1 =
                    let _1 = _v_0 in
                    _menhir_action_19 _1
                  in
                  let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState14, _v_1) in
                  (match (_tok : MenhirBasics.token) with
                  | EQUAL ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | TRY ->
                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | STRING _v_2 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_2 in
                          let _v = _menhir_action_27 _1 in
                          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
                      | RAISE ->
                          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | NOT ->
                          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | LPAREN ->
                          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | LET ->
                          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | LCURLY ->
                          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | INT _v_4 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_4 in
                          let _v = _menhir_action_25 _1 in
                          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
                      | IF ->
                          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | IDENT _v_6 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _v_7 =
                            let _1 = _v_6 in
                            _menhir_action_19 _1
                          in
                          let _v_8 =
                            let _1 = _v_7 in
                            _menhir_action_20 _1
                          in
                          let _1 = _v_8 in
                          let _v = _menhir_action_28 _1 in
                          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
                      | FUNCTION ->
                          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
                      | BOOL _v_10 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_10 in
                          let _v = _menhir_action_26 _1 in
                          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
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
            _menhir_action_19 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState11, _v) in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRY ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | STRING _v_12 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_12 in
                  let _v = _menhir_action_27 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState62 _tok
              | RAISE ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | NOT ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | LPAREN ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | LET ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | LCURLY ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | INT _v_14 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_14 in
                  let _v = _menhir_action_25 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState62 _tok
              | IF ->
                  _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | IDENT _v_16 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_17 =
                    let _1 = _v_16 in
                    _menhir_action_19 _1
                  in
                  let _v_18 =
                    let _1 = _v_17 in
                    _menhir_action_20 _1
                  in
                  let _1 = _v_18 in
                  let _v = _menhir_action_28 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState62 _tok
              | FUNCTION ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
              | BOOL _v_20 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_20 in
                  let _v = _menhir_action_26 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState62 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_30 () in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LCURLY (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_label (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_27 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | RAISE ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | LCURLY ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | IF ->
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | IDENT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_5 =
                let _1 = _v_4 in
                _menhir_action_19 _1
              in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_20 _1
              in
              let _1 = _v_6 in
              let _v = _menhir_action_28 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | FUNCTION ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
          | BOOL _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_8 in
              let _v = _menhir_action_26 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState25 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState26, _v) in
          (match (_tok : MenhirBasics.token) with
          | GOESTO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRY ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | STRING _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_0 in
                  let _v = _menhir_action_27 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
              | RAISE ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | NOT ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | LPAREN ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | LET ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | LCURLY ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | INT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_2 in
                  let _v = _menhir_action_25 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
              | IF ->
                  _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | IDENT _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_5 =
                    let _1 = _v_4 in
                    _menhir_action_19 _1
                  in
                  let _v_6 =
                    let _1 = _v_5 in
                    _menhir_action_20 _1
                  in
                  let _1 = _v_6 in
                  let _v = _menhir_action_28 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
              | FUNCTION ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
              | BOOL _v_8 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_8 in
                  let _v = _menhir_action_26 _1 in
                  _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_RAISE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exn_def (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | STRING _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | INT _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_2 in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | IDENT _v_4 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_5 =
            let _1 = _v_4 in
            _menhir_action_19 _1
          in
          let _v_6 =
            let _1 = _v_5 in
            _menhir_action_20 _1
          in
          let _1 = _v_6 in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | BOOL _v_8 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_8 in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState74 ->
          _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState09 ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState64 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState62 ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState53 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState51 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_77 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOEX ->
          let _1 = _v in
          let _v = _menhir_action_22 _1 in
          MenhirBox_main _v
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_75 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_TRY, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_exn_def _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell0_IDENT (_menhir_stack, _5) = _menhir_stack in
          let MenhirCell1_exn_def (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_TRY (_menhir_stack, _menhir_s) = _menhir_stack in
          let _7 = _v in
          let _v = _menhir_action_17 _2 _4 _5 _7 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_70 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_TRY as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState71
          | EXN _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_03 _1 in
              _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState71 _tok
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_69 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_RAISE, _menhir_box_main) _menhir_cell1_exn_def as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_exn_def (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_RAISE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_18 _2 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_68 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NOT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_10 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_66 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_32 _2 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_65 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_16 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_63 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_27 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState64 _tok
          | RAISE ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | LCURLY ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState64 _tok
          | IF ->
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | IDENT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_5 =
                let _1 = _v_4 in
                _menhir_action_19 _1
              in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_20 _1
              in
              let _1 = _v_6 in
              let _v = _menhir_action_28 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState64 _tok
          | FUNCTION ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState64
          | BOOL _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_8 in
              let _v = _menhir_action_26 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState64 _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_60 : type  ttv_stack. ((((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_REC (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _8 = _v in
          let _v = _menhir_action_15 _3 _4 _6 _8 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_58 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_27 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | RAISE ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | LCURLY ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | IF ->
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | IDENT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_5 =
                let _1 = _v_4 in
                _menhir_action_19 _1
              in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_20 _1
              in
              let _1 = _v_6 in
              let _v = _menhir_action_28 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | FUNCTION ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
          | BOOL _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_8 in
              let _v = _menhir_action_26 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState59 _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_55 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState56 _tok
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RCURLY ->
          let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_23 _1 _3 in
          _menhir_goto_record_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_record_body : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState56 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState17 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_57 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_label, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expr (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_label (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_24 _1 _3 _5 in
      _menhir_goto_record_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LCURLY (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_29 _2 in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_54 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_14 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_52 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_27 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
          | RAISE ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | LCURLY ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
          | IF ->
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | IDENT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_5 =
                let _1 = _v_4 in
                _menhir_action_19 _1
              in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_20 _1
              in
              let _1 = _v_6 in
              let _v = _menhir_action_28 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
          | FUNCTION ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | BOOL _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_8 in
              let _v = _menhir_action_26 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState53 _tok
          | _ ->
              _eRR ())
      | APPEND ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_50 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRY ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | STRING _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_27 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState51 _tok
          | RAISE ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | NOT ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | LPAREN ->
              _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | LET ->
              _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | LCURLY ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | INT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_2 in
              let _v = _menhir_action_25 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState51 _tok
          | IF ->
              _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | IDENT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_5 =
                let _1 = _v_4 in
                _menhir_action_19 _1
              in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_20 _1
              in
              let _1 = _v_6 in
              let _v = _menhir_action_28 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState51 _tok
          | FUNCTION ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
          | BOOL _v_8 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_8 in
              let _v = _menhir_action_26 _1 in
              _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState51 _tok
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_49 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | OR | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_08 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ELSE | EOEX | EQUAL | IN | OR | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_11 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_07 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_39 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_12 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_35 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | APPEND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RCURLY | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_13 _2 _4 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRY ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | RAISE ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NOT ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LCURLY ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_25 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_19 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_20 _1
          in
          let _1 = _v in
          let _v = _menhir_action_28 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | FUNCTION ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 171 "FbRX/fbrxparser.mly"
  

# 2602 "FbRX/fbrxparser.ml"
