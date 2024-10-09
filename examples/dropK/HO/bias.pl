% BEST PROG 2:
%f(A,B,C):-ite_a(B,A,C).
%ite_p_a(A,B):-tail(A,B).
% Precision:1.00, Recall:1.00, TP:3, FN:0, TN:2, FP:0
%real	0m0,139s
%user	0m0,129s
%sys	0m0,017s

%  Parameters
max_vars(5).
max_body(3).
max_clauses(2).
enable_recursion. 

%Head predicates
head_pred(f,3).

%Body predicates
body_pred(zero,1).
body_pred(tail,2).
body_pred(head,2).
body_pred(eq,2).

%types
type(f,(integer,list,list)).
type(pred,(integer,integer)).
type(zero,(integer,)).
type(tail,(list,list)).
type(eq,(list,list)).
%directions 
direction(pred,(in,out)).
direction(zero,(out,)).
direction(f,(in,in,out)).
direction(tail,(in,out)).
direction(eq,(in,out)).

%Higher-order directions
direction(ite_a,(in,in,out)).
direction(ite_p_a,(in,out)).

%Higher-order types
type(ite_a,(list,integer,list)).
type(ite_p_a,(list,list)).



