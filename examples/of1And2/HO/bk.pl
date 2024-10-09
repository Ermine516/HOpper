
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), A>0, !, B is A-1.
zero(0).

cons([H|T],H,T).

empty([]).

higher_order_predicate(try, [1,1], 1, 1).
try(P,_, X) :- call(P, X).
try(_,Q, X) :- call(Q, X).

