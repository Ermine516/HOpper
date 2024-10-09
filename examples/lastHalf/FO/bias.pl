% BEST PROG 1831:
%f(A,B):-empty(B),empty(A).
%f(A,B):-tail(A,B),empty(B).
%f(A,B):-front(A,C),last(A,F),tail(C,E),f(E,D),app(D,F,B).
% Precision:1.00, Recall:1.00, TP:8, FN:0, TN:6, FP:0

%real	1m27,277s
%user	5m32,171s
%sys	0m1,573s


max_vars(6).
max_body(5).
max_clauses(3).
enable_recursion.

head_pred(f,2).

body_pred(empty,1).
body_pred(front,2).
body_pred(tail,2).
body_pred(last,2).
body_pred(app,3).


direction(f,(in,out)).

direction(empty,(out,)).
direction(front,(in,out)).
direction(tail,(in,out)).
direction(last,(in,out)).
direction(app,(in,in,out)).

type(f,(list,list)).
type(empty,(list,)).
type(front,(list,list)).
type(tail,(list,list)).
type(last,(list,element)).
type(app,(list,element,list)).


%c1(C):- head_literal(C,f,2,(0,1)), 
%	body_literal(C,empty,1,(0,)),
%	body_literal(C,empty,1,(1,)),
%	body_size(C,2).
%:- not c1(0).
%c2(C):- head_literal(C,f,2,(0,1)), 
%	body_literal(C,tail,2,(0,1)),
%	body_literal(C,empty,1,(1,)),
%	body_size(C,2).
%:- not c2(1).

%c3(C):- head_literal(C,f,2,(0,1)), 
%	body_literal(C,front,2,(0,2)),
%	body_literal(C,last,2,(0,5)),
%	body_literal(C,tail,2,(2,4)),
%	body_literal(C,f,2,(4,3)),
%	body_literal(C,app,3,(3,5,1)),
%	body_size(C,5).
%:- not c3(2).



