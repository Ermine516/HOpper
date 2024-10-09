


max_vars(7).
max_clauses(2).
max_body(6).
enable_recursion.

head_pred(f, 3).
body_pred(pred, 2).
body_pred(eq, 2).
body_pred(zero, 1).
body_pred(less0, 1).
body_pred(head, 2).
body_pred(tail, 2).
body_pred(app, 3).
body_pred(empty, 1).


type(f,(integer,list,list)).
type(pred,(integer,integer)).
type(eq,(list,list)).
type(zero,(integer,)).
type(less0,(integer,)).
type(head,(list,integer)).
type(tail,(list,list)).
type(app,(list,integer,list)).
type(empty,(list,)).


direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(eq,(in,out)).
direction(zero,(out,)).
direction(less0,(in,)).
direction(head,(in,out)).
direction(tail,(in,out)).
direction(app,(in,in,out)).
direction(empty,(out,)).


%c0(C):- head_literal(C,f,3,(0,1,2)),
%	body_literal(C,zero,1,(0,)),
%	body_literal(C,eq,2,(1,2)),
%	body_size(C,2).
%:- not c0(0).
%
%c1(C):- head_literal(C,f,3,(0,1,2)),
%	body_literal(C,less0,1,(0,)),
%	body_literal(C,head,2,(1,3)),
%	body_literal(C,tail,2,(1,4)),
%	body_literal(C,app,3,(4,3,5)),
%	body_literal(C,pred,2,(0,6)),
%	body_literal(C,f,3,(6,5,2)),
%	body_size(C,6).
%:- not c1(1).

