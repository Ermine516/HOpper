
%List Predicates
head([H|_],H).
tail([_|T],T).
empty([]).

%Integer Predicates
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
even(X):- integer(X), 0 is X mod 2.


%Higher-order Predicates
all(_,[]). 
all(P,[H|T]):- call(P,H),all(P,T). 

%Higher-order declarations
higher_order_predicate(all,[1],1,1).
