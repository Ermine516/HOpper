tail([_|T],T).
head([H|_],H).
empty([]).
app(A,B,C):-append(A,[B],C).
    
higher_order_predicate(fold, [3], 3, 1).
fold(_, X, [], X).
fold(P,Acc,[H|T],Y) :- call(P, Acc, H, W), fold(P,W,T,Y).

