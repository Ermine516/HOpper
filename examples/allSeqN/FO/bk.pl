

suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), 0<A,!, B is A-1.
zero(0).
less0(X):-integer(X),!,0<X.
head([H|_],H).
head2(X,Y):- head(X,Y).
tail([_|T],T).
tail2(X,Y):- tail(X,Y).
empty([]).


higher_order_predicate(h,[3],3,1).
h(P,X,Y,Z):- call(P,X,Y,Z).

higher_order_predicate(g,[2],2,1).
g(P,X,Y):- call(P,X,Y).
