suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
eq(X,X).
less0(X):- integer(X),0<X.
tail([_|T], T).
head([H|_], H).
empty([]).
app(A,B,C):-append(A,[B],C).
