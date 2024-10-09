head([H|_],H).
tail([_|T],T).
empty([]).
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), A>0 !, B is A-1.
zero(0).
even(X):- integer(X), 0 is X mod 2.



 
