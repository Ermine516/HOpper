suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),A>0, !, B is A-1.
zero(0).

head([H|_],H).
tail([_|T],T).
empty([]).

app(A,B,C):-append(A,[B],C).

