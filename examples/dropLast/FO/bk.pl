
head([H|_],H).
tail([_|T],T).
empty([]).
cons([H|T],H,T).

reverse(X,Y):- empty(Z),fold(p,Z,X,Y).
p(A,B,C):- head(C,B),tail(C,A).
fold(_,X, [], X).
fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).

