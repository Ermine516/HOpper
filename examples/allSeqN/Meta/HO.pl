:-['../../../metagol'].
metagol:timeout(300).

%% background knowledge
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), A>0, !, B is A-1.
zero(0).
less0(X):-integer(X),!, 0<X.


%% metarules

metarule([P,Q], [P,A],[[Q,A]]).
metarule([P,Q], [P,A,B],[[Q,A,B]]).
metarule([P,Q,R], [P,A,B,C],[[R,Q,A,B,C]]).
metarule([P,Q,R,W,V], [P,A,B,C],[[R,Q,A,B,D],[W,V,D,C]]).
metarule([P,Q,R], [P,A,B],[[Q,C],[R,C,A,B]]).

%% Predicates in background
body_pred(suc/2).
body_pred(pred/2).
body_pred(zero/1).

%% interpreted BK
ibk([map,_,[],[]],[]).
ibk([map,P,[H|T],[H1|T1]],[[P,H,H1],[map,P,T,T1]]).

ibk([ite,_,_,0,[]],[]).
ibk([ite,P,X,K,[H|T]],[[integer,K],[less0,K],[pred,K,R],[P,X,H],[ite,P,H,R,T]]).

%solution
%f(A,B):-zero(C),f_1(C,A,B).
%f_1(A,B,C):-ite(suc,A,B,D),map(f_2,D,C).
%f_2(A,B):-zero(C),f_3(C,A,B).
%f_3(A,B,C):-ite(suc,A,B,C).
% 37,650 inferences, 0.007 CPU in 0.007 seconds (100% CPU, 5715951 Lips)


a:-
    Pos = [
        f(0,[]),
	f(1,[[1]]),
	f(2,[[1],[1,2]]),
	f(3,[[1],[1,2],[1,2,3]]),
	f(4,[[1],[1,2],[1,2,3],[1,2,3,4]])
    ],
    Neg =[
	f(2,[1,3,4,15,21]),
	f(5,[1,3,4]),
	f(6,[1,3,6])
    ],
    learn(Pos,Neg).
:- time(a).
