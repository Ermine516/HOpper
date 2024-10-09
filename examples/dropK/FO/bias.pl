% BEST PROG 106:
%f(A,B,C):-zero(A),eqs(B,C).
%f(A,B,C):-tail(B,D),pred(A,E),f(E,D,C).
% Precision:1.00, Recall:1.00, TP:3, FN:0, TN:2, FP:0
%real	0m0,700s
%user	0m0,923s
%sys	0m0,105s



%  Parameters
max_vars(5).
max_body(3).
max_clauses(2).

%Switches Enabled
enable_recursion. 

%Head predicates
head_pred(f,3).

%Body predicates

body_pred(pred,2).
body_pred(zero,1).
body_pred(tail,2).
body_pred(eq,2).

% types
type(f,(integer,list,list)).
type(pred,(integer,integer)).
type(zero,(integer,)).
type(tail,(list,list)).
type(eq,(list,list)).

% directions 
direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(zero,(out,)).
direction(tail,(in,out)).
direction(eq,(in,out)).

%Solution
%c0(C):- head_literal(C,f,3,(0,1,2)), 
%	body_literal(C,zero,1,(0,)),
%	body_literal(C,eq,2,(1,2)). 
%:- not c0(0).
%c1(C):- head_literal(C,f,3,(0,1,2)), 
%	body_literal(C,pred,2,(0,3)),
%	body_literal(C,tail,2,(1,4)),
%	body_literal(C,f,3,(3,4,2)). 
%:- not c1(1).




