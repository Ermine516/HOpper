% BEST PROG 721:
%fold_p_a(A,B,C):-f(B,D),max(D,A,C).
%f(A,B):-children(A,C),zero(E),fold_a(E,C,D),suc(D,B).
% Precision:1.00, Recall:1.00, TP:7, FN:0, TN:4, FP:0
%real	0m26,336s
%user	1m6,149s
%sys	0m0,807s


%parameters
max_vars(5).
max_clauses(2).
max_body(4).

% switches enabled 
enable_recursion.

%Head predicates
head_pred(f,2).

%Body predicates

body_pred(head,2).
body_pred(tail,2).
body_pred(root,2).
body_pred(children,2).
body_pred(empty,1).
body_pred(max,3).
body_pred(suc,2).
body_pred(zero,1).
body_pred(leaf,1).

%directions 

direction(f,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(root,(in,out)).
direction(children,(in,out)).
direction(max,(in,in,out)).
direction(suc,(in,out)).
direction(zero,(out,)).
direction(empty,(out,)).
direction(leaf,(out,)).

%types

type(f,(tree,element)).
type(head,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).
type(root,(tree,element)).
type(children,(tree,list)).
type(leaf,(tree,)).
type(suc,(element,element)).
type(max,(element,element,element)).
type(zero,(element,)).

%Higher-order directions
direction(fold_a,(in,in,out)).
direction(fold_p_a,(in,in,out)).

%Higher-order types

type(fold_a,(element,list,element)).
type(fold_p_a,(element,tree,element)).



