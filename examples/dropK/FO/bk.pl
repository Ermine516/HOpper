add(A,B,C) :- integer(A), integer(B), !, C is A+B.
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),A>0, !, B is A-1.
eq(X,X).
zero(0).
con([H|T], H, T).
head([H|_],H).
tail([_|T],T).
empty([]).

