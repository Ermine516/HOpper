% BEST PROG 185:
%f(A,B):-tail(A,C),member(B,C),head(A,B).
%f(A,B):-tail(A,C),f(C,B).
% Precision:1.00, Recall:1.00, TP:3, FN:0, TN:2, FP:0
%real	0m3,089s
%user	0m3,370s
%sys	0m0,083s

%parameters
max_vars(4).
max_body(4).
max_clauses(2).

% switches enabled 
enable_recursion.

%Head predicates
head_pred(f,2).

%Body predicates
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).
body_pred(member,2).

%types
type(f,(list,element)).
type(empty,(list,)).
type(head,(list,element)).
type(tail,(list,list)).
type(member,(element,list)).


%directions 
direction(f,(in,in)).
direction(empty,(out,)).
direction(member,(in,in)).
direction(head,(in,out)).
direction(tail,(in,out)).



%Solution
%c0(C):- head_literal(C,f,2,(0,1)),
%	body_literal(C,head,2,(0,1)), 
%	body_literal(C,tail,2,(0,2)),
%	body_literal(C,member,2,(1,2)),	
%	body_size(C,3).
%:- not c0(0).
%
%c1(C):- head_literal(C,f,2,(0,1)), 
%	body_literal(C,tail,2,(0,2)),
%	body_literal(C,f,2,(2,1)),
%	body_size(C,2).
%:- not c1(1).




