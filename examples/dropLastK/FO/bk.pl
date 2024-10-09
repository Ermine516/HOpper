
head([H|_],H).
tail([_|T],T).
cons([H|T], H, T).
empty([]).
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
eq(X,X).
reverse(X,Y):- empty(Z),fold(p,Z,X,Y).
p(A,B,C):- head(C,B),tail(C,A).
fold(_,X, [], X).
fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).

higher_order_predicate(g, [2], 2, 1).
g(P,X,Y):- call(P,X,Y).


