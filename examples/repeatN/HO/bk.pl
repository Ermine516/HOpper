suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),A>0, !, B is A-1.
zero(0).

head([H|_],H).
tail([_|T],T).
empty([]).

app(A,B,C):-append(A,[B],C).

ite(_,X,0,X).
ite(P,X,K,W):- integer(K),0<K,!, pred(K,R), call(P,X,H), ite(P,H,R,W).


:- more_context_predicate(ite, 1, 3, 1).
higher_order_predicate(ite,[2],3,1).
higher_order_predicate(ite,[3],4,1).
