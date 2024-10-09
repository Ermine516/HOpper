% BEST PROG 3262: Optimal Case
%caselist_r_a(A,B,C):-front(B,E),caselist_a(E,D),app(D,A,C).
%caselist_p_a(A):-empty(A).
%f(A,B):-reverse(A,C),caselist_a(C,B).
%caselist_q_a(A,B):-any(A),empty(B).
% Precision:1.00, Recall:1.00, TP:8, FN:0, TN:6, FP:0
%real	2m21,905s
%user	3m57,851s
%sys	0m2,475s

max_vars(6). 
max_body(5).
max_clauses(4).

enable_recursion.

head_pred(f,2).
body_pred(empty,1).
body_pred(front,2).
body_pred(reverse,2).
body_pred(app,3).
body_pred(any,1).
body_pred(last,2).

direction(f,(in,out)).
direction(any,(in,)).
direction(empty,(out,)).
direction(front,(in,out)).
direction(reverse,(in,out)).
direction(last,(in,out)).
direction(app,(in,in,out)).
direction(caselist_a,(in,out)).
direction(caselist_p_a,(out,)).
direction(caselist_r_a,(in,in,out)).
direction(caselist_q_a,(in,out)).

type(f,(list,list)).
type(empty,(list,)).
type(any,(element,)).
type(front,(list,list)).
type(last,(list,element)).
type(reverse,(list,list)).
type(app,(list,element,list)).
type(caselist_a,(list,list)).
type(caselist_p_a,(list,)).
type(caselist_q_a,(element,list)).
type(caselist_r_a,(element,list,list)).

