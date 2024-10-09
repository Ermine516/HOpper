% BEST PROG 1416:
%condlist_p_a(A,B):-any(A),empty(B).
%condlist_p_a(A,B):-last(B,A),front(B,C),condlist_a(C).
%f(A):-condlist_a(A).
% Precision:1.00, Recall:1.00, TP:11, FN:0, TN:2, FP:0
%real	0m6,431s
%user	0m11,179s
%sys	0m0,651s


max_vars(4).
max_clauses(3).
max_body(5).
enable_recursion.

head_pred(f, 1).
body_pred(front,2).
body_pred(head, 2).
body_pred(tail, 2).
body_pred(last, 2).
body_pred(empty, 1).
body_pred(any, 1).


type(f,(list,)).
type(front,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(last,(list,element)).
type(empty,(list,)).
type(any,(element,)).

direction(f,(in,)).
direction(last,(in,out)).
direction(front,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).
direction(any,(in,)).

direction(condlist_a,(in,)).
direction(condlist_p_a,(in,in)).
type(condlist_a,(list,)).
type(condlist_p_a,(element,list)).

%c0(C):- head_literal(C,f,1,(0,)), 
%	 body_literal(C,condlist_a,1,(0,)),
%	 body_size(C,1).
%:- not c0(0).

%c1(C):- head_literal(C,condlist_p_a,2,(0,1)), 
%	 body_literal(C,empty,1,(1,)), 
%	 body_literal(C,any,1,(0,)),
%	 body_size(C,2).
%:- not c1(1).

%c2(C):- head_literal(C,condlist_p_a,2,(0,1)), 
%	 body_literal(C,last,2,(1,0)), 
%	 body_literal(C,front,2,(1,2)), 
%	 body_literal(C,condlist_a,1,(2,)),
%	 body_size(C,3).
%:- not c2(2).

