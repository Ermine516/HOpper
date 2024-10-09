% BEST PROG 526:
%f(A,B,C):-ite_a(B,A,C).
%ite_p_a(A,B):-tail(A,C),head(A,D),app(C,D,B).
% Precision:1.00, Recall:1.00, TP:6, FN:0, TN:2, FP:0
%real	0m2,919s
%user	0m4,727s
%sys	0m0,237s

max_vars(4).
max_clauses(2).
max_body(3).

head_pred(f, 3).
body_pred(pred, 2).
body_pred(eq, 2).
body_pred(zero, 1).
body_pred(head, 2).
body_pred(tail, 2).
body_pred(app, 3).
body_pred(empty, 1).

type(f,(integer,list,list)).
type(pred,(integer,integer)).
type(eq,(list,list)).
type(zero,(integer,)).
type(head,(list,integer)).
type(tail,(list,list)).
type(app,(list,integer,list)).
type(empty,(list,)).

direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(eq,(out,out)).
direction(zero,(out,)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(app,(in,in,out)).
direction(empty,(out,)).

direction(ite_a,(in,in,out)).
type(ite_a,(list,integer,list)).
direction(ite_p_a,(in,out)).
type(ite_p_a,(list,list)).

