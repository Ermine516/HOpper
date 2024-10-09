
%parameters

max_vars(7).
max_clauses(3).
max_body(5).

% switches enabled 

enable_recursion.
enable_ho_recursion.


%Head predicates

head_pred(f,2).

%Body predicates

body_pred(head,2).
body_pred(tail,2).
body_pred(children,2).
body_pred(empty,1).
body_pred(max,3).
body_pred(suc,2).
body_pred(zero,1).
body_pred(eq,2).

%directions 

direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).
direction(children,(in,out)).
direction(max,(in,in,out)).
direction(suc,(in,out)).
direction(zero,(out,)).
direction(eq,(in,out)).

%types
type(f,(tree,element)).
type(head,(list,tree)).
type(tail,(list,list)).
type(empty,(list,)).
type(children,(tree,list)).
type(suc,(element,element)).
type(max,(element,element,element)).
type(zero,(element,)).
type(eq,(element,element)).

%Higher-order directions
direction(g_a,(in,in,out)).
direction(g_p_a,(in,in,out)).

%Higher-order types
type(g_a,(element,list,element)).
type(g_p_a,(element,list,element)).

%Solution
% c0:- head_literal(0,f,2,(0,1)), 
%      body_literal(0,children,2,(0,2)), 
%      body_literal(0,zero,1,(3,)), 
%      body_literal(0,g_a,3,(3,2,4)), 
%      body_literal(0,suc,2,(4,1)).
% :- not c0.
% c1:- head_literal(1,g_p_a,3,(0,1,2)), 
%      body_literal(1,empty,1,(1,)),
%      body_literal(1,eq,2,(0,2)).
% :- not c1.

% c2:- head_literal(2,g_p_a,3,(0,1,2)), 
%      body_literal(2,head,2,(1,3)), 
%      body_literal(2,tail,2,(1,4)), 
%      body_literal(2,f,2,(3,5)),
%      body_literal(2,max,3,(0,5,6)),
%      body_literal(2,g_p_a,3,(6,4,2)).
%:- not c2.
 

