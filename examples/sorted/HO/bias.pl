% BEST PROG 94:
%fold_p_a(A,B,C):-suc(B,C),geq(C,A).
%f(A):-zero(C),fold_a(C,A,B).
% Precision:1.00, Recall:1.00, TP:10, FN:0, TN:12, FP:0


%real	0m0,534s
%user	0m0,873s
%sys	0m0,070s

max_vars(5).
max_body(5).
max_clauses(2).

enable_recursion.
non_datalog.
allow_singletons.


head_pred(f,1).
body_pred(head,2).
body_pred(tail,2).
body_pred(suc,2).
body_pred(pred,2).
body_pred(geq,2).
body_pred(empty,1).
body_pred(zero,1).

type(f,(list,)).
type(head,(list,integer)).
type(tail,(list,list)).
type(suc,(integer,integer)).
type(pred,(integer,integer)).
type(geq,(integer,integer)).
type(empty,(list,)).
type(zero,(integer,)).


direction(f,(in,)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(geq,(in,in)).
direction(empty,(in,)).
direction(zero,(out,)).


direction(fold_a,(in,in,out)).
direction(fold_p_a,(in,in,out)).
type(fold_a,(integer,list,list)).
type(fold_p_a,(integer,integer,integer)).
