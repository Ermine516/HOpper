% BEST PROG 156: With Starter type 
%ite_p_a(A,B,C):-ite_a(A,C,B).
%f(A,B,C):-zero(D),ite_a(D,A,C,B).
%ite_p_a(A,B):-suc(A,B).
% Precision:1.00, Recall:1.00, TP:10, FN:0, TN:6, FP:0
%real	0m7,460s
%user	0m8,553s
%sys	0m0,221s


max_vars(6).
max_clauses(5).
max_body(4).
allow_singletons.
non_datalog.

head_pred(f, 3).
body_pred(suc, 2).
body_pred(zero, 1).
body_pred(pred, 2).
body_pred(eq, 2).
body_pred(less0, 1).


direction(f,(in,in,out)).
direction(suc,(in,out)).
direction(zero,(out,)).
direction(pred,(in,out)).
direction(eq,(in,out)).
direction(less0,(in,)).

type(f,(integer,integer,integer)).
type(zero,(starter,)).
type(suc,(integer,integer)).
type(pred,(integer,integer)).
type(eq,(integer,integer)).
type(less0,(integer,)).

direction(ite_a,(in,in,out)).
direction(ite_a,(in,in,out,out)). 
direction(ite_p_a,(in,out)).
direction(ite_p_a,(in,out,in)).

type(ite_a,(integer,integer,integer)).
type(ite_a,(starter,integer,integer,integer)).
type(ite_p_a,(integer,integer)).
type(ite_p_a,(integer,integer,integer)).




