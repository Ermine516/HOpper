head([H|_],H).
tail([_|T],T).
empty([]).

eq(A, A).

higher_order_predicate(caselist,[1,3],2,1).
caselist(P,Q,[],Y):- call(P,Y).
caselist(P,Q,[H|T],Y):- call(Q,H,T,Y).
