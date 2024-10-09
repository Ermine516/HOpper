% Parameters 

max_vars(6).
max_clauses(4).
max_body(4).

% Switches Enabled

enable_recursion.
enable_ho_recursion.

% Predicate Declarations
head_pred(f, 3).
body_pred(suc, 2).
body_pred(eq,2).
body_pred(zero, 1).
body_pred(cons, 3).
body_pred(cons2, 3).
body_pred(empty, 1).
body_pred(less0, 1).
body_pred(pred,2).


% Direction Declarations

direction(f,(in,in,out)).
direction(suc,(in,out)).
direction(eq,(in,out)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(less0,(in,)).
direction(cons,(in,out,out)).
direction(cons2,(out,in,in)).
direction(empty,(out,)).

direction(g_a,(in,out)).
direction(g_p_a,(in,out)).

% Type Declarations
type(suc,(integer,integer)).
type(f,(integer,list,list)).
type(pred,(integer,integer)).
type(zero,(integer,)).
type(less0,(integer,)).
type(cons,(list,integer,list)).
type(cons2,(list,integer,list)).
type(empty,(list,)).
type(eq,(list,list)).
type(g_a,(list,list)).
type(g_p_a,(list,list)).


%Correct Program

%c0(C):- head_literal(C,f,3,(0,1,2)), 
%	body_literal(C,eq,2,(1,2)),
%	body_literal(C,zero,1,(0,)),
%	body_size(C,2).
%:- not c0(0).
%c1(C):- head_literal(C,f,3,(0,1,2)),
%	body_literal(C,less0,1,(0,)),
%	body_literal(C,pred,2,(0,4)),
%	body_literal(C,g_a,2,(1,3)),
%	body_literal(C,f,3,(4,3,2)),
%	body_size(C,4).
%     :- not c1(1).
%c3(C):- head_literal(C,g_p_a,2,(0,1)), 
%	body_literal(C,empty,1,(0,)),
%	body_literal(C,empty,1,(1,)),
%	body_size(C,2).
%     :- not c3(2).
%c2(C):- head_literal(C,g_p_a,2,(0,1)), 
%	body_literal(C,cons,3,(0,2,3)),
%	body_literal(C,g_p_a,2,(3,5)),
%	body_literal(C,suc,2,(2,4)),
%	body_literal(C,cons2,3,(1,4,5)).
%     :- not c2(3).



