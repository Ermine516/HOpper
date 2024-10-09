
head([H|_],H).
tail([_|T],T).
empty([]).
any(_).
front([X],[]). 
front([H|T],[H|Y]):-front(T,Y).

last([Y],Y).
last([_|T],Y):- last(T,Y).


higher_order_predicate(condlist,[2],1,1).
condlist(P,[]).
condlist(P,[H|T]):- call(P,H,T).

