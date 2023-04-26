(*
PoPL Assignment 7
Your Name : Qingying Gao
*)

(* show_messages := true;; *)
(* show_states := true;; *)
(* deterministic_delivery := true;; *)

(* a7c. ... 
The producer's and consumer's recursive behaviors make their code identical all the time, 
So I will use "producer behavior" and "consumer behavior" to represent their behaviors in the global state sequence

Due to the nondeterministic order "a <- `wait(stock); me<-`produce(0);",
there might be some loops of wait and produce messages if the produce message is not sent to the producer

Assume the original stock of producer is one, and consumer only asks for 2 products.
The number sent in parenthsis is the current stock of producer

Delivering to @2 the message `purchase 0
Delivering to @1 the message `consume (<Actor @2/>)
Delivering to @2 the message `delivered 1
Delivering to @1 the message `consume (<Actor @2/>)
Delivering to @2 the message `wait 0
Delivering to @1 the message `consume (<Actor @2/>)
Delivering to @1 the message `produce 0
Delivering to @2 the message `wait 0
Delivering to @1 the message `produce 0
Delivering to @1 the message `consume (<Actor @2/>)
Delivering to @2 the message `delivered 2
It worked!

    G0: Add [consumer <- 0] to soup
        [consumer <- 0], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [consumer <- 0]

    G1: Remove [consumer <- 0] from soup to process relative behavior, then add [producer <- `consume (<Actor @2/>)] to soup
        [producer <- `consume (<Actor @2/>)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [producer <- `consume (<Actor @2/>)]

    G2: Now the stock is 1, so send `delivered to consumer, and add the message to soup
        [consumer <- `delivered(1)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [consumer <- `delivered(1)]

    G3: The consumer asks for the second consumption
        [producer <- `consume (<Actor @2/>)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [producer <- `consume (<Actor @2/>)]

loops of wait and produce messages start here:
    G4: Assume `wait message arrives condumer first, although now have two possible messages to send [consumer <- `wait(0)], [producer <- `produce(0)]
        [consumer <- `wait(0)], [producer <- `produce(0)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [consumer <- `wait(0)]

    G5: Remove [consumer <- `wait(0)] because it is processed first, then let consumer sends `consume back to producer 
        [producer <- `consume (<Actor @2/>)], [producer <- `produce(0)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [producer <- `consume (<Actor @2/>)]

    G6: Remove [producer <- `consume (<Actor @2/>)] from soup and add two other messages, wait and produce, to soup
        Assume `produce arrives first this time. Let the code for next run become 'producer (stock + 1)', , now stock becomes 1
        [producer <- `produce(0)], [consumer <- `wait(0)], [producer <- `produce(0)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [producer <- `produce(0)]

    G7: Assume we process [consumer <- `wait(0)] first
        [consumer <- `wait(0)], [producer <- `produce(0)], <consumer, consumer behavior> <producer,producer behavior>
        Delivered msg: [consumer <- `wait(0)]

    G8:  Remove [consumer <- `wait(0)] and let consumer add `consume to soup, then assume we process [producer <- `produce(0)], now stock becomes 2
        [producer <- `produce(0)],<consumer, consumer behavior> <producer,producer behavior>
         Delivered msg: [producer <- `produce(0)]

    G9:  Process the message [producer <- `consume (<Actor @2/>)]. Now the stock is 2, so add the `delivered message to soup
         [producer <- `consume (<Actor @2/>)], <consumer, consumer behavior> <producer,producer behavior>
         Delivered msg: [producer <- `consume (<Actor @2/>)]

    G10: Send `delivered to consumer
         [producer <- `delivered(1)], <consumer, consumer behavior> <producer,producer behavior>
         Delivered msg: [producer <- `delivered(1)]

producer behavior: Fun msg ->
                   Match msg With
                   | `produce _ ->
                     (Fun m ->
                        (Fun producer ->
                           Fun stock ->
                             Fun msg ->
                               Match msg With
                               | `produce _ ->
                                 producer (stock + 1)
                               | `consume a ->
                                 If stock = 0 Then
                                   a <- `wait stock;
                                   (<Actor @1/>) <- `produce 0; producer stock
                                 Else
                                   a <- `delivered stock; producer (stock - 1)) ((
                      Fun s ->
                        Fun m ->
                          (Fun producer ->
                             Fun stock ->
                               Fun msg ->
                                 Match msg With
                                 | `produce _ ->
                                   producer (stock + 1)
                                 | `consume a ->
                                   If stock = 0 Then
                                     a <- `wait stock;
                                     (<Actor @1/>) <- `produce 0;
                                     producer stock
                                   Else
                                     a <- `delivered stock;
                                     producer (stock - 1)) (s s) m) (
                      Fun s ->
                        Fun m ->
                          (Fun producer ->
                             Fun stock ->
                               Fun msg ->
                                 Match msg With
                                 | `produce _ ->
                                   producer (stock + 1)
                                 | `consume a ->
                                   If stock = 0 Then
                                     a <- `wait stock;
                                     (<Actor @1/>) <- `produce 0;
                                     producer stock
                                   Else
                                     a <- `delivered stock;
                                     producer (stock - 1)) (s s) m)) m) (1 + 1)
                   | `consume a ->
                     If 1 = 0 Then
                       a <- `wait 1;
                       (<Actor @1/>) <- `produce 0;
                       (Fun m ->
                          (Fun producer ->
                             Fun stock ->
                               Fun msg ->
                                 Match msg With
                                 | `produce _ ->
                                   producer (stock + 1)
                                 | `consume a ->
                                   If stock = 0 Then
                                     a <- `wait stock;
                                     (<Actor @1/>) <- `produce 0;
                                     producer stock
                                   Else
                                     a <- `delivered stock;
                                     producer (stock - 1)) ((Fun s ->
                                                               Fun m ->
                                                                 (Fun producer ->
                                                                    Fun stock ->
                                                                    Fun msg ->
                                                                    Match msg With
                                                                    | `produce _ ->
                                                                    producer (stock + 1)
                                                                    | `consume a ->
                                                                    If stock = 0 Then
                                                                    a <- `wait stock;
                                                                    (<Actor @1/>) <- `produce 0;
                                                                    producer stock
                                                                    Else
                                                                    a <- `delivered stock;
                                                                    producer (stock - 1)) (s s) m) (
                        Fun s ->
                          Fun m ->
                            (Fun producer ->
                               Fun stock ->
                                 Fun msg ->
                                   Match msg With
                                   | `produce _ ->
                                     producer (stock + 1)
                                   | `consume a ->
                                     If stock = 0 Then
                                       a <- `wait stock;
                                       (<Actor @1/>) <- `produce 0;
                                       producer stock
                                     Else
                                       a <- `delivered stock;
                                       producer (stock - 1)) (s s) m)) m) 1
                     Else
                       a <- `delivered 1;
                       (Fun m ->
                          (Fun producer ->
                             Fun stock ->
                               Fun msg ->
                                 Match msg With
                                 | `produce _ ->
                                   producer (stock + 1)
                                 | `consume a ->
                                   If stock = 0 Then
                                     a <- `wait stock;
                                     (<Actor @1/>) <- `produce 0;
                                     producer stock
                                   Else
                                     a <- `delivered stock;
                                     producer (stock - 1)) ((Fun s ->
                                                               Fun m ->
                                                                 (Fun producer ->
                                                                    Fun stock ->
                                                                    Fun msg ->
                                                                    Match msg With
                                                                    | `produce _ ->
                                                                    producer (stock + 1)
                                                                    | `consume a ->
                                                                    If stock = 0 Then
                                                                    a <- `wait stock;
                                                                    (<Actor @1/>) <- `produce 0;
                                                                    producer stock
                                                                    Else
                                                                    a <- `delivered stock;
                                                                    producer (stock - 1)) (s s) m) (
                        Fun s ->
                          Fun m ->
                            (Fun producer ->
                               Fun stock ->
                                 Fun msg ->
                                   Match msg With
                                   | `produce _ ->
                                     producer (stock + 1)
                                   | `consume a ->
                                     If stock = 0 Then
                                       a <- `wait stock;
                                       (<Actor @1/>) <- `produce 0;
                                       producer stock
                                     Else
                                       a <- `delivered stock;
                                       producer (stock - 1)) (s s) m)) m) (1 - 1)
