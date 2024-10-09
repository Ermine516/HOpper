root(t(R,_),R).
children(t(_,C),C).
leaf(t(_,[])).
eqs(X,X).

any(P,[H|_],A) :- call(P,H,A).
any(P,[_|T],A) :- any(P,T,A). 

f(A,B):-f_1(A,C),f_1(C,B).
f_1(A,B):-f_2(A,C),f_2(C,B).
f_2(A,B):-f_3(A,C),f_3(C,B).
f_3(A,B):-eqs(A,B).
f_3(A,B):-children(A,C),f_4(C,B).
f_4(A,B):-any(eqs,A,B).
