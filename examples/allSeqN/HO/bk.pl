
less0(X):-integer(X),!,0<X.
head([H|_],H).
head2(X,Y):- head(X,Y).
tail([_|T],T).
tail2(X,Y):- tail(X,Y).
empty([]).

add(A,B,C) :- integer(A), integer(B), !, C is A+B.
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), 0<A,!, B is A-1.
zero(0).

higher_order_predicate(map, [2], 2, 1).
map(_, [], []).
map(P, [H|T], [H2|T2]) :- call(P, H, H2), map(P, T, T2).

%% itKList predicate
higher_order_predicate(ite,[2],3,1).
ite(_,_,0,[]).
ite(P,X,K,[H|T]):- integer(K),0<K, pred(K,R), call(P,X,H) , ite(P,H,R,T).


