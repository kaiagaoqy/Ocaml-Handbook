
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WITH
    | VARIANT of (
# 37 "AFbV/afbvparser.mly"
       (string)
# 16 "AFbV/afbvparser.ml"
  )
    | THEN
    | TAIL
    | STRING of (
# 22 "AFbV/afbvparser.mly"
       (string)
# 23 "AFbV/afbvparser.ml"
  )
    | SND
    | SENDTO
    | SEMICOLON
    | RPAREN
    | RBRACKET
    | PRINT
    | PLUS
    | PIPE
    | OR
    | NOT
    | MINUS
    | MATCH
    | LPAREN
    | LET
    | LBRACKET
    | INT of (
# 21 "AFbV/afbvparser.mly"
       (int)
# 43 "AFbV/afbvparser.ml"
  )
    | IN
    | IF
    | IDENT of (
# 18 "AFbV/afbvparser.mly"
       (string)
# 50 "AFbV/afbvparser.ml"
  )
    | HEAD
    | GOESTO
    | FUNCTION
    | FST
    | EQUAL
    | EOEX
    | ELSE
    | CREATE
    | CONS
    | COMMA
    | BOOL of (
# 12 "AFbV/afbvparser.mly"
       (bool)
# 65 "AFbV/afbvparser.ml"
  )
    | AND
  
end

include MenhirBasics

# 1 "AFbV/afbvparser.mly"
  

open Afbvast;;


