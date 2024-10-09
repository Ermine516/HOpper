s(A,B) :- integer(A), !, B is A+1.
s(A,B) :- integer(B), !, A is B-1.
z(0).

isThree(X) :- X is 3.


l([H|T], H, T).
e([]).
app(A,B,C):-append(A,[B],C).

ite(_,X,0,X).
ite(P,X,K,W):- integer(K),0<K, s(R,K), call(P,X,H), ite(P,H,R,W).




f(X,Y,Z):- ite(p,Y,X,Z).
p(X,Y):- l(X,H,T),app(T,H,Y).
