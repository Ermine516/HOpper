% BEST PROG 1750:
%ite_p_a(A,B):-suc(A,B).
%f(A,B):-zero(C),ite_a(C,A,D),map_a(D,B).
%map_p_a(A,B):-zero(C),ite_a(C,A,B).
% Precision:1.00, Recall:1.00, TP:5, FN:0, TN:3, FP:0

%real	0m12,010s
%user	0m23,635s
%sys	0m1,008s


%parameters
max_vars(7).
max_clauses(5).
max_body(7).

% switches enabled 
allow_singletons.
non_datalog.
enable_recursion.

%Head predicates
head_pred(f, 2).

%Body predicates
body_pred(suc, 2).
body_pred(pred, 2).
body_pred(zero,1).
body_pred(head,2).
body_pred(head2,2).
body_pred(tail,2).
body_pred(tail2,2).
body_pred(empty,1).
body_pred(less0,1).

%directions 
direction(f,(in,out)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(head,(in,out)).
direction(head2,(in,out)).
direction(tail,(in,out)).
direction(tail2,(out,in)).
direction(empty,(out,)).
direction(less0,(in,)).

%types
type(f,(element,list)).
type(suc,(element,element)).
type(pred,(element,element)).
type(zero,(element,)).
type(head,(list,element)).
type(head2,(list,list)).
type(tail,(list,list)).
type(tail2,(list,list)).
type(empty,(list,)).
type(less0,(element,)).

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




