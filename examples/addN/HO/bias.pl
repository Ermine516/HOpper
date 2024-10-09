% BEST PROG 356:
%map_p_a(A,B):-suc(A,B).
%caseint_q_a(A,B,C):-map_a(B,D),caseint_a(A,D,C).
%f(A,B,C):-caseint_a(A,B,C).
%caseint_p_a(A,B):-eq(A,B).
% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:3, FP:0
%real	0m2,679s
%user	0m4,775s
%sys	0m0,180s


%Parameters
max_vars(6).
max_clauses(4).
max_body(4).

%Predicate Declarations

head_pred(f, 3).
body_pred(suc, 2).
body_pred(eq,2).
body_pred(zero, 1).
body_pred(cons, 3).
body_pred(cons2, 3).
body_pred(empty, 1).
body_pred(less0, 1).
body_pred(pred,2).

%Direction Declarations
direction(f,(in,in,out)).
direction(suc,(in,out)).
direction(eq,(out,out)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(less0,(in,)).
direction(cons,(in,out,out)).
direction(cons2,(out,in,in)).
direction(empty,(out,)).
%Type Declarations
type(f,(integer,list,list)).
type(suc,(integer,integer)).
type(eq,(list,list)).
type(pred,(integer,integer)).
type(zero,(integer,)).
type(less0,(integer,)).
type(cons,(list,integer,list)).
type(cons2,(list,integer,list)).
type(empty,(list,)).
type(g_a,(list,list)).
type(g_p_a,(list,list)).

% HO Direction Declarations
direction(map_a,(in,out)).
direction(map_p_a,(in,out)).
direction(caseint_a,(in,in,out)).
direction(caseint_p_a,(in,out)).
direction(caseint_q_a,(in,in,out)).
% HO Type Declarations
type(map_a,(list,list)).
type(map_p_a,(integer,integer)).
type(caseint_a,(integer,list,list)).
type(caseint_p_a,(list,list)).
type(caseint_q_a,(integer,list,list)).

% Solution
%c0(C):- head_literal(C,f,3,(0,1,2)), 
%	body_literal(C,caseint_a,3,(0,1,2)),
%	body_size(C,1).
%:- not c0(0).
%c1(C):- head_literal(C,caseint_p_a,2,(0,1)),
%	body_literal(C,eq,2,(0,1)),
%	body_size(C,1).
%:- not c1(1).
%c2(C):- head_literal(C,caseint_q_a,3,(0,1,2)),
%	body_literal(C,map_a,2,(1,3)),
%	body_literal(C,caseint_a,3,(0,3,2)),
%	body_size(C,2).
%:- not c2(2).

%c3(C):- head_literal(C,map_p_a,2,(0,1)),
%	body_literal(C,suc,2,(0,1)),
%	body_size(C,1).
%:- not c3(3).



