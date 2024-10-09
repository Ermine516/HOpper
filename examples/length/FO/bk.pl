tail([_|T],T).
head([H|_],H).
empty([]).
suc(A,B):- integer(A),!, B is A+1.
zero(0).
