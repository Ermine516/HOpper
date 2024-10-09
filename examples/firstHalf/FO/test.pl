head([H|_],H).
tail([_|T],T).
l([H|T],H,T).
sing(X):- tail(X,Y),e(Y).
e([]).
s(A,B) :- integer(A), !, B is A+1.
s(A,B) :- integer(B), !, A is B-1.
z(0).

len([],0).
len(X,Y):- tail(X,Z),len(Z,W),s(W,Y). 


lenh(X,Y):- tail(X,Z),tail(Z,R),lenh(R,W),s(W,Y). 
lenh(_,0).


reverse(X,Y):- e(Z),fold(rev1,Z,X,Y).
rev1(A,B,C):- head(C,B),tail(C,A).

last(L,Out):-fold(p,_,L,Out).
p(_,Y,Y).

front(L,Out):-reverse(L,R),tail(R,W),reverse(W,Out).

app(X,Y,Z):- append(X,[Y],Z).

fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).
fold(_,X, [], X).

ite(_,_,_,0,[]).
ite(P,Q,X,K,[H|T]):- call(P,K,R), call(Q,X,H,W),ite(P,Q,W,R,T).

try(P,_,X,Y):- call(P,X,Y).
try(_,Q,X,Y):- call(Q,X,Y).

%f(A,B):-len(A,C),ite(ite_p_a,ite_q_a,A,C,B).
%ite_p_a(A,B):-try(try_p_a,try_q_a,A,B).
%ite_q_a(A,B,C):- l(A,B,C).
%try_p_a(A,B):- s(Y,A),s(B,Y).
%try_q_a(A,B):- s(B,A).

f(A,B):-len(A,C),ite(ite_p_a,ite_q_a,A,C,B).
ite_q_a(A,B,C):-l(A,C,B).
ite_p_a(A,B):-try(try_p_a,try_q_a,A,B).
try_q_a(A,B):-s(B,A).
try_p_a(A,B):-s(C,A),s(B,C).


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


