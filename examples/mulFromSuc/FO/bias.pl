
max_vars(6).
max_clauses(5).
max_body(4).
allow_singletons.
non_datalog.

head_pred(f, 3).
body_pred(suc, 2).
body_pred(pred, 2).
body_pred(eq, 2).
body_pred(zero, 1).
body_pred(less0, 1).

direction(f,(in,in,out)).
direction(suc,(in,out)).
direction(pred,(in,out)).
direction(eq,(in,out)).
direction(zero,(out,)).
direction(less0,(in,)).


direction(g_a,(in,in,out,in)). 
direction(g_p_a,(in,in,out,in)).
direction(h_a,(in,in,out)).
direction(h_p_a,(in,in,out)).

% using starter type here would require
% enabling HO recursion which is much 
%worse than having all types integer.

type(f,(integer,integer,integer)).
type(suc,(integer,integer)).
type(pred,(integer,integer)).
type(eq,(integer,integer)).
type(zero,(integer,)).
type(less0,(integer,)).

type(h_p_a,(integer,integer,integer)).
type(h_a,(integer,integer,integer)).
type(g_a,(integer,integer,integer,integer)).
type(g_p_a,(integer,integer,integer,integer)).



%c0(C):- head_literal(C,f,3,(0,1,2)),
%	body_literal(C,zero,1,(3,)),
%	body_literal(C,g_a,4,(3,0,2,1)).
%:- not c0(0).
%c1(C):- head_literal(C,g_p_a,4,(0,1,2,3)),
%	body_literal(C,zero,1,(1,)),
%	body_literal(C,eq,2,(0,2)).
%:-  not c1(1).
%c2(C):- head_literal(C,g_p_a,4,(0,1,2,3)),
%	body_literal(C,less0,1,(1,)),
%	body_literal(C,pred,2,(1,4)),
%	body_literal(C,h_a,3,(0,3,5)),
%	body_literal(C,g_a,4,(5,4,2,3)).
%:-  not c2(2).
%c3(C):- head_literal(C,h_p_a,3,(0,1,2)),
%	body_literal(C,zero,1,(1,)),
%	body_literal(C,eq,2,(0,2)).
%:-  not c3(3).
%c4(C):- head_literal(C,h_p_a,3,(0,1,2)),
%	body_literal(C,less0,1,(1,)),
%	body_literal(C,pred,2,(1,3)),
%	body_literal(C,suc,2,(0,4)),
%	body_literal(C,h_a,3,(4,3,2)).
%:-  not c4(4).

