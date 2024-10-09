% BEST PROG 88:
%f(A,B):-map_a(A,B).
%map_p_a(A,B):-char_to_int(A,E),my_pred(E,D),my_pred(D,C),int_to_char(C,B).
% Precision:1.00, Recall:1.00, TP:28, FN:0, TN:13, FP:0

%real	0m0,969s
%user	0m2,391s
%sys	0m0,137s

%parameters
max_vars(5).
max_clauses(2).
max_body(4).

% switches enabled 
enable_recursion.

%Head predicates
head_pred(f,2).

%Body predicates
body_pred(my_succ,2).
body_pred(my_pred,2).
body_pred(char_to_int,2).
body_pred(int_to_char,2).
body_pred(head,2).
body_pred(tail,2).
body_pred(empty,1).

%directions 
direction(f,(in,out)).
direction(my_succ,(in,out)).
direction(my_pred,(in,out)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(int_to_char,(in,out)).
direction(char_to_int,(in,out)).
direction(empty,(out,)).

%types
type(f,(list,list)).
type(my_succ,(num,num)).
type(my_pred,(num,num)).
type(head,(list,char)).
type(tail,(list,list)).
type(int_to_char,(num,char)).
type(char_to_int,(char,num)).
type(empty,(list,)).

%Higher-order directions
direction(map_a,(in,out)).
direction(map_p_a,(in,out)).

%Higher-order types
type(map_a,(list,list)).
type(map_p_a,(char,char)).

