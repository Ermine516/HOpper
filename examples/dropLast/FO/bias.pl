

% parameters

max_vars(8).
max_body(6).
max_clauses(2).

% switches enabled 

enable_recursion.

% Head Predicates 
head_pred(f,2).

% Body Predicates 
body_pred(cons,3).
body_pred(tail,2).
body_pred(empty,1).
body_pred(reverse,2).

% directions
direction(f,(in,out)).
direction(cons,(out,out,out)).
direction(tail,(out,out)).
direction(reverse,(in,out)).
direction(empty,(out,)).

%  types
type(f,(dlist,dlist)).
type(cons,(dlist,list,dlist)).
type(tail,(list,list)).
type(empty,(dlist,)).
type(reverse,(list,list)).


% Solution
%c0(C):- head_literal(C,f,2,(0,1)),
% 	 body_literal(C,empty,1,(0,)),
% 	 body_literal(C,empty,1,(1,)),
% 	 body_size(C,2).
%:- not c0(0).

%c1(C):- head_literal(C,f,2,(0,1)),
%	body_literal(C,cons,3,(0,2,6)),
%	body_literal(C,reverse,2,(2,3)),
%	body_literal(C,tail,2,(3,4)),
%	body_literal(C,reverse,2,(4,5)),
%	body_literal(C,con,3,(1,5,7)),
%	body_literal(C,f,2,(6,7)).
%:- not c1(1).




