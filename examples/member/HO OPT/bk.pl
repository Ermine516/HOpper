
tail([_|T],T).
head([H|_],H).
empty([]).


higher_order_predicate(any,[2],2, 1).
any(P,X,Y):- call(P,X,Y).
any(P,[H|T],Y):- any(P,T,Y).



