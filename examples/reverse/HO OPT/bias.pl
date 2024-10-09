% BEST PROG 108:
%fold_p_a(A,B,C):-head(C,B),tail(C,A).
%f(A,B):-empty(C),fold_a(C,A,B).
% Precision:1.00, Recall:1.00, TP:4, FN:0, TN:5, FP:0
%real	0m0,867s
%user	0m1,771s
%sys	0m0,075s



max_vars(4).
max_body(3).
max_clauses(2).


head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).


type(f,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).


direction(f,(in,out)).
direction(head,(out,in)).
direction(tail,(out,in)).
direction(empty,(out,)).


type(fold_a,(list,list,list)).
type(fold_p_a,(list,element,list)).

direction(fold_p_a,(in,in,out)).
direction(fold_a,(in,in,out)).






