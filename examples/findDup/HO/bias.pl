% BEST PROG 82:
%caselist_q_a(A,B,C):-caselist_a(B,C).
%caselist_q_a(A,B,C):-member(C,B),eq(C,A).
%caselist_p_a(A):-e(B),member(A,B).
%f(A,B):-caselist_a(A,B).
% Precision:1.00, Recall:1.00, TP:2, FN:0, TN:2, FP:0

%real	0m0,495s
%user	0m0,658s
%sys	0m0,053s

%parameters
max_vars(4).
max_body(4).
max_clauses(4).

% switches enabled 
enable_recursion.
non_datalog.
allow_singletons.

%Head predicates
head_pred(f,2).

%Body predicates
body_pred(empty,1).
body_pred(head,2).
body_pred(tail,2).
body_pred(eq, 2).
body_pred(member,2).

%types
type(f,(list,element)).
type(empty,(list,)).
type(member,(element,list)).
type(eq, (element, element)).
type(head,(list,element)).
type(tail,(list,list)).

%directions 
direction(f,(in,out)).
direction(empty,(out,)).
direction(member,(out,in)).
direction(eq, (in, out)).
direction(head,(in,out)).
direction(tail,(in,out)).

%Higher-order directions
direction(caselist_a,(in,out)).
direction(caselist_q_a,(in,in,out)).
direction(caselist_p_a,(out,)).

%Higher-order types
type(caselist_a,(list,element)).
type(caselist_p_a,(element,)).
type(caselist_q_a,(element,list,element)).










