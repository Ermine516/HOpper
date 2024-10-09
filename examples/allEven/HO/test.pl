
head([H|_],H).
tail([_|T],T).
empty([]).
s(A,B) :- integer(A), !, B is A+1.
s(A,B) :- integer(B), !, A is B-1.
z(0).
even(X):- integer(X), 0 is X mod 2.

myall(_,[]). 
myall(P,[H|T]):- call(P,H),myall(P,T). 


