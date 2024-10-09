

max_vars(5).
max_body(5).
max_clauses(2).
enable_recursion.

head_pred(f,1).
body_pred(head,2).
body_pred(tail,2).
body_pred(suc,2).
body_pred(pred,2).
body_pred(geq,2).
body_pred(empty,1).
body_pred(zero,1).

type(f,(list,)).
type(head,(list,integer)).
type(tail,(list,list)).
type(suc,(integer,integer)).
type(pred,(integer,integer)).
type(geq,(integer,integer)).
type(empty,(list,)).
type(zero,(integer,)).

direction(f,(in,)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(geq,(in,in)).
direction(empty,(in,)).
direction(zero,(out,)).
