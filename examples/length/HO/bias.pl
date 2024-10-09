% BEST PROG 24:
%fold_p_a(A,B,C):-suc(A,C).
%f(A,B):-zero(C),fold_a(C,A,B).
% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:3, FP:0
%real	0m0,298s
%user	0m0,568s
%sys	0m0,026s

max_vars(4).
max_body(3).
max_clauses(2).
enable_recursion.
non_datalog.
allow_singletons.

head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(suc,2).
body_pred(empty,1).
body_pred(zero,1).

type(f,(list,integer)).

type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).

type(suc,(integer,integer)).
type(zero,(integer,)).

direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(in,)).
direction(suc,(in,out)).
direction(zero,(out,)).

direction(fold_a,(in,in,out)).
direction(fold_p_a,(in,in,out)).
type(fold_a,(integer,list,integer)).
type(fold_p_a,(integer,element,integer)).

