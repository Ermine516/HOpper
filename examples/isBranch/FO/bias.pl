
%parameters
max_vars(5).
max_clauses(4).
max_body(5).

% switches enabled 
enable_recursion.
enable_ho_recursion.

%Head predicates
head_pred(f,2).

%Body predicates
body_pred(head,2).
body_pred(head2,2).
body_pred(tail,2).
body_pred(empty,1).
body_pred(root,2).
body_pred(children,2).

%directions 
direction(f,(in,in)).
direction(head,(in,out)).
direction(head2,(in,out)).
direction(tail,(in,out)).
direction(empty,(out,)).
direction(root,(in,out)).
direction(children,(in,out)).

%types
type(f,(tree,list)).
type(head,(list,tree)).
type(head2,(list,element)).
type(tail,(list,list)).
type(empty,(list,)).
type(root,(tree,element)).
type(children,(tree,list)).

%Higher-order directions
direction(g_a,(in,in)).
direction(g_p_a,(in,in)).

%Higher-order types
type(g_a,(list,list)).
type(g_p_a,(list,list)).

%Solution
%c0(C):- head_literal(C,f,2,(0,1)), 
%        body_literal(C,head2,2,(1,2)), 
%        body_literal(C,root,2,(0,2)), 
%        body_literal(C,tail,2,(1,3)),
%        body_literal(C,children,2,(0,3)). 
%:- not c0(0).
%c1(C):- head_literal(C,f,2,(0,1)), 
%        body_literal(C,head2,2,(1,2)), 
%        body_literal(C,root,2,(0,2)),
%        body_literal(C,tail,2,(1,3)),
%        body_literal(C,children,2,(0,4)),
%        body_literal(C,g_a,2,(4,3)). 
%:- not c1(1).
%c2(C):- head_literal(C,g_p_a,2,(0,1)), 
%        body_literal(C,head,2,(0,2)), 
%        body_literal(C,f,2,(2,1)).
%:- not c2(2).
%c3(C):- head_literal(C,g_p_a,2,(0,1)), 
%	body_literal(C,tail,2,(0,2)), 
%        body_literal(C,g_p_a,2,(2,1)).
%:- not c3(3).


