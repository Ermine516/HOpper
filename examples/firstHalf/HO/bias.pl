% BEST PROG 47:
%ite_p_a(A,B):-pred(A,C),pred(C,B).
%ite_q_a(A,B,C):-head(A,B),tail(A,C).
%f(A,B):-len(A,C),ite_a(A,C,B).
% Precision:1.00, Recall:1.00, TP:8, FN:0, TN:2, FP:0
%real	0m0,433s
%user	0m0,691s
%sys	0m0,052s

%Parameters

max_vars(8).
max_body(7).
max_clauses(3).

%head predicates
head_pred(f,2).


%body predicates
body_pred(head,2).
body_pred(cons,3).
body_pred(tail,2).
body_pred(empty,1).
body_pred(suc,2).
body_pred(pred,2).
body_pred(zero,1).
body_pred(len,2).

%directions
direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(len,(in,out)).
direction(cons,(out,in,in)).

% higher-order directions
direction(ite_a,(in,in,out)).
direction(ite_p_a,(in,out)).
direction(ite_q_a,(in,out,out)).

%types
type(f,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).
type(suc,(num,num)).
type(pred,(num,num)).
type(zero,(num,)).
type(len,(list,num)).
type(cons,(list,element,list)).

% higher-order types
type(ite_a,(list,num,list)).
type(ite_p_a,(num,num)).
type(ite_q_a,(list,element,list)).




