tail([_|T],T).
head([H|_],H).
empty([]).
app(A,B,C):- append(A,[B],C).
