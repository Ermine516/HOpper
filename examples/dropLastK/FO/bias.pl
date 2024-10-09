
%Parameters
max_vars(8).
max_body(6).
max_clauses(4).

% switches enabled 

enable_recursion.
enable_ho_recursion.

%head predicates
head_pred(f,3).

%body predicates
body_pred(pred,2).
body_pred(eq,2).
body_pred(zero,1).
body_pred(tail,2).
body_pred(reverse,2).
body_pred(cons,3).
body_pred(empty,1).

%types
type(f,(integer,dlist,dlist)).
type(pred,(integer,integer)).
type(eq,(dlist,dlist)).
type(zero,(integer,)).
type(tail,(list,list)).
type(reverse,(list,list)).
type(cons,(dlist,list,dlist)).
type(empty,(dlist,)).



% directions
direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(eq,(out,in)).
direction(zero,(out,)).
direction(tail,(in,out)).
direction(reverse,(in,out)).
direction(cons,(out,out,out)).
direction(empty,(out,)).

% Higher-order directions
direction(g_a,(out,out)).
direction(g_p_a,(out,out)).

% Higher-order types
type(g_a,(dlist,dlist)).
type(g_p_a,(dlist,dlist)).

%Solution

%c(C):- 
%head_literal(C,f,3,(0,1,2)), 
%body_literal(C,zero,1,(0,)),
%body_literal(C,eq,2,(1,2)).
%:-not c(0).

%c1(C):- 
%head_literal(C,f,3,(0,1,2)), 
%body_literal(C,g_a,2,(1,3)),
%body_literal(C,pred,2,(0,4)),
%body_literal(C,f,3,(4,3,2)).
%:-not c1(1).

%c2(C):- 
%head_literal(C,g_p_a,2,(0,1)),
%body_literal(C,empty,1,(0,)),
%body_literal(C,empty,1,(1,)).
%:-not c2(2).

%c3(C):- 
%head_literal(C,g_p_a,2,(0,1)),
%body_literal(C,cons,3,(0,2,3)),
%body_literal(C,reverse,2,(2,4)),
%body_literal(C,tail,2,(4,5)),
%body_literal(C,reverse,2,(5,6)),
%body_literal(C,cons,3,(1,6,7)),
%body_literal(C,g_p_a,2,(3,7)).
%:-not c3(3).




