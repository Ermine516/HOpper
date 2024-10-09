% BEST PROG 2166:
% g_p_a(A,B):-children(B,A).
% g_p_a(A,B):-head(A,B).
% g_p_a(A,B):-tail(A,C),g_a(C,B).
% f(A,B):-children(A,C),g_p_a(C,B).
% Precision:1.00, Recall:1.00, TP:7, FN:0, TN:2, FP:0
% real	2m4,393s
% user	2m24,888s
% sys	0m1,784s


max_vars(4).
max_clauses(4).
max_body(2).

enable_recursion.
enable_ho_recursion.

head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(root,2).
body_pred(children,2).
body_pred(empty,1).


direction(f,(in,in)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).

direction(root,(in,out)).
direction(children,(in,out)).

type(f,(tree,tree)).

type(head,(list,tree)).
type(tail,(list,list)).
type(empty,(list,)).

type(root,(tree,element)).
type(children,(tree,list)).

direction(g_a,(in,in)).
direction(g_p_a,(in,in)).

type(g_a,(list,tree)).
type(g_p_a,(list,tree)).


% c0(C):-head_literal(C,f,2,(0,1)), 
%	body_literal(C,eqs,2,(0,1)).
%     :- not c0(0).
% c1(C):-head_literal(C,f,2,(0,1)), 
%	body_literal(C,children,2,(0,2)), 
%	body_literal(C,g_a,2,(2,1)).
%     :- not c1(1).
% c2(C):-head_literal(C,g_p_a,2,(0,1)),
%	body_literal(C,head,2,(0,2)), 
%	body_literal(C,f,2,(2,1)).
%     :- not c2(2).
% c3(C):-head_literal(C,g_p_a,2,(0,1)),
%	body_literal(C,tail,2,(0,2)),
%	body_literal(C,g_p_a,2,(2,1)).
%     :- not c3(3).

