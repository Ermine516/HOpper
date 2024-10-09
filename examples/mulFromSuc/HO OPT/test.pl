suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), A>0, !, B is A-1.
zero(0).

ite(_,X,0,X).
ite(P,X,K,W):- integer(K), 0<K,!, pred(K,R), call(P,X,H), ite(P,H,R,W).

ite(_,X,0,X,_).
ite(P,X,K,W,N):- integer(K), 0<K,!,pred(K,R), call(P,X,H,N), ite(P,H,R,W,N).

f(A,B,C):-zero(D),ite(ite_p_a,D,A,C,B).
ite_p_a(A,B,C):-ite(ite_p_a,A,C,B).
ite_p_a(A,B):-suc(A,B).


