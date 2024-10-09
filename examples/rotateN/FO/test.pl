suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
eqs(X,X).
less0(X):- integer(X),0<X.
tail([_|T], T).
head([H|_], H).
empty([]).
app(A,B,C):-append(A,[B],C).



f(A,B,C):-eqs(B,C),zero(A).
f(A,B,C):-less0(X),pred(A,G),head(B,D),tail(B,E),app(E,D,F),print(p(G,F,C)),f(G,F,C).

