% BEST PROG 1750:
%ite_p_a(A,B):-suc(A,B).
%f(A,B):-zero(C),ite_a(C,A,D),map_a(D,B).
%map_p_a(A,B):-zero(C),ite_a(C,A,B).
% Precision:1.00, Recall:1.00, TP:5, FN:0, TN:3, FP:0

%real	0m12,010s
%user	0m23,635s
%sys	0m1,008s


%parameters
max_vars(4).
max_clauses(3).
max_body(3).

%Head predicates
head_pred(f, 2).

%Body predicates
body_pred(suc, 2).
body_pred(pred, 2).
body_pred(zero,1).

%directions 
direction(f,(in,out)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(zero,(out,)).

%types
type(f,(element,list)).
type(suc,(element,element)).
type(pred,(element,element)).
type(zero,(element,)).

%Higher-order directions
direction(map_a,(in,out)).
direction(ite_a,(in,in,out)).
direction(map_p_a,(in,out)).
direction(ite_p_a,(in,out)).


%Higher-order types
type(map_a,(list,list)).
type(ite_a,(element,element,list)).
type(map_p_a,(element,list)).
type(ite_p_a,(element,element)).




