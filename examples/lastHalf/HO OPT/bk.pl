head([H|_],H).
tail([_|T],T).
empty([]).
l([H|T],H,T).
any(X).
app(X,Y,Z):- append(X,[Y],Z).
len([],0).
len(X,Y):- tail(X,Z),len(Z,W), Y is W+1. 

last([X],X).
last([_|T],Y):- last(T,Y). 

reverse(X,Y):- empty(Z),fold(rev1,Z,X,Y).
rev1(A,B,C):- head(C,B),tail(C,A).

front(L,Out):-reverse(L,R),tail(R,W),reverse(W,Out).

fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).
fold(_,X, [], X).

higher_order_predicate(caselist,[1,2,3],2,1).
caselist(P,Q,R,[],Y):- call(P,Y).
caselist(P,Q,R,[H],Y):- call(Q,H,Y).
caselist(P,Q,R,[H|T],Y):- call(R,H,T,Y).


