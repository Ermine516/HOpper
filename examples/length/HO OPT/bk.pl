tail([_|T],T).
head([H|_],H).
empty([]).
suc(A,B):- integer(A),!, B is A+1.
zero(0).
one(1).

higher_order_predicate(fold,[3],3,1).
fold(_,X, [], X).
fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).
