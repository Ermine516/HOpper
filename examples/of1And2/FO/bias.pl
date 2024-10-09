
max_vars(5).
max_clauses(3).
max_body(5).
enable_recursion.

head_pred(f,1).
body_pred(suc,2).
body_pred(zero,1).
body_pred(cons,3).
body_pred(empty,1).


direction(f,(in,)).
direction(suc,(in,out)).
direction(zero,(out,)).
direction(cons,(in,out,out)).
direction(empty,(out,)).

type(f,(list,)).
type(suc,(integer,integer)).
type(zero,(integer,)).
type(cons,(list,integer,list)).
type(empty,(list,)).




%Solution

%c0(C):- head_literal(C,f,1,(0,)), 
%	body_literal(C,empty,1,(0,)),
%	body_size(C,1).
%:- not c0(0).

%c1(C):- head_literal(C,f,1,(0,)), 
%	body_literal(C,cons,3,(0,1,2)), 
%	body_literal(C,zero,1,(3,)),
%	body_literal(C,suc,2,(3,1)),
%	body_literal(C,f,1,(2,)),
%	body_size(C,4).
%:- not c1(1).

%c2(C):- head_literal(C,f,1,(0,)), 
% 	body_literal(C,cons,3,(0,1,2)), 
%	body_literal(C,zero,1,(3,)),
%	body_literal(C,suc,2,(3,4)),
%	body_literal(C,suc,2,(4,1)),
%	body_literal(C,f,1,(2,)),
%	body_size(C,5).
%:- not c2(2).


