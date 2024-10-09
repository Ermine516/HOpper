% BEST PROG 40:
%f(A):-empty(A).
%f(A):-head(A,B),even(B),tail(A,C),f(C).
% Precision:1.00, Recall:1.00, TP:1, FN:0, TN:1, FP:0
%real	0m0,220s
%user	0m0,197s
%sys	0m0,070s

max_vars(3).
max_body(4).
max_clauses(2).

%switches Enabled. 
enable_recursion. 

%main predicate
head_pred(f,1).


% integer predicates
body_pred(suc,2).
body_pred(zero,1).
body_pred(even,1).

%list predicates
body_pred(tail,2).
body_pred(head,2).
body_pred(empty,1).

%main predicate type and direction
type(f,(list,)).
direction(f,(in,)).

%list predicates directions
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).

%integer predicates directions
direction(even,(in,)).
direction(zero,(out,)).
direction(suc,(in,out)).

%list predicates types
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).

%integer predicates types
type(even,(element,)).
type(zero,(element,)).
type(suc,(element,element)).

% Solution

% c0(C):- head_literal(C,f,1,(0,)), 
%	body_literal(C,empty,1,(0,)).
%      :- not c0(0).
% c1(C):- head_literal(C,f,1,(0,)), 
%	body_literal(C,head,2,(0,1)), 
%	body_literal(C,tail,2,(0,2)), 
%	body_literal(C,even,1,(1,)), 
%	body_literal(C,f,1,(2,)). 
%      :- not c1(1).
