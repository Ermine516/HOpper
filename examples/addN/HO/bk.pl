add(A,B,C) :- integer(A), integer(B), !, C is A+B.
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
eq(X,X).
zero(0).
less0(X):- integer(X),0<X.
cons([H|T], H, T).
cons2([H|T], H, T).
empty([]).


higher_order_predicate(map, [2], 2, 1).
higher_order_predicate(caseint, [2,3],3, 1).

map(_, [], []).
map(P, [H|T], [H2|T2]) :- call(P, H, H2), map(P, T, T2).

caseint(P,_,0,X,Y):- call(P,X,Y).
caseint(_,Q,N,X,Y):- less0(N), pred(N,M),call(Q,M,X,Y).

