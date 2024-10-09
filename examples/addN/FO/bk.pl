add(A,B,C) :- integer(A), integer(B), !, C is A+B.
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
eq(X,X).
zero(0).
less0(X):- integer(X),0<X.
cons([H|T], H, T).
cons2([H|T], H, T).
empty([]).

higher_order_predicate(g, [2], 2, 1).
g(P,X,Y):- call(P,X,Y).




