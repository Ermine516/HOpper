% BEST PROG 1597:
%f(A):-empty(A).
%try_q_a(A):-zero(B),suc(B,C),suc(C,A).
%f(A):-cons(A,C,B),try_a(C),f(B).
%try_p_a(A):-zero(B),suc(B,A).
% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:6, FP:0
%real	1m21,218s
%user	1m34,764s
%sys	0m1,191s


max_vars(5).
max_clauses(4).
max_body(5).
enable_recursion.

head_pred(f,1).
body_pred(suc,2).
body_pred(zero,1).
body_pred(cons,3).
body_pred(empty,1).


direction(f,(in,)).
direction(suc,(in,out)).
direction(zero,(out,)).
direction(cons,(in,out,out)).
direction(empty,(out,)).

type(f,(list,)).
type(suc,(integer,integer)).
type(zero,(integer,)).
type(cons,(list,integer,list)).
type(empty,(list,)).

direction(try_a,(in,)).
direction(try_p_a,(in,)).
direction(try_q_a,(in,)).

type(try_a,(integer,)).
type(try_p_a,(integer,)).
type(try_q_a,(integer,)).



