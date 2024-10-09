% BEST PROG 320:
%f(A,B):-map(map_p_a,A,B).
%map_p_a(A,B):-reverse(A,C),tail(C,D),reverse(D,B).
% Precision:1.00, Recall:1.00, TP:2, FN:0, TN:2, FP:0
%real	0m2,040s
%user	0m4,352s
%sys	0m0,158s

% parameters

max_vars(5).
max_body(3).
max_clauses(3).

% Head Predicates 
head_pred(f,2).

% Body Predicates 
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).
body_pred(reverse,2).

% directions
direction(f,(in,out)).
direction(head,(out,out)).
direction(tail,(out,out)).
direction(reverse,(in,out)).

% higher-order directions
direction(map_a,(in,out)).
direction(map_p_a,(in,out)).
direction(empty,(out,)).

%  types
type(f,(list,list)).
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).
type(reverse,(list,list)).

% higher-order types
type(map_a,(list,list)).
type(map_p_a,(list,list)).







