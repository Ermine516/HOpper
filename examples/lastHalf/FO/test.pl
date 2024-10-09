head([H|_],H).
tail([_|T],T).
e([]).
l([H|T],H,T).
app(X,Y,Z):- append(X,[Y],Z).
len([],0).
len(X,Y):- tail(X,Z),len(Z,W), Y is W+1. 

last(X,Y):- len(X,Z), R is Z-1, ite(tail,X,R,W),head(W,Y).

reverse(X,Y):- e(Z),fold(rev1,Z,X,Y).
rev1(A,B,C):- head(C,B),tail(C,A).

front(L,Out):-reverse(L,R),tail(R,W),reverse(W,Out).

fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).
fold(_,X, [], X).

ite(_,X,0,X).
ite(P,X,K,Y):- integer(K), R is K-1, call(P,X,T),ite(P,T,R,Y).


caselist(P,_,[],Y):- call(P,Y).
caselist(P,Q,[H|T],Y):- call(Q,H,T,Y).

caselist_q_a(A,B,C):-caselist(caselist_p_a,caselist_q_a,B,C).
caselist_q_a(A,B,C):-reverse(B,D),reverse(D,C).
caselist_p_a(A):-e(A).
f(A,B):-caselist(caselist_p_a,caselist_q_a,A,B).


:- begin_tests(lists).   
test(a1) :- f([1],[]).
test(a2) :- f([1,2],[2]).
test(a3) :- f([1,2,3],[3]).
test(a4) :- f([1,2,3,4],[3,4]).
test(a5) :- f([1,2,3,4,5],[4,5]).
test(a6) :- f([1,2,3,4,5,6],[4,5,6]).
test(a7) :- f([1,2,3,4,5,6,7],[5,6,7]).
test(a8) :- f([],[]).
test(a9,[fail]):- f([],[1]).
test(a10,[fail]):-f([1,2,3,4,5],[1,2]).
:- end_tests(lists).


