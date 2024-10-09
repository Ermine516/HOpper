

root(t(R,_),R).
children(t(_,C),C).
head([H|_],H).
tail([_|T],T).
empty([]).
eq(X,X).

any(P,[H|_],B) :- call(P,H,B).
any(P,[_|T],B) :- any(P,T,B). 


higher_order_predicate(any, [2], 2, 1).
