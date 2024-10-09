

max_vars(5).
max_body(5).
max_clauses(2).
enable_recursion.

head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(app,3).
body_pred(empty,1).

type(f,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(app,(list,element,list)).
type(empty,(list,)).

direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(app,(in,in,out)).
direction(empty,(out,)).