# 79 "AFbV/afbvparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState01 : (('s, _menhir_box_main) _menhir_cell1_VARIANT, _menhir_box_main) _menhir_state
    (** State 01.
        Stack shape : VARIANT.
        Start symbol: main. *)

  | MenhirState02 : (('s, _menhir_box_main) _menhir_cell1_TAIL, _menhir_box_main) _menhir_state
    (** State 02.
        Stack shape : TAIL.
        Start symbol: main. *)

  | MenhirState04 : (('s, _menhir_box_main) _menhir_cell1_SND, _menhir_box_main) _menhir_state
    (** State 04.
        Stack shape : SND.
        Start symbol: main. *)

  | MenhirState05 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 05.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState06 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 06.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState07 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 07.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState08 : (('s, _menhir_box_main) _menhir_cell1_MATCH, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : MATCH.
        Start symbol: main. *)

  | MenhirState09 : (('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_state
    (** State 09.
        Stack shape : LET.
        Start symbol: main. *)

  | MenhirState12 : ((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 12.
        Stack shape : LET ident_decl.
        Start symbol: main. *)

  | MenhirState13 : (('s, _menhir_box_main) _menhir_cell1_LBRACKET, _menhir_box_main) _menhir_state
    (** State 13.
        Stack shape : LBRACKET.
        Start symbol: main. *)

  | MenhirState16 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 16.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState17 : (('s, _menhir_box_main) _menhir_cell1_HEAD, _menhir_box_main) _menhir_state
    (** State 17.
        Stack shape : HEAD.
        Start symbol: main. *)

  | MenhirState18 : (('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_state
    (** State 18.
        Stack shape : FUNCTION.
        Start symbol: main. *)

  | MenhirState20 : ((('s, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_state
    (** State 20.
        Stack shape : FUNCTION ident_decl.
        Start symbol: main. *)

  | MenhirState21 : (('s, _menhir_box_main) _menhir_cell1_FST, _menhir_box_main) _menhir_state
    (** State 21.
        Stack shape : FST.
        Start symbol: main. *)

  | MenhirState27 : (('s, _menhir_box_main) _menhir_cell1_CREATE, _menhir_box_main) _menhir_state
    (** State 27.
        Stack shape : CREATE.
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

  | MenhirState44 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 44.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState46 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 46.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState48 : (('s, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 48.
        Stack shape : expr.
        Start symbol: main. *)

  | MenhirState50 : ((('s, _menhir_box_main) _menhir_cell1_CREATE, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 50.
        Stack shape : CREATE expr.
        Start symbol: main. *)

  | MenhirState56 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 56.
        Stack shape : IF expr.
        Start symbol: main. *)

  | MenhirState58 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 58.
        Stack shape : IF expr expr.
        Start symbol: main. *)

  | MenhirState63 : (((('s, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 63.
        Stack shape : LET ident_decl expr.
        Start symbol: main. *)

  | MenhirState66 : ((('s, _menhir_box_main) _menhir_cell1_MATCH, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_state
    (** State 66.
        Stack shape : MATCH expr.
        Start symbol: main. *)

  | MenhirState67 : (('s, _menhir_box_main) _menhir_cell1_VARIANT, _menhir_box_main) _menhir_state
    (** State 67.
        Stack shape : VARIANT.
        Start symbol: main. *)

  | MenhirState68 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 68.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState73 : ((('s, _menhir_box_main) _menhir_cell1_VARIANT, _menhir_box_main) _menhir_cell1_pattern_ident, _menhir_box_main) _menhir_state
    (** State 73.
        Stack shape : VARIANT pattern_ident.
        Start symbol: main. *)

  | MenhirState76 : (('s, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_VARIANT, _menhir_box_main) _menhir_state
    (** State 76.
        Stack shape : PIPE VARIANT.
        Start symbol: main. *)

  | MenhirState78 : ((('s, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_VARIANT, _menhir_box_main) _menhir_cell1_pattern_ident, _menhir_box_main) _menhir_state
    (** State 78.
        Stack shape : PIPE VARIANT pattern_ident.
        Start symbol: main. *)

  | MenhirState81 : (((('s, _menhir_box_main) _menhir_cell1_MATCH, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_pattern_list, _menhir_box_main) _menhir_state
    (** State 81.
        Stack shape : MATCH expr pattern_list.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_appl_expr = 
  | MenhirCell1_appl_expr of 's * ('s, 'r) _menhir_state * (Afbvast.expr)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Afbvast.expr)

and ('s, 'r) _menhir_cell1_ident_decl = 
  | MenhirCell1_ident_decl of 's * ('s, 'r) _menhir_state * (Afbvast.ident)

and ('s, 'r) _menhir_cell1_pattern_ident = 
  | MenhirCell1_pattern_ident of 's * ('s, 'r) _menhir_state * (Afbvast.ident)

and ('s, 'r) _menhir_cell1_pattern_list = 
  | MenhirCell1_pattern_list of 's * ('s, 'r) _menhir_state * ((Afbvast.name * Afbvast.ident * Afbvast.expr) list)

and ('s, 'r) _menhir_cell1_CREATE = 
  | MenhirCell1_CREATE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FST = 
  | MenhirCell1_FST of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FUNCTION = 
  | MenhirCell1_FUNCTION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_HEAD = 
  | MenhirCell1_HEAD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACKET = 
  | MenhirCell1_LBRACKET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MATCH = 
  | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PIPE = 
  | MenhirCell1_PIPE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINT = 
  | MenhirCell1_PRINT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SND = 
  | MenhirCell1_SND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TAIL = 
  | MenhirCell1_TAIL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VARIANT = 
  | MenhirCell1_VARIANT of 's * ('s, 'r) _menhir_state * (
# 37 "AFbV/afbvparser.mly"
       (string)
# 334 "AFbV/afbvparser.ml"
)

and 's _menhir_cell0_VARIANT = 
  | MenhirCell0_VARIANT of 's * (
# 37 "AFbV/afbvparser.mly"
       (string)
# 341 "AFbV/afbvparser.ml"
)

and _menhir_box_main = 
  | MenhirBox_main of (Afbvast.expr) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 128 "AFbV/afbvparser.mly"
      ( _1 )
# 352 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 130 "AFbV/afbvparser.mly"
      ( Appl(_1,_2) )
# 360 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_03 =
  fun _1 ->
    (
# 81 "AFbV/afbvparser.mly"
      ( _1 )
# 368 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_04 =
  fun _1 _3 ->
    (
# 83 "AFbV/afbvparser.mly"
      ( Plus(_1, _3) )
# 376 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_05 =
  fun _1 _3 ->
    (
# 85 "AFbV/afbvparser.mly"
      ( Minus(_1, _3) )
# 384 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_06 =
  fun _1 _3 ->
    (
# 87 "AFbV/afbvparser.mly"
      ( And(_1, _3) )
# 392 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_07 =
  fun _1 _3 ->
    (
# 89 "AFbV/afbvparser.mly"
      ( Or(_1, _3) )
# 400 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_08 =
  fun _2 ->
    (
# 91 "AFbV/afbvparser.mly"
      ( Not _2 )
# 408 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_09 =
  fun _1 _3 ->
    (
# 93 "AFbV/afbvparser.mly"
      ( Equal(_1, _3) )
# 416 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_10 =
  fun _2 _4 ->
    (
# 95 "AFbV/afbvparser.mly"
      ( Function(_2, _4) )
# 424 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_11 =
  fun _2 _4 _6 ->
    (
# 97 "AFbV/afbvparser.mly"
      ( If(_2, _4, _6) )
# 432 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_12 =
  fun _1 _3 ->
    (
# 99 "AFbV/afbvparser.mly"
      ( Seq(_1, _3) )
# 440 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_13 =
  fun _2 _4 _6 ->
    (
# 101 "AFbV/afbvparser.mly"
      ( Let(_2, _4, _6) )
# 448 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_14 =
  fun _1 _3 ->
    (
# 103 "AFbV/afbvparser.mly"
      ( Pair(_1, _3) )
# 456 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_15 =
  fun _2 ->
    (
# 105 "AFbV/afbvparser.mly"
      ( Fst _2 )
# 464 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_16 =
  fun _2 ->
    (
# 107 "AFbV/afbvparser.mly"
      ( Snd _2 )
# 472 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_17 =
  fun _1 _2 ->
    (
# 109 "AFbV/afbvparser.mly"
      ( Variant(Name _1, _2) )
# 480 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_18 =
  fun _2 _4 ->
    (
# 111 "AFbV/afbvparser.mly"
      ( Match(_2, _4) )
# 488 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_19 =
  fun _1 _3 ->
    (
# 113 "AFbV/afbvparser.mly"
      ( Cons(_1, _3) )
# 496 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_20 =
  fun _2 ->
    (
# 115 "AFbV/afbvparser.mly"
      ( Head _2 )
# 504 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_21 =
  fun _2 ->
    (
# 117 "AFbV/afbvparser.mly"
      ( Tail _2 )
# 512 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_22 =
  fun _3 _5 ->
    (
# 119 "AFbV/afbvparser.mly"
      ( Create(_3, _5) )
# 520 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_23 =
  fun _1 _3 ->
    (
# 121 "AFbV/afbvparser.mly"
      ( Send(_1, _3) )
# 528 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_24 =
  fun _2 ->
    (
# 123 "AFbV/afbvparser.mly"
      ( Print _2 )
# 536 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_25 =
  fun _1 ->
    (
# 163 "AFbV/afbvparser.mly"
      ( Ident _1 )
# 544 "AFbV/afbvparser.ml"
     : (Afbvast.ident))

let _menhir_action_26 =
  fun _1 ->
    (
# 158 "AFbV/afbvparser.mly"
      ( Var _1 )
# 552 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_27 =
  fun _1 ->
    (
# 76 "AFbV/afbvparser.mly"
            ( _1 )
# 560 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_28 =
  fun _1 _2 _4 ->
    (
# 175 "AFbV/afbvparser.mly"
      ( ((Name _1), _2,_4) )
# 568 "AFbV/afbvparser.ml"
     : (Afbvast.name * Afbvast.ident * Afbvast.expr))

let _menhir_action_29 =
  fun _2 _3 _5 ->
    (
# 177 "AFbV/afbvparser.mly"
      ( ((Name _2), _3, _5) )
# 576 "AFbV/afbvparser.ml"
     : (Afbvast.name * Afbvast.ident * Afbvast.expr))

let _menhir_action_30 =
  fun _1 ->
    (
# 182 "AFbV/afbvparser.mly"
       ( _1 )
# 584 "AFbV/afbvparser.ml"
     : (Afbvast.ident))

let _menhir_action_31 =
  fun _2 ->
    (
# 184 "AFbV/afbvparser.mly"
       ( _2 )
# 592 "AFbV/afbvparser.ml"
     : (Afbvast.ident))

let _menhir_action_32 =
  fun _1 ->
    (
# 168 "AFbV/afbvparser.mly"
      ( [_1] )
# 600 "AFbV/afbvparser.ml"
     : ((Afbvast.name * Afbvast.ident * Afbvast.expr) list))

let _menhir_action_33 =
  fun _1 _3 ->
    (
# 170 "AFbV/afbvparser.mly"
      ( _1 @ [_3] )
# 608 "AFbV/afbvparser.ml"
     : ((Afbvast.name * Afbvast.ident * Afbvast.expr) list))

let _menhir_action_34 =
  fun _1 ->
    (
# 135 "AFbV/afbvparser.mly"
      ( Int _1 )
# 616 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_35 =
  fun _1 ->
    (
# 137 "AFbV/afbvparser.mly"
      ( Bool _1 )
# 624 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_36 =
  fun _1 ->
    (
# 139 "AFbV/afbvparser.mly"
      ( String _1 )
# 632 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_37 =
  fun _1 ->
    (
# 141 "AFbV/afbvparser.mly"
      ( _1 )
# 640 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_38 =
  fun _2 ->
    (
# 143 "AFbV/afbvparser.mly"
      ( _2 )
# 648 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_39 =
  fun () ->
    (
# 145 "AFbV/afbvparser.mly"
      ( EmptyList )
# 656 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_action_40 =
  fun _2 ->
    (
# 147 "AFbV/afbvparser.mly"
      (
        let rec seq_to_list e = match e with
          | Seq(e1, e2) -> Cons(e1, seq_to_list e2)
          | v -> Cons(v, EmptyList)
        in
          seq_to_list _2
      )
# 670 "AFbV/afbvparser.ml"
     : (Afbvast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BOOL _ ->
        "BOOL"
    | COMMA ->
        "COMMA"
    | CONS ->
        "CONS"
    | CREATE ->
        "CREATE"
    | ELSE ->
        "ELSE"
    | EOEX ->
        "EOEX"
    | EQUAL ->
        "EQUAL"
    | FST ->
        "FST"
    | FUNCTION ->
        "FUNCTION"
    | GOESTO ->
        "GOESTO"
    | HEAD ->
        "HEAD"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | LBRACKET ->
        "LBRACKET"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | MATCH ->
        "MATCH"
    | MINUS ->
        "MINUS"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PIPE ->
        "PIPE"
    | PLUS ->
        "PLUS"
    | PRINT ->
        "PRINT"
    | RBRACKET ->
        "RBRACKET"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | SENDTO ->
        "SENDTO"
    | SND ->
        "SND"
    | STRING _ ->
        "STRING"
    | TAIL ->
        "TAIL"
    | THEN ->
        "THEN"
    | VARIANT _ ->
        "VARIANT"
    | WITH ->
        "WITH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_VARIANT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState01
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | STRING _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_1 in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | INT _v_3 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_3 in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | IDENT _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_6 =
            let _1 = _v_5 in
            _menhir_action_25 _1
          in
          let _v_7 =
            let _1 = _v_6 in
            _menhir_action_26 _1
          in
          let _1 = _v_7 in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | BOOL _v_9 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_9 in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TAIL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_02 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_TAIL -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
  
  and _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_0 in
          let _v = _menhir_action_36 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPAREN ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | INT _v_2 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_2 in
          let _v = _menhir_action_34 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENT _v_4 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_5 =
            let _1 = _v_4 in
            _menhir_action_25 _1
          in
          let _v_6 =
            let _1 = _v_5 in
            _menhir_action_26 _1
          in
          let _1 = _v_6 in
          let _v = _menhir_action_37 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v_8 ->
          let _menhir_stack = MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v_8 in
          let _v = _menhir_action_35 _1 in
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | AND | COMMA | CONS | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let _1 = _v in
          let _v = _menhir_action_03 _1 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_appl_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_appl_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_02 _1 _2 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_05 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05 _tok
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SND (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_88 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_SND -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SND (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_16 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_92 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_90 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_89 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_86 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_85 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_84 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState78 ->
          _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState73 ->
          _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState08 ->
          _menhir_run_65 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState63 ->
          _menhir_run_64 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_60 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState58 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState56 ->
          _menhir_run_57 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_55 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_53 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState50 ->
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState46 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState42 ->
          _menhir_run_43 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState27 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_92 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOEX ->
          let _1 = _v in
          let _v = _menhir_action_27 _1 in
          MenhirBox_main _v
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_30 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState30 _tok
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState06
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_06 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState06 _tok
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_07 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState08
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_08 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_MATCH -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState08 _tok
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState09, _v) in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VARIANT _v_0 ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState12
              | TAIL ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | STRING _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_1 in
                  let _v = _menhir_action_36 _1 in
                  _menhir_run_28_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | SND ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | PRINT ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | NOT ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | MATCH ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | LPAREN ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | LET ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | LBRACKET ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | INT _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_3 in
                  let _v = _menhir_action_34 _1 in
                  _menhir_run_28_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IF ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | IDENT _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_6 =
                    let _1 = _v_5 in
                    _menhir_action_25 _1
                  in
                  let _v_7 =
                    let _1 = _v_6 in
                    _menhir_action_26 _1
                  in
                  let _1 = _v_7 in
                  let _v = _menhir_action_37 _1 in
                  _menhir_run_28_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | HEAD ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | FUNCTION ->
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | FST ->
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | CREATE ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
              | BOOL _v_9 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_9 in
                  let _v = _menhir_action_35 _1 in
                  _menhir_run_28_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_12 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13
      | TAIL ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | STRING _v ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PRINT ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | NOT ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | MATCH ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LPAREN ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LET ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LBRACKET ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | INT _v ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | FUNCTION ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | FST ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | CREATE ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | BOOL _v ->
          let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_28_spec_13 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LBRACKET -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
  
  and _menhir_goto_simple_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState04 ->
          _menhir_run_88 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState00 ->
          _menhir_run_28_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState01 ->
          _menhir_run_28_spec_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState02 ->
          _menhir_run_28_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState05 ->
          _menhir_run_28_spec_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState06 ->
          _menhir_run_28_spec_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_28_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState78 ->
          _menhir_run_28_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState73 ->
          _menhir_run_28_spec_73 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState08 ->
          _menhir_run_28_spec_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState63 ->
          _menhir_run_28_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState12 ->
          _menhir_run_28_spec_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState13 ->
          _menhir_run_28_spec_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState58 ->
          _menhir_run_28_spec_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState56 ->
          _menhir_run_28_spec_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState16 ->
          _menhir_run_28_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_28_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_28_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState50 ->
          _menhir_run_28_spec_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState48 ->
          _menhir_run_28_spec_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState46 ->
          _menhir_run_28_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState44 ->
          _menhir_run_28_spec_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState42 ->
          _menhir_run_28_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState40 ->
          _menhir_run_28_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState38 ->
          _menhir_run_28_spec_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState36 ->
          _menhir_run_28_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState32 ->
          _menhir_run_28_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState30 ->
          _menhir_run_28_spec_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState27 ->
          _menhir_run_28_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState21 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_28_spec_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
  
  and _menhir_run_28_spec_01 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_VARIANT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
  
  and _menhir_run_28_spec_78 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_VARIANT, _menhir_box_main) _menhir_cell1_pattern_ident -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState78 _tok
  
  and _menhir_run_28_spec_73 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_VARIANT, _menhir_box_main) _menhir_cell1_pattern_ident -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState73 _tok
  
  and _menhir_run_28_spec_63 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState63 _tok
  
  and _menhir_run_28_spec_58 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState58 _tok
  
  and _menhir_run_28_spec_56 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState56 _tok
  
  and _menhir_run_28_spec_16 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16 _tok
  
  and _menhir_run_28_spec_17 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_HEAD -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
  
  and _menhir_run_28_spec_20 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20 _tok
  
  and _menhir_run_28_spec_50 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CREATE, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState50 _tok
  
  and _menhir_run_28_spec_48 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48 _tok
  
  and _menhir_run_28_spec_46 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46 _tok
  
  and _menhir_run_28_spec_44 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState44 _tok
  
  and _menhir_run_28_spec_42 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42 _tok
  
  and _menhir_run_28_spec_40 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40 _tok
  
  and _menhir_run_28_spec_38 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38 _tok
  
  and _menhir_run_28_spec_36 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36 _tok
  
  and _menhir_run_28_spec_32 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32 _tok
  
  and _menhir_run_28_spec_27 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CREATE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_01 _1 in
      _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27 _tok
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_FST -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FST (_menhir_stack, _menhir_s) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_15 _2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState16
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState16
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_HEAD (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _menhir_stack = MenhirCell1_ident_decl (_menhir_stack, MenhirState18, _v) in
          (match (_tok : MenhirBasics.token) with
          | GOESTO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VARIANT _v_0 ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState20
              | TAIL ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | STRING _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_1 in
                  let _v = _menhir_action_36 _1 in
                  _menhir_run_28_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | SND ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | PRINT ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | NOT ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | MATCH ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | LPAREN ->
                  _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | LET ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | LBRACKET ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | INT _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_3 in
                  let _v = _menhir_action_34 _1 in
                  _menhir_run_28_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IF ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | IDENT _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v_6 =
                    let _1 = _v_5 in
                    _menhir_action_25 _1
                  in
                  let _v_7 =
                    let _1 = _v_6 in
                    _menhir_action_26 _1
                  in
                  let _1 = _v_7 in
                  let _v = _menhir_action_37 _1 in
                  _menhir_run_28_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | HEAD ->
                  _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | FUNCTION ->
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | FST ->
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | CREATE ->
                  _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
              | BOOL _v_9 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _1 = _v_9 in
                  let _v = _menhir_action_35 _1 in
                  _menhir_run_28_spec_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FST (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CREATE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState27
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | STRING _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | INT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | IDENT _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v =
                let _1 = _v in
                _menhir_action_25 _1
              in
              let _v =
                let _1 = _v in
                _menhir_action_26 _1
              in
              let _1 = _v in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState27
          | BOOL _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState36
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState36
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_38 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState38
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState38
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_38 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState40
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState42
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState42
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState44
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_44 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState32
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState32
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_48 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState48
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_48 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState46
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_90 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_VARIANT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_VARIANT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_17 _1 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_89 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_TAIL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_TAIL (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_21 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_86 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_38 _2 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_85 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PRINT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_24 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_84 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_NOT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_08 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_79 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_VARIANT, _menhir_box_main) _menhir_cell1_pattern_ident as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | THEN | WITH ->
          let MenhirCell1_pattern_ident (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell0_VARIANT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_PIPE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_29 _2 _3 _5 in
          _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_pattern : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState66 ->
          _menhir_run_83_spec_66 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState81 ->
          _menhir_run_82 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_83_spec_66 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_MATCH, _menhir_box_main) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_32 _1 in
      _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66 _tok
  
  and _menhir_run_80 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_MATCH, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_pattern_list (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v ->
              _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState81
          | PIPE ->
              _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState81
          | _ ->
              _eRR ())
      | AND | COMMA | CONS | ELSE | EOEX | EQUAL | IN | MINUS | OR | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_MATCH (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_18 _2 _4 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_67 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_VARIANT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState67
      | IDENT _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v_1 =
            let _1 = _v_0 in
            _menhir_action_25 _1
          in
          let _1 = _v_1 in
          let _v = _menhir_action_30 _1 in
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState67 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_68 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState68
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _1 = _v in
          let _v = _menhir_action_30 _1 in
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_69 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_31 _2 in
          _menhir_goto_pattern_ident _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_pattern_ident : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState76 ->
          _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState67 ->
          _menhir_run_72 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState68 ->
          _menhir_run_69 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_77 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PIPE _menhir_cell0_VARIANT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_pattern_ident (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | GOESTO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState78
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | INT _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | IDENT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_25 _1
              in
              let _v_7 =
                let _1 = _v_6 in
                _menhir_action_26 _1
              in
              let _1 = _v_7 in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState78
          | BOOL _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_9 in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_78 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_72 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_VARIANT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_pattern_ident (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | GOESTO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState73
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_73 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | INT _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_73 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | IDENT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_25 _1
              in
              let _v_7 =
                let _1 = _v_6 in
                _menhir_action_26 _1
              in
              let _1 = _v_7 in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_73 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
          | BOOL _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_9 in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_73 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_75 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PIPE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          let _menhir_stack = MenhirCell0_VARIANT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              _menhir_run_68 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState76
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_1 =
                let _1 = _v_0 in
                _menhir_action_25 _1
              in
              let _1 = _v_1 in
              let _v = _menhir_action_30 _1 in
              _menhir_run_77 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState76 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_82 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_MATCH, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_pattern_list -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pattern_list (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_33 _1 _3 in
      _menhir_run_80 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_74 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_VARIANT, _menhir_box_main) _menhir_cell1_pattern_ident as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | THEN | WITH ->
          let MenhirCell1_pattern_ident (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_VARIANT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_28 _1 _2 _4 in
          _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_65 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v ->
              _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState66
          | PIPE ->
              _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState66
          | _ ->
              _eRR ())
      | SENDTO ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_64 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_13 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_62 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_LET, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState63
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | INT _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | IDENT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_25 _1
              in
              let _v_7 =
                let _1 = _v_6 in
                _menhir_action_26 _1
              in
              let _1 = _v_7 in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState63
          | BOOL _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_9 in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_63 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | EQUAL ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_60 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LBRACKET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACKET (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_40 _2 in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_59 : type  ttv_stack. ((((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | SEMICOLON | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_11 _2 _4 _6 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_57 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState58
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | INT _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | IDENT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_25 _1
              in
              let _v_7 =
                let _1 = _v_6 in
                _menhir_action_26 _1
              in
              let _1 = _v_7 in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState58
          | BOOL _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_9 in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_58 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | CONS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_55 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState56
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | INT _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | IDENT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_25 _1
              in
              let _v_7 =
                let _1 = _v_6 in
                _menhir_action_26 _1
              in
              let _1 = _v_7 in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState56
          | BOOL _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_9 in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_56 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | SENDTO ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_54 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_HEAD as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_HEAD (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_20 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_53 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_FUNCTION, _menhir_box_main) _menhir_cell1_ident_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | THEN | WITH ->
          let MenhirCell1_ident_decl (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_FUNCTION (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_10 _2 _4 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_51 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_CREATE, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_expr (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_CREATE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_22 _3 _5 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | SEMICOLON | SENDTO ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_14 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_49 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_14 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_47 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | ELSE | EOEX | IN | OR | PIPE | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_06 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | OR | PIPE | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_09 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_43 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_05 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_41 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_07 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_04 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_48 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOEX | IN | PIPE | RBRACKET | RPAREN | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_12 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_19 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | CONS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | ELSE | EOEX | EQUAL | IN | MINUS | OR | PIPE | PLUS | RBRACKET | RPAREN | SEMICOLON | SENDTO | THEN | WITH ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_23 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CREATE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SENDTO ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_38 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONS ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VARIANT _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState50
          | TAIL ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | STRING _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_1 in
              let _v = _menhir_action_36 _1 in
              _menhir_run_28_spec_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | SND ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | PRINT ->
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | NOT ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | MATCH ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | LPAREN ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | LET ->
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | LBRACKET ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | INT _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_3 in
              let _v = _menhir_action_34 _1 in
              _menhir_run_28_spec_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IF ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | IDENT _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v_6 =
                let _1 = _v_5 in
                _menhir_action_25 _1
              in
              let _v_7 =
                let _1 = _v_6 in
                _menhir_action_26 _1
              in
              let _1 = _v_7 in
              let _v = _menhir_action_37 _1 in
              _menhir_run_28_spec_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | HEAD ->
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | FUNCTION ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | FST ->
              _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | CREATE ->
              _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
          | BOOL _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _1 = _v_9 in
              let _v = _menhir_action_35 _1 in
              _menhir_run_28_spec_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | AND ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VARIANT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | TAIL ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | STRING _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_36 _1 in
          _menhir_run_28_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | SND ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | PRINT ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | NOT ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | MATCH ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LPAREN ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LBRACKET ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_34 _1 in
          _menhir_run_28_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v =
            let _1 = _v in
            _menhir_action_25 _1
          in
          let _v =
            let _1 = _v in
            _menhir_action_26 _1
          in
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_run_28_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | HEAD ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | FUNCTION ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | FST ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | CREATE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | BOOL _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _1 = _v in
          let _v = _menhir_action_35 _1 in
          _menhir_run_28_spec_00 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 187 "AFbV/afbvparser.mly"
  

# 3928 "AFbV/afbvparser.ml"
