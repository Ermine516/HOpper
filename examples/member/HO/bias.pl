% BEST PROG 13:
%any_p_a(A,B):-head(A,B).
%f(A,B):-any_a(A,B).
% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:3, FP:0
%real	0m0,263s
%user	0m0,255s
%sys	0m0,026s

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
type(any_a,(list,element)).
type(any_p_a,(list,element)).

direction(f,(in,in)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(in,)).
direction(any_a,(in,in)).
direction(any_p_a,(in,in)).

