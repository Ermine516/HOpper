% BEST PROG 132:
%f(A,B):-eq(A,B).
%f(A,B):-children(A,C),any_a(C,B).
%any_p_a(A,B):-f(A,B).
% Precision:1.00, Recall:1.00, TP:7, FN:0, TN:2, FP:0
%real	0m3,883s
%user	0m4,723s
%sys	0m0,043s


max_vars(4).
max_clauses(4).
max_body(2).
enable_recursion.


head_pred(f,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).
body_pred(root,2).
body_pred(children,2).
body_pred(eq,2).

direction(f,(in,in)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).
direction(root,(in,out)).
direction(children,(in,out)).
direction(eq,(in,out)).

type(f,(tree,tree)).
type(root,(tree,element)).
type(children,(tree,list)).
type(head,(list,tree)).
type(tail,(list,list)).
type(empty,(list,)).
type(eq,(tree,tree)).


direction(any_a,(in,in)).

direction(any_p_a,(in,in)).

type(any_a,(list,tree)).

type(any_p_a,(tree,tree)).




