head([H|_],H).
tail([_|T],T).
empty([]).

root(t(R,_),R).
children(t(_,C),C).


higher_order_predicate(g, [2], 2, 1).
g(P,X,Y):- call(P,X,Y).

