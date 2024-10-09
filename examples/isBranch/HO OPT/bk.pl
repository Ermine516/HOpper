head([H|_],H).
tail([_|T],T).
empty([]).

root(t(R,_),R).
children(t(_,C),C).
leaf(t(_,[])).

eqs(X,X).

casetree(P,_,t(R,[]),A) :- call(P,R,A).
casetree(_,Q,t(R,[H|T]),A) :- call(Q,R,[H|T],A). 

any(P,[H|_],A) :- call(P,H,A).
any(P,[_|T],A) :- any(P,T,A). 

higher_order_predicate(any, [2], 2, 1).
higher_order_predicate(casetree, [2,3], 2, 1).
