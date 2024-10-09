

max_vars(3).
max_body(2).
max_clauses(2).
enable_recursion.

head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).

type(f,(list,element)).
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).

direction(f,(in,in)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(in,)).
