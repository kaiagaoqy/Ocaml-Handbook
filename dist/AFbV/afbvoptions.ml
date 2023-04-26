let show_messages = ref false;;
let show_states = ref false;;
let deterministic_delivery = ref false;;

let options =
  [
    ("--show-messages",
     Arg.Set(show_messages),
     "Show messages as they are sent"
    );
    ("--show-states",
     Arg.Set(show_states),
     "Show global system states"
    );
    ("--deterministic",
     Arg.Set(deterministic_delivery),
     "Deliver messages in a deterministic order"
    );
  ]
;;
