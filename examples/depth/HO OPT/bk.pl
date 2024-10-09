
head([H|_],H).
tail([_|T],T).
empty([]).
leaf(t(_,[])).
root(t(R,_),R).
children(t(_,C),C). 
suc(A,B) :- integer(A), !, B is A+1.
zero(0).
max(A,B,C):- integer(A),integer(B), !, C is max(A,B).


fold(_,X, [], X).
fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).

higher_order_predicate(fold, [3], 3, 1).
