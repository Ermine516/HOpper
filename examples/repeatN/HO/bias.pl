% BEST PROG 8:
%f(A,B,C):-empty(D),ite_a(D,B,C,A).
%ite_p_a(A,B,C):-app(A,C,B).
% Precision:1.00, Recall:1.00, TP:5, FN:0, TN:1, FP:0
%real	0m0,204s
%user	0m0,238s
%sys	0m0,023s

max_vars(5).
max_clauses(2).
max_body(3).
enable_recursion.
non_datalog.
allow_singletons.

head_pred(f, 3).
body_pred(pred, 2).
body_pred(zero, 1).
body_pred(app, 3).
body_pred(empty, 1).

type(f,(list,integer,list)).
type(pred,(integer,integer)).
type(empty,(list,)).
type(app,(list,list,list)).
type(zero,(integer,)).


direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(empty,(out,)).
direction(app,(in,in,out)).
direction(zero,(out,)).

type(ite_a,(list,integer,list)).
type(ite_a,(list,integer,list,list)).
type(ite_p_a,(list,list)).
type(ite_p_a,(list,list,list)).

direction(ite_a,(in,in,out)).
direction(ite_a,(in,in,out,in)).
direction(ite_p_a,(in,out)).
direction(ite_p_a,(in,out,in)).


