lic([H|T],H,T).

empty([]).

front([X],[]). 
front([H|T],[H|Y]):-front(T,Y).

last([Y],Y).
last([_|T],Y):- last(T,Y).


f(A):-last(A,C),front(A,B),lic(A,C,B).
f(A):-last(A,B),lic(A,B,C),front(C,D),f(D).

