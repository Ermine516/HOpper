suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), A>0, !, B is A-1.
zero(0).
less0(K):- integer(K),0<K.
eq(X,X).

higher_order_predicate(g,[4],4,1).
higher_order_predicate(h,[3],3,1).

g(P,A,B,C,D):- call(P,A,B,C,D).
h(P,A,B,C):- call(P,A,B,C).



