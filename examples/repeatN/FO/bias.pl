
max_vars(5).
max_clauses(2).
max_body(3).
enable_recursion.
non_datalog.
allow_singletons.


head_pred(f, 3).
body_pred(pred, 2).
body_pred(zero, 1).
body_pred(app, 3).
body_pred(empty, 1).

type(f,(list,integer,list)).
type(pred,(integer,integer)).
type(empty,(list,)).
type(app,(list,list,list)).
type(zero,(integer,)).


direction(f,(in,in,out)).
direction(pred,(in,out)).
direction(empty,(out,)).
direction(app,(in,in,out)).
direction(zero,(out,)).

%c0(C):- head_literal(C,f,3,(0,1,2)), 
%	body_literal(C,empty,1,(2,)),
%	body_literal(C,zero,1,(1,)),
%	body_size(C,2).
%:- not c0(0).
%c1(C):-  head_literal(C,f,3,(0,1,2)), 
%	body_literal(C,pred,2,(1,3)),
%	body_literal(C,f,3,(0,3,4)),
%	body_literal(C,app,3,(4,0,2)),
%	body_size(C,3).
%:- not c1(1).
