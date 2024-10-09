pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
eq(X,X).

tail([_|T], T).
head([H|_], H).
empty([]).
app(A,B,C):-append(A,[B],C).

ite(_,X,0,X).
ite(P,X,K,W):- integer(K),0<K, pred(K,R), call(P,X,H), ite(P,H,R,W).

less0(X):- integer(X),0<X.

higher_order_predicate(ite,[2],3,1).


