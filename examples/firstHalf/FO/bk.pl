
cons([H|T],H,T).
head([H|_],H).
tail([_|T],T).
empty([]).
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
any(_).
len([],0).
len(X,Y):- tail(X,Z),len(Z,W),suc(W,Y). 

app(X,Y,Z):- append(X,[Y],Z).


higher_order_predicate(g,[3],3,1).
g(P,X,Y,Z):- call(P,X,Y,Z).


