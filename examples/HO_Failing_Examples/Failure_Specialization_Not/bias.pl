
max_vars(4).
max_clauses(2).
max_body(4).

head_pred(f,1).
body_pred(l, 1).
body_pred(d,1).


%creates the wrong constraint

c1:- head_literal(0,f,1,(0,)), body_literal(0,notpred_a,1,(0,)).
:-not c1.
c2:- head_literal(1,notpred_p_a,1,(0,)), body_literal(1,l,1,(0,)).
:-not c2.

%the right program
%c1:- head_literal(0,f,1,(0,)), body_literal(0,notpred_a,1,(0,)).
%:-not c1.
%c2:- head_literal(1,notpred_p_a,1,(0,)), body_literal(1,l,1,(0,)), body_literal(1,d,1,(0,)).
%:-not c2.

