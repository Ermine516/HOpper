s(A,B) :- integer(A), !, B is A+1.
s(A,B) :- integer(B), !, A is B-1.
z(0).
head([H|_],H).
tail([_|T],T).
e([]).

app(A,B,C):-append(A,[B],C).

ite(P,X,K,W):- integer(K),0<K, s(R,K), call(P,X,H), ite(P,H,R,W).
ite(_,X,0,X).


f(A,B,C):-e(D),app(D,A,E),ite(ite_p_a,E,B,C).
ite_p_a(A,B):-head(A,C),app(A,C,B).

