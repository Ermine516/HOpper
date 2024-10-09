head([H|_],H).
tail([_|T],T).
empty([]).
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
cons([H|T],H,T).
len([],0).
len(X,Y):- tail(X,Z),len(Z,W),suc(W,Y). 

app(X,Y,Z):- append(X,[Y],Z).

higher_order_predicate(ite,[2,3],3,1).
ite(_,_,_,0,[]).
ite(P,Q,X,K,[H|T]):- integer(K), call(P,K,R), call(Q,X,H,W),ite(P,Q,W,R,T).

