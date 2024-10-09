suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),A>0, !, B is A-1.
eq(X,X).
zero(0).
con([H|T], H, T).
head([H|_],H).
tail([_|T],T).
empty([]).


ite(_,X,0,X).
ite(P,X,K,W):- integer(K),0<K, pred(K,R), call(P,X,H), ite(P,H,R,W).


higher_order_predicate(ite,[2],3,1).
