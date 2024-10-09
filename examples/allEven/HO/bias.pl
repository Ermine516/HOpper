% BEST PROG 5:
%f(A):-all_a(A).
%all_p_a(A):-even(A).
% Precision:1.00, Recall:1.00, TP:1, FN:0, TN:1, FP:0

%real	0m0,140s
%user	0m0,140s
%sys	0m0,009s

max_vars(3).
max_body(4).
max_clauses(2).

%main predicate
head_pred(f,1).


% integer predicates
body_pred(suc,2).
body_pred(zero,1).
body_pred(even,1).

%list predicates
body_pred(tail,2).
body_pred(head,2).
body_pred(empty,1).

%main predicate type and direction
type(f,(list,)).
direction(f,(in,)).

%list predicates directions
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).

%integer predicates directions
direction(even,(in,)).
direction(zero,(out,)).
direction(suc,(in,out)).

%list predicates types
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).

%integer predicates types
type(even,(element,)).
type(zero,(element,)).
type(suc,(element,element)).

%higher-order directions and types
direction(all_a,(in,)).
direction(all_p_a,(in,)).
type(all_a,(list,)).
type(all_p_a,(element,)).


