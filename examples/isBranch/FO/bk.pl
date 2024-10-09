head([H|_],H).
head2(X,Y):- head(X,Y).
tail([_|T],T).
empty([]).

root(t(R,_),R).
children(t(_,C),C).
leaf(t(_,[])).

eqs(X,X).


g(P,A,B) :- call(P,A,B).

higher_order_predicate(g, [2], 2, 1).

