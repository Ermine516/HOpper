% BEST PROG 1:
%f(A,B):-zero(C),h_a(C,A,D),g_a(D,B).
%g_p_a(A,B):-empty(A),empty(B).
%g_p_a(A,B):-head(A,C),tail(A,F),zero(E),h_p_a(E,C,D),g_p_a(F,G),tail2(B,G),head2(B,D).
%h_p_a(A,B,C):-zero(B),empty(C).
%h_p_a(A,B,C):-pred(B,D),suc(A,E),less0(B),h_p_a(E,D,F),tail2(C,F),head(C,E).



%parameters
max_vars(7).
max_clauses(5).
max_body(7).

% switches enabled 

allow_singletons.
non_datalog.
enable_recursion.
enable_ho_recursion.

%Head predicates
head_pred(f, 2).

%Body predicates
body_pred(suc, 2).
body_pred(pred, 2).
body_pred(zero,1).
body_pred(head,2).
body_pred(head2,2).
body_pred(tail,2).
body_pred(tail2,2).
body_pred(empty,1).
body_pred(less0,1).

%directions 
direction(f,(in,out)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(head,(in,out)).
direction(head2,(in,out)).
direction(tail,(in,out)).
direction(tail2,(out,in)).
direction(empty,(out,)).
direction(less0,(in,)).

%types
type(f,(element,list)).
type(suc,(element,element)).
type(pred,(element,element)).
type(zero,(element,)).
type(head,(list,element)).
type(head2,(list,list)).
type(tail,(list,list)).
type(tail2,(list,list)).
type(empty,(list,)).
type(less0,(element,)).

%Higher-order directions
direction(g_a,(in,out)).
direction(h_a,(in,in,out)).
direction(g_p_a,(in,out)).
direction(h_p_a,(in,in,out)).


%Higher-order types
type(g_a,(list,list)).
type(h_a,(element,element,list)).
type(g_p_a,(list,list)).
type(h_p_a,(element,element,list)).



%Solution
% c0(C) :- head_literal(C,f,2,(0,1)),
%      	   body_literal(C,zero,1,(2,)),
%	   body_literal(C,h_a,3,(2,0,3)), 
%	   body_literal(C,g_a,2,(3,1)),
%	   body_size(C,3).
% :- not c0(0).
% c1(C) :- head_literal(C,g_p_a,2,(0,1)), 
%          body_literal(C,empty,1,(0,)),
%          body_literal(C,empty,1,(1,)),
%          body_size(C,2).
% :- not c1(1).
% c2(C) :- head_literal(C,g_p_a,2,(0,1)), 
%          body_literal(C,head,2,(0,2)),
%          body_literal(C,head2,2,(1,3)),
%          body_literal(C,zero,1,(4,)),
%          body_literal(C,h_p_a,3,(4,2,3)),
%          body_literal(C,tail,2,(0,5)),
%          body_literal(C,tail2,2,(1,6)),
%          body_literal(C,g_p_a,2,(5,6)),
%          body_size(C,7).
% :- not c2(2).
% c3(C) :- head_literal(C,h_p_a,3,(0,1,2)), 
%          body_literal(C,zero,1,(1,)),
%          body_literal(C,empty,1,(2,)),
%          body_size(C,2).
%:- not c3(3).
% c4(C) :- head_literal(C,h_p_a,3,(0,1,2)), 
%          body_literal(C,less0,1,(1,)),
%          body_literal(C,pred,2,(1,3)),
%          body_literal(C,head,2,(2,4)),
%          body_literal(C,suc,2,(0,4)),
%          body_literal(C,tail2,2,(2,5)),
%          body_literal(C,h_p_a,3,(4,3,5)),
%          body_size(C,6).
%:- not c4(4).




