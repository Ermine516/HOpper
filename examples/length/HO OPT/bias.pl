% BEST PROG 24:
%fold_p_a(A,B,C):-suc(A,C).
%f(A,B):-zero(C),fold_a(C,A,B).
% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:3, FP:0
%real	0m0,298s
%user	0m0,568s
%sys	0m0,026s

max_vars(3). 
max_body(2). 
max_clauses(2). 
non_datalog.
allow_singletons.

head_pred(f,2).
body_pred(suc,2).
body_pred(zero,1).

type(f,(list,integer)).

type(suc,(integer,integer)).
type(zero,(integer,)).

direction(f,(in,out)).
direction(suc,(in,out)).
direction(zero,(out,)).

direction(fold_a,(in,in,out)).
direction(fold_p_a,(in,in,out)).
type(fold_a,(integer,list,integer)).
type(fold_p_a,(integer,element,integer)).

