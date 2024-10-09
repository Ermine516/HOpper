:-['../../../metagol'].
metagol:timeout(300).

%% background knowledge
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), 0<A, !, B is A-1.
zero(0).
less0(X):- integer(X), 0<X.

%% metarules
metarule([P,Q], [P,A,B],[[Q,A,B]]).
metarule([P,Q], [P,A,B,C],[[Q,A,B,C]]).
metarule([P,Q,R], [P,A,B,C],[[Q,R,A,C,B]]).
metarule([P,Q,R,W], [P,A,B,C],[[Q,D],[R,W,D,A,C,B]]).

%% Predicates in background
body_pred(suc/2).
body_pred(zero/1).

%% interpreted BK

ibk([ite2,_,X,0,X,_],[]).
ibk([ite2,P,X,K,W,D],[[less0,K],[pred,K,R],[P,X,H,D],[ite2,P,H,R,W,D]]).

ibk([ite,_,X,0,X],[]).
ibk([ite,P,X,K,W],[[less0,K],[pred,K,R],[P,X,H],[ite,P,H,R,W]]).

%solution
%f(A,B,C):-zero(D),ite2(f_1,D,A,C,B).
%f_1(A,B,C):-ite(suc,A,C,B).
% 29,669 inferences, 0.005 CPU in 0.005 seconds (100% CPU, 6578536 Lips)


a:-
    Pos = [
        f(1,1,1),
	f(2,2,4),
	f(2,9,18),
	f(3,3,9),
	f(3,7,21),
	f(4,2,8),
	f(4,4,16),
	f(5,5,25),
	f(5,3,15),
	f(6,6,36)
    ],
    Neg =[
	f(1,3,2),
	f(2,5,7),
	f(3,1,4),
	f(4,4,8),
	f(5,10,15),
	f(6,12,24)
    ],
    learn(Pos,Neg).
:- time(a).
