% BEST PROG 5505:
%f(A,B,C):-eqs(C,B),z(A).
%f(A,B,C):-pred(A,E),map(map_p_a,B,D),f(E,D,C).
%map_p_a(A,B):-reverse(A,D),tail(D,C),reverse(C,B).
% Precision:1.00, Recall:1.00, TP:5, FN:0, TN:3, FP:0
%real	1m42,727s
%user	2m58,928s
%sys	0m3,667s


%Parameters
max_vars(8).
max_body(6).
max_clauses(4).

% switches enabled 

enable_recursion.

%head predicates
head_pred(f,3).

%body predicates
body_pred(pred,2).
body_pred(eqs,2).
body_pred(zero,1).
body_pred(tail,2).
body_pred(reverse,2).
body_pred(cons,3).
body_pred(empty,1).
%types
type(f,(integer,dlist,dlist)).
type(pred,(integer,integer)).
type(eqs,(dlist,dlist)).
type(zero,(integer,)).
type(tail,(list,list)).
type(reverse,(list,list)).
type(cons,(dlist,list,dlist)).
type(empty,(dlist,)).



% directions
direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(eqs,(out,in)).
direction(zero,(out,)).
direction(tail,(in,out)).
direction(reverse,(in,out)).
direction(cons,(out,out,out)).
direction(empty,(out,)).

% Higher-order directions
direction(map_a,(in,out)).
direction(map_p_a,(in,out)).

% Higher-order  types
type(map_a,(dlist,dlist)).
type(map_p_a,(list,list)).

%Solution

%c(C):- 
%head_literal(C,f,3,(0,1,2)), 
%body_literal(C,zero,1,(0,)),
%body_literal(C,eqs,2,(1,2)).
%:-not c(0).

%c1(C):- 
%head_literal(C,f,3,(0,1,2)), 
%body_literal(C,map_a,2,(1,3)),
%body_literal(C,pred,2,(0,4)),
%body_literal(C,f,3,(4,3,2)).
%:-not c1(1).

%c2(C):- 
%head_literal(C,map_p_a,2,(0,1)), 
%body_literal(C,reverse,2,(0,2)),
%body_literal(C,tail,2,(2,3)),
%body_literal(C,reverse,2,(3,1)).
%:-not c2(2).