consumer behavior: Fun msg ->
  Match msg With
  | `purchase _ ->
    (<Actor @1/>) <- `consume (<Actor @2/>);
    (Fun m ->
       (Fun this ->
          Fun s ->
            Fun msg ->
              Match msg With
              | `purchase _ ->
                (<Actor @1/>) <- `consume (<Actor @2/>); this s
              | `wait _ ->
                (<Actor @1/>) <- `consume (<Actor @2/>); this s
              | `delivered n ->
                If s - 1 = 0 Then
                  Print "It worked!"; 0
                Else
                  (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) ((
     Fun s ->
       Fun m ->
         (Fun this ->
            Fun s ->
              Fun msg ->
                Match msg With
                | `purchase _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `wait _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `delivered n ->
                  If s - 1 = 0 Then
                    Print "It worked!"; 0
                  Else
                    (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) (s s) m) (
     Fun s ->
       Fun m ->
         (Fun this ->
            Fun s ->
              Fun msg ->
                Match msg With
                | `purchase _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `wait _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `delivered n ->
                  If s - 1 = 0 Then
                    Print "It worked!"; 0
                  Else
                    (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) (s s) m)) m) 1
  | `wait _ ->
    (<Actor @1/>) <- `consume (<Actor @2/>);
    (Fun m ->
       (Fun this ->
          Fun s ->
            Fun msg ->
              Match msg With
              | `purchase _ ->
                (<Actor @1/>) <- `consume (<Actor @2/>); this s
              | `wait _ ->
                (<Actor @1/>) <- `consume (<Actor @2/>); this s
              | `delivered n ->
                If s - 1 = 0 Then
                  Print "It worked!"; 0
                Else
                  (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) ((
     Fun s ->
       Fun m ->
         (Fun this ->
            Fun s ->
              Fun msg ->
                Match msg With
                | `purchase _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `wait _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `delivered n ->
                  If s - 1 = 0 Then
                    Print "It worked!"; 0
                  Else
                    (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) (s s) m) (
     Fun s ->
       Fun m ->
         (Fun this ->
            Fun s ->
              Fun msg ->
                Match msg With
                | `purchase _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `wait _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `delivered n ->
                  If s - 1 = 0 Then
                    Print "It worked!"; 0
                  Else
                    (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) (s s) m)) m) 1
  | `delivered n ->
    If 1 - 1 = 0 Then
      Print "It worked!"; 0
    Else
      (<Actor @1/>) <- `consume (<Actor @2/>);
      (Fun m ->
         (Fun this ->
            Fun s ->
              Fun msg ->
                Match msg With
                | `purchase _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `wait _ ->
                  (<Actor @1/>) <- `consume (<Actor @2/>); this s
                | `delivered n ->
                  If s - 1 = 0 Then
                    Print "It worked!"; 0
                  Else
                    (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) ((
       Fun s ->
         Fun m ->
           (Fun this ->
              Fun s ->
                Fun msg ->
                  Match msg With
                  | `purchase _ ->
                    (<Actor @1/>) <- `consume (<Actor @2/>); this s
                  | `wait _ ->
                    (<Actor @1/>) <- `consume (<Actor @2/>); this s
                  | `delivered n ->
                    If s - 1 = 0 Then
                      Print "It worked!"; 0
                    Else
                      (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) (s s) m) (
       Fun s ->
         Fun m ->
           (Fun this ->
              Fun s ->
                Fun msg ->
                  Match msg With
                  | `purchase _ ->
                    (<Actor @1/>) <- `consume (<Actor @2/>); this s
                  | `wait _ ->
                    (<Actor @1/>) <- `consume (<Actor @2/>); this s
                  | `delivered n ->
                    If s - 1 = 0 Then
                      Print "It worked!"; 0
                    Else
                      (<Actor @1/>) <- `consume (<Actor @2/>); this (s - 1)) (s s) m)) m) (1 - 1)
    ... *)







(* a. ------------*)

let producer_behavior = "
Let y = (Fun b -> Let w = Fun s -> Fun m -> b (s s) m In w w) In
Fun me -> y (
Fun producer -> Fun stock -> Fun msg ->
  Match msg With
    |`produce(_) -> producer (stock+1)
    |`consume(a) -> If stock = 0 Then (a <- (`wait(stock)); me<-`produce(stock); producer stock)
                    Else ( a <- (`delivered(stock)); producer (stock-1))
)
";;

let fixed_producer_tester = "
Let yy = (Fun b -> Let w = Fun s -> Fun m -> b (s s) m In w w) In
Let producer_behavior = ("^producer_behavior^") In
                     Let producer = Create(producer_behavior, 1) In
                     Let consumer_behavior = Fun me -> 
                        yy (Fun this -> Fun s -> Fun msg -> 
                             Match msg With 
                              |`purchase(_) -> (producer <- `consume(me); (this s))
                              |`wait(_) -> (producer <- `consume(me); (this s))
                              |`delivered(n) -> If s-1 = 0 Then (Print \"It worked!\"; 0) Else (producer <- `consume(me); (this (s-1))) 
                                          )
                     In
                     Let consumer = Create(consumer_behavior, 2) In
                     consumer <- `purchase(0)
                     "
                  ;;

    
let consumer_behavior = "
Let y = (Fun b -> Let w = Fun s -> Fun m -> b (s s) m In w w) In
Fun me -> y (
Fun consumer -> Fun state -> Fun msg ->
      Match msg With
        |`purchase(_) -> (Let producer = Fst(state) In producer <- `consume(me);(consumer state ))
        |`wait(_) ->  (Let producer = Fst(state) In producer <- `consume(me);(consumer state ))
        |`delivered(_) -> If Snd(state)-1=0 Then 0 Else 
        (Fst(state) <- `consume(me);(consumer (Fst(state),Snd(state)-1) ))
)
";;

let pc_tester = "
    Let producer_behavior = ("^producer_behavior^") In
    Let consumer_behavior = ("^consumer_behavior^") In
    Let producer = Create(producer_behavior, 0) In
    Let user = Create(consumer_behavior, (producer, 1)) In
    Let user2 = Create(consumer_behavior, (producer, 2)) In
    user <- `purchase(00);
    user2 <- `purchase(00) 
    ";;