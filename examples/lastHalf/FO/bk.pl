head([H|_],H).
tail([_|T],T).
empty([]).

app(X,Y,Z):- append(X,[Y],Z).

last([X],X).
last([_|T],Y):- last(T,Y). 

reverse(X,Y):- empty(Z),fold(rev1,Z,X,Y).
rev1(A,B,C):- head(C,B),tail(C,A).

front(L,Out):-reverse(L,R),tail(R,W),reverse(W,Out).

fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).
fold(_,X, [], X).




