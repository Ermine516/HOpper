

max_vars(4).
max_body(3).
max_clauses(2).
enable_recursion.

head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(suc,2).
body_pred(empty,1).
body_pred(zero,1).

type(f,(list,integer)).
type(head,(list,element)).
type(tail,(list,list)).
type(suc,(integer,integer)).
type(empty,(list,)).
type(zero,(integer,)).

direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(suc,(in,out)).
direction(empty,(in,)).
direction(zero,(out,)).
