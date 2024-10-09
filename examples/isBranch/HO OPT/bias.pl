% BEST PROG 3142:
%casetree_p_a(A,B):-tail(B,C),empty(C),head(B,A).
%any_p_a(A,B):-tail(B,C),casetree_a(A,C).
%casetree_q_a(A,B,C):-head(C,A),any_a(B,C).
%f(A,B):-casetree_a(A,B).
% Precision:1.00, Recall:1.00, TP:42, FN:0, TN:5, FP:0
%real	1m7,686s
%user	1m44,103s
%sys	0m3,162s

%parameters
max_vars(4).
max_clauses(4).
max_body(3).

% switches enabled 
enable_recursion.

%Head predicates
head_pred(f,2).

%Body predicates
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).

%directions 
direction(f,(in,in)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).

%types
type(f,(tree,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).

%Higher-order directions
direction(any_a,(in,in)).
direction(any_p_a,(in,in)).
direction(casetree_a,(in,in)).
direction(casetree_p_a,(in,in)).
direction(casetree_q_a,(in,in,in)).

%Higher-order types
type(any_a,(list,list)).
type(any_p_a,(tree,list)).
type(casetree_a,(tree,list)).
type(casetree_p_a,(element,list)).
type(casetree_q_a,(element,list,list)).

%Solution
%c0(C):- head_literal(C,f,2,(0,1)), 
%        body_literal(C,casetree_a,2,(0,1)). 
%:- not c0(0).
%c1(C):- head_literal(C,casetree_p_a,2,(0,1)), 
%        body_literal(C,head,2,(1,0)), 
%        body_literal(C,tail,2,(1,2)),
%        body_literal(C,empty,1,(2,)). 
%:- not c1(1).
%c2(C):- head_literal(C,casetree_q_a,3,(0,1,2)), 
%        body_literal(C,head,2,(2,0)), 
%        body_literal(C,tail,2,(2,3)),
%        body_literal(C,any_a,2,(1,3)).
%:- not c2(2).
%c3(C):- head_literal(C,any_p_a,2,(0,1)), 
%     body_literal(C,f,2,(0,1)).
%:- not c3(3).


