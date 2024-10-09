
%Parameters

max_vars(8).
max_body(7).
max_clauses(3).

%head predicates
head_pred(f,2).


%body predicates
body_pred(head,2).
body_pred(cons,3).
body_pred(tail,2).
body_pred(any,1).
body_pred(empty,1).
body_pred(pred,2).
body_pred(zero,1).
body_pred(len,2).

%directions
direction(f,(in,out)).
direction(head,(in,out)).
direction(cons,(out,in,in)).
direction(tail,(in,out)).
direction(any,(in,)).
direction(empty,(out,)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(len,(in,out)).

% higher-order directions
direction(g_a,(in,in,out)).
direction(g_p_a,(in,in,out)).


%types
type(f,(list,list)).
type(head,(list,element)).
type(cons,(list,element,list)).
type(tail,(list,list)).
type(empty,(list,)).
type(any,(list,)).
type(pred,(num,num)).
type(zero,(num,)).
type(len,(list,num)).

% higher-order types
type(g_a,(list,num,list)).
type(g_p_a,(list,num,list)).

%Solution

%c0(C):- head_literal(C,f,2,(0,1)), 
%	body_literal(C,len,2,(0,2)),
%	body_literal(C,g_a,3,(0,2,1)),
%	body_size(C,2).
%:- not c0(0).
%c1(C):- head_literal(C,g_p_a,3,(0,1,2)), 
%	body_literal(C,any,1,(0,)),
%	body_literal(C,zero,1,(1,)),
%	body_literal(C,empty,1,(2,)),
%	body_size(C,3).
%:- not c1(1).


%c2(C):- head_literal(C,g_p_a,3,(0,1,2)), 
% 	body_literal(C,pred,2,(1,3)), 
% 	body_literal(C,pred,2,(3,4)), 
%	body_literal(C,head,2,(0,5)),
%	body_literal(C,tail,2,(0,6)),
%	body_literal(C,cons,3,(2,5,7)),
%	body_literal(C,g_a,3,(6,4,7)),
%	body_size(C,6).
%:- not c2(2).

