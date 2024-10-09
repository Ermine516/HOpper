
head([H|_],H).
tail([_|T],T).
empty([]).
leaf(t(_,[])).
root(t(R,_),R).
children(t(_,C),C). 
suc(A,B) :- integer(A), !, B is A+1.
zero(0).
eq(X,X).
max(A,B,C):- integer(A),integer(B), !, C is max(A,B).

higher_order_predicate(g, [3], 3, 1).
g(P,X,Y,Z):- call(P,X,Y,Z).

