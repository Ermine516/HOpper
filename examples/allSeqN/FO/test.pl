%% f(K,L):- z(X), itKList(p1,X,K,R), map(p2,R,W), map(p3,W,L).
%% p1(X,Y):- s(X,Y).
%% p2(X,Y):- z(Z),itKList(p4,Z,X,Y).
%% P3(X,Y):- z(Z), fold(P5,Z,X,Y).
%% P4(X,Y):-  s(X,Y).
%% P5(X,Y,Z):- a(X,Y,Z). 


a(A,B,C) :- integer(A), integer(B), !, C is A+B.
s(A,B) :- integer(A), !, B is A+1.
z(0).

f(A,B):-  z(C),itKList_0(C,A,D), map_0(D,B).
map_0([], []).
map_0([H|T], [H2|T2]) :- z(X), itKList_0(X,H,H2), map_0(T, T2).
itKList_0(_,0,[]).
itKList_0(X,K,[H|T]):-  integer(K),!,0<K, R is K-1, s(X,H), itKList_0(H,R,T),!.


:- begin_tests(lists).   
test(a1) :- f(0,[]).
test(a2) :- f(1,[[1]]).
test(a3) :- f(2,[[1],[1,2]]).
test(a4) :- f(3,[[1],[1,2],[1,2,3]]).
test(a5) :- f(4,[[1],[1,2],[1,2,3],[1,2,3,4]]).
test(a8 ,[fail]) :- f(2,[1,3,4,15,21]).
test(a9 ,[fail]) :- f(5,[1,3,4]).
test(a10 ,[fail]) :- f(6,[1,3,6]).
:- end_tests(lists).

