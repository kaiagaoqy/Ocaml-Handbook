
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | THEN
    | RPAREN
    | REC
    | PLUS
    | OR
    | NOT
    | MINUS
    | LPAREN
    | LET
    | INT of (
# 21 "Fb/fbparser.mly"
       (int)
# 24 "Fb/fbparser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 18 "Fb/fbparser.mly"
       (string)
# 31 "Fb/fbparser.ml"
  )
    | GOESTO
    | FUNCTION
    | EQUAL
    | EOEX
    | ELSE
    | BOOL of (
# 12 "Fb/fbparser.mly"
       (bool)
# 41 "Fb/fbparser.ml"
  )
    | AND
  
end

include MenhirBasics

# 1 "Fb/fbparser.mly"
  

open Fbast;;


# 55 "Fb/fbparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState01 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 01.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState04 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState05 : (('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_state
    (** State 05.
        Stack shape : LET.
        Start symbol: main. *)

  | MenhirState06 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_state
    (** State 06.
        Stack shape : LET REC.
        Start symbol: main. *)

  | MenhirState08 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : LET REC ident_decl.
        Start symbol: main. *)

  | MenhirState10 : ((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 10.
        Stack shape : LET REC ident_decl ident_decl.
        Start symbol: main. *)

  | MenhirState12 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : FUNCTION.
        Start symbol: main. *)

  | MenhirState15 : ((('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 15.
        Stack shape : FUNCTION ident_decl.
        Start symbol: main. *)

  | MenhirState22 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 22.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState24 : (('s, _menhir_box_main) _menhir_cell1_appl_expr, _menhir_box_main) _menhir_state
    (** State 24.
        Stack shape : appl_expr.
        Start symbol: main. *)

  | MenhirState26 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 26.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState28 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 28.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState30 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 30.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState32 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 32.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState35 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 35.
        Stack shape : IF expr.
        Start symbol: main. *)

  | MenhirState37 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 37.
        Stack shape : IF expr expr.
        Start symbol: main. *)

  | MenhirState40 : (((((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 40.
        Stack shape : LET REC ident_decl ident_decl expr.
        Start symbol: main. *)

  | MenhirState43 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 43.
        Stack shape : LET ident_decl.
        Start symbol: main. *)

  | MenhirState45 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 45.
        Stack shape : LET ident_decl expr.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_appl_expr = 
  | MenhirCell1_appl_expr of 's * ('s, 'r) _menhir_state * (Fbast.expr)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Fbast.expr)

and ('s, 'r) _menhir_cell1_ident_decl = 
  | MenhirCell1_ident_decl of 's * ('s, 'r) _menhir_state * (Fbast.ident)

and ('s, 'r) _menhir_cell1_FUNCTION = 
  | MenhirCell1_FUNCTION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_REC = 
  | MenhirCell1_REC of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Fbast.expr) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 83 "Fb/fbparser.mly"
      ( _1 )
# 199 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 85 "Fb/fbparser.mly"
      ( Appl(_1,_2) )
# 207 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_03 =
  fun _1 ->
    (
# 58 "Fb/fbparser.mly"
      ( _1 )
# 215 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 60 "Fb/fbparser.mly"
      ( Plus(_1, _3) )
# 223 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 62 "Fb/fbparser.mly"
      ( Minus(_1, _3) )
# 231 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 64 "Fb/fbparser.mly"
      ( And(_1, _3) )
# 239 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 66 "Fb/fbparser.mly"
      ( Or(_1, _3) )
# 247 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_08 =
  fun _2 ->
    (
# 68 "Fb/fbparser.mly"
      ( Not _2 )
# 255 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 70 "Fb/fbparser.mly"
      ( Equal(_1, _3) )
# 263 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_10 =
  fun _2 _4 ->
    (
# 72 "Fb/fbparser.mly"
      ( Function(_2, _4) )
# 271 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_11 =
  fun _2 _4 _6 ->
    (
# 74 "Fb/fbparser.mly"
      ( Let(_2, _4, _6) )
# 279 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_12 =
  fun _3 _4 _6 _8 ->
    (
# 76 "Fb/fbparser.mly"
      ( LetRec(_3, _4, _6, _8) )
# 287 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_13 =
  fun _2 _4 _6 ->
    (
# 78 "Fb/fbparser.mly"
      ( If(_2, _4, _6) )
# 295 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_14 =
  fun _1 ->
    (
# 113 "Fb/fbparser.mly"
      ( Ident _1 )
# 303 "Fb/fbparser.ml"
     : (Fbast.ident))

let _menhir_action_15 =
  fun _1 ->
    (
# 108 "Fb/fbparser.mly"
      ( Var _1 )
# 311 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_16 =
  fun _1 ->
    (
# 53 "Fb/fbparser.mly"
            ( _1 )
# 319 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_17 =
  fun _2 ->
    (
# 90 "Fb/fbparser.mly"
      ( Int (-_2) )
# 327 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_18 =
  fun _1 ->
    (
# 92 "Fb/fbparser.mly"
      ( _1 )
# 335 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_19 =
  fun _1 ->
    (
# 97 "Fb/fbparser.mly"
      ( Int _1 )
# 343 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_20 =
  fun _1 ->
    (
# 99 "Fb/fbparser.mly"
      ( Bool _1 )
# 351 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_21 =
  fun _1 ->
    (
# 101 "Fb/fbparser.mly"
      ( _1 )
# 359 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_action_22 =
  fun _2 ->
    (
# 103 "Fb/fbparser.mly"
      ( _2 )
# 367 "Fb/fbparser.ml"
     : (Fbast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BOOL _ ->
        "BOOL"
    | ELSE ->
        "ELSE"
    | EOEX ->
        "EOEX"
    | EQUAL ->
        "EQUAL"
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
    | REC ->
        "REC"
    | RPAREN ->
        "RPAREN"
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
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _2 = _v in
          let _v = _menhir_action_17 _2 in
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_appl_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | INT _v_0 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_19 _1 in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENT _v_2 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_3 =
            let _1 = _v_2 in
            _menhir_action_14 _1
          in
          let _v_4 =
            let _1 = _v_3 in
            _menhir_action_15 _1
          in
          let _1 = _v_4 in
          let _v = _menhir_action_21 _1 in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_6 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_6 in
          let _v = _menhir_action_20 _1 in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | AND | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RPAREN | THEN ->
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | REC ->
          let _menhir_stack = MenhirCell1_REC (_menhir_stack, MenhirState05) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v =
                let _1 = _v in
                _menhir_action_14 _1
              in
              let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState06, _v) in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_1 =
                    let _1 = _v_0 in
                    _menhir_action_14 _1
                  in
                  let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState08, _v_1) in
                  (match (_tok : MenhirBasics.token) with
                  | EQUAL ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | NOT ->
                          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                      | MINUS ->
                          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                      | LPAREN ->
                          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                      | LET ->
                          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                      | INT _v_2 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_2 in
                          let _v = _menhir_action_19 _1 in
                          _menhir_run_17_spec_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                      | IF ->
                          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                      | IDENT _v_4 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _v_5 =
                            let _1 = _v_4 in
                            _menhir_action_14 _1
                          in
                          let _v_6 =
                            let _1 = _v_5 in
                            _menhir_action_15 _1
                          in
                          let _1 = _v_6 in
                          let _v = _menhir_action_21 _1 in
                          _menhir_run_17_spec_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                      | FUNCTION ->
                          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState10
                      | BOOL _v_8 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let _1 = _v_8 in
                          let _v = _menhir_action_20 _1 in
                          _menhir_run_17_spec_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
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
            _menhir_action_14 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState05, _v) in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NOT ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | MINUS ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | LPAREN ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | LET ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | INT _v_10 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_10 in
                  let _v = _menhir_action_19 _1 in
                  _menhir_run_17_spec_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IF ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | IDENT _v_12 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_13 =
                    let _1 = _v_12 in
                    _menhir_action_14 _1
                  in
                  let _v_14 =
                    let _1 = _v_13 in
                    _menhir_action_15 _1
                  in
                  let _1 = _v_14 in
                  let _v = _menhir_action_21 _1 in
                  _menhir_run_17_spec_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FUNCTION ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState43
              | BOOL _v_16 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_16 in
                  let _v = _menhir_action_20 _1 in
                  _menhir_run_17_spec_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_10 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState10 _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_12 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState13, _v) in
          (match (_tok : MenhirBasics.token) with
          | GOESTO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NOT ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
              | MINUS ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
              | LPAREN ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
              | LET ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
              | INT _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_0 in
                  let _v = _menhir_action_19 _1 in
                  _menhir_run_17_spec_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IF ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
              | IDENT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_3 =
                    let _1 = _v_2 in
                    _menhir_action_14 _1
                  in
                  let _v_4 =
                    let _1 = _v_3 in
                    _menhir_action_15 _1
                  in
                  let _1 = _v_4 in
                  let _v = _menhir_action_21 _1 in
                  _menhir_run_17_spec_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FUNCTION ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
              | BOOL _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_6 in
                  let _v = _menhir_action_20 _1 in
                  _menhir_run_17_spec_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_15 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
  
  and _menhir_run_17_spec_43 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState43 _tok
  
  and _menhir_run_17_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_appl_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_02 _1 _2 in
      _menhir_goto_appl_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState45 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState43 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState37 ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState35 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_51 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOEX ->
          let _1 = _v in
          let _v = _menhir_action_16 _1 in
          MenhirBox_main _v
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_22 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
  
  and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_26 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26 _tok
  
  and _menhir_run_28 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_28 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28 _tok
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_30 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17_spec_32 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
  
  and _menhir_run_49 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_08 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_22 _2 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_simple_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_17_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_17_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState04 ->
          _menhir_run_17_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState45 ->
          _menhir_run_17_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState43 ->
          _menhir_run_17_spec_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState40 ->
          _menhir_run_17_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState10 ->
          _menhir_run_17_spec_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState37 ->
          _menhir_run_17_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState35 ->
          _menhir_run_17_spec_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_17_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState32 ->
          _menhir_run_17_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_17_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState28 ->
          _menhir_run_17_spec_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_17_spec_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState22 ->
          _menhir_run_17_spec_22 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState15 ->
          _menhir_run_17_spec_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_17_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_17_spec_01 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
  
  and _menhir_run_17_spec_45 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState45 _tok
  
  and _menhir_run_17_spec_40 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
  
  and _menhir_run_17_spec_37 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState37 _tok
  
  and _menhir_run_17_spec_35 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _v =
        let _1 = _v in
        _menhir_action_18 _1
      in
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35 _tok
  
  and _menhir_run_46 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_11 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_44 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | MINUS ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_17_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_14 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_15 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_17_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FUNCTION ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState45
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_17_spec_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ((((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, _6) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_REC (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _8 = _v in
          let _v = _menhir_action_12 _3 _4 _6 _8 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_39 : type  ttv_stack. (((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_REC, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | MINUS ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_17_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_14 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_15 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_17_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FUNCTION ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_17_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_13 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_36 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | MINUS ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_17_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_14 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_15 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_17_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FUNCTION ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState37
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_17_spec_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NOT ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | MINUS ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | LPAREN ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | LET ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | INT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_0 in
              let _v = _menhir_action_19 _1 in
              _menhir_run_17_spec_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_3 =
                let _1 = _v_2 in
                _menhir_action_14 _1
              in
              let _v_4 =
                let _1 = _v_3 in
                _menhir_action_15 _1
              in
              let _1 = _v_4 in
              let _v = _menhir_action_21 _1 in
              _menhir_run_17_spec_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FUNCTION ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
          | BOOL _v_6 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_6 in
              let _v = _menhir_action_20 _1 in
              _menhir_run_17_spec_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | OR | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | ELSE | EOEX | EQUAL | IN | OR | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_05 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_27 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_07 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_04 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_21 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_22 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | RPAREN | THEN ->
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
      | NOT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | MINUS ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_19 _1 in
          _menhir_run_17_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_14 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_15 _1
          in
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_run_17_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FUNCTION ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_20 _1 in
          _menhir_run_17_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 116 "Fb/fbparser.mly"
  

# 1779 "Fb/fbparser.ml"
