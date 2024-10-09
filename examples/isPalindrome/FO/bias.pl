
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



type(f,(list,)).
type(front,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(last,(list,element)).
type(empty,(list,)).

direction(f,(in,)).
direction(last,(in,out)).
direction(front,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).

%Solution

%c0(C):- head_literal(C,f,1,(0,)), 
%	 body_literal(C,empty,1,(0,)),
%	 body_size(C,1).
%:- not c0(0).

%c1(C):- head_literal(C,f,1,(0,)), 
%	 body_literal(C,front,2,(0,1)), 
%	 body_literal(C,empty,1,(1,)),
%	 body_size(C,2).
%:- not c1(1).

%c2(C):- head_literal(C,f,1,(0,)), 
% 	body_literal(C,head,2,(0,3)), 
%	body_literal(C,tail,2,(0,1)), 
%	body_literal(C,last,2,(1,3)), 
%	body_literal(C,front,2,(1,2)), 
%	body_literal(C,f,1,(2,)),
%	body_size(C,5).
%:- not c2(2).




