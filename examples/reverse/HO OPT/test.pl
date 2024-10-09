tail([_|T],T).
head([H|_],H).
empty([]).
my_append(A,B,C):-append(A,[B],C).
fold_p_a(A,B,C):- head(C,B),tail(C,A).

fold1(X, [], X).
fold1(acc,[H|T],Y) :- fold_p_a(acc, H, W), fold1(W,T,Y).

