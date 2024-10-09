head([H|_],H).
tail([_|T],T).
empty([]).

root(t(R,_),R).
children(t(_,C),C).
leaf(t(R,[])).

eqs(X,X).


any(P,[H|_],A) :- call(P,H,A).
any(P,[_|T],A) :- any(P,T,A). 


f(A,B):-children(A,D),tail(B,E),print(p(D,E)),any(any_p_a,D,E),head(B,C),root(A,C).
any_p_a(A,B):-.
any_p_a(A,B):-f(A,B).

:- begin_tests(lists).   
test(a2) :- f(t(9,[t(6,[t(8,[])]),t(9,[])]),[9,6,8]).
test(a3) :- f(t(9,[t(6,[t(8,[])]),t(9,[])]),[9,9]).
test(a4) :- f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),[8,1]).
test(a5) :- f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),[8,5,9]).
test(a6) :- f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),[8,7,5]).
test(a7) :- f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),[8,7,2]).
test(a8) :- f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),[8,7,7]).
test(a9) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,6]).
test(a10) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,7,6]).
test(a11) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,7,4]).
test(a12) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,7,7]).
test(a13) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,7,1]).
test(a14) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,9,6]).
test(a15) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,9,7]).
test(a16) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,9,5]).
test(a17) :- f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),[7,9,2]).
test(a18) :- f(t(9,[t(3,[]),t(10,[]),t(7,[]),t(9,[])]),[9,3]).
test(a19) :- f(t(9,[t(3,[]),t(10,[]),t(7,[]),t(9,[])]),[9,10]).

test(a44,[fail]) :- f([],[]).
test(a45,[fail]):- f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),[3,2,9]).
test(a46,[fail]):- f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),[3,0]).
test(a47,[fail]):- f(t(3,[t(6,[t(1,[])]),t(10,[t(4,[]),t(8,[]),t(4,[])]),t(3,[t(1,[]),t(9,[]),t(9,[]),t(2,[])]),t(6,[t(10,[])])]),[3,6,2]).
test(a47,[fail]):- f(t(9,[t(6,[t(8,[])]),t(9,[])]),[]).

:- end_tests(lists).


%f(t(6,[t(1,[])]),[6,2]).
%f(t(10,[t(4,[]),t(8,[]),t(4,[])]),[6,2]).
%f(t(3,[t(1,[]),t(9,[]),t(9,[]),t(2,[])]),t(6,[t(10,[])]),[6,2]).



