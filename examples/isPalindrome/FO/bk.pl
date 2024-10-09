
head([H|_],H).
tail([_|T],T).
empty([]).
front([X],[]). 
front([H|T],[H|Y]):-front(T,Y).

last([Y],Y).
last([_|T],Y):- last(T,Y).

