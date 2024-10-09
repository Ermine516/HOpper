head([H|_],H).
tail([_|T],T).
e([]).

member([Y|_],Y).
member([_|T],Y):- member(T,Y).


higher_order_predicate(caselist,[1,3],2,2).
caselist(P,Q,[],Y):- call(P,Y).
caselist(P,Q,[H|T],Y):- call(Q,H,T,Y).


:- begin_tests(lists).   
test(a1) :- f([1],[1]).
test(a2) :- f([1,2],[1]).
test(a3) :- f([1,2,3],[1,2]).
test(a4) :- f([1,2,3,4],[1,2]).
test(a5) :- f([1,2,3,4,5],[1,2,3]).
test(a6) :- f([1,2,3,4,5,6],[1,2,3]).
test(a7) :- f([1,2,3,4,5,6,7],[1,2,3,4]).
test(a8) :- f([],[]).
test(a9,[fail]):- f([],[1]).
test(a10,[fail]):-f([1,2,3,4,5],[1,2]).
:- end_tests(lists).


