
max_vars(1).
max_clauses(3).
max_body(1).

head_pred(f,1).
body_pred(p,1).
body_pred(q,1).

%creates the wrong constraint

%c1:- head_literal(0,f,1,(0,)), body_literal(0,notpred_a,1,(0,)).
%:-not c1.
%c2:- head_literal(1,notpred_p_a,1,(0,)), body_literal(1,q,1,(0,)).
%:-not c2.
%:- c1,c2, not clause(2).


%c1:- head_literal(0,f,1,(0,)), body_literal(0,notpred_a,1,(0,)).
%c2:- head_literal(1,notpred_p_a,1,(0,)), body_literal(1,p,1,(0,)).
%c3:- head_literal(2,notpred_p_a,1,(0,)), body_literal(2,q,1,(0,)).
%:-not c1.
%:-not c2.
%:-not c3.
