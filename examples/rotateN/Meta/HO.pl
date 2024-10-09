:-['../../../metagol'].

metagol:timeout(300).



%% background knowledge
suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
eqs(X,X).
less0(X):- integer(X),0<X.
tail([_|T], T).
head([H|_], H).
empty([]).
app(A,B,C):-append(A,[B],C).

%% metarules
metarule([P,Q,R,W], [P,A,B],[[Q,A,C],[R,A,D],[W,C,D,B]]).
metarule([P,Q,R], [P,A,B,C],[[Q,R,B,A,C]]).

%% Predicates in background


body_pred(suc/2).
body_pred(pred/2).
body_pred(head/2).
body_pred(tail/2).
body_pred(empty/1).
body_pred(zero/1).
body_pred(eqs/2).
body_pred(app/3).

%% interpreted BK

ibk([ite,_,X,0,X],[]).
ibk([ite,P,X,K,W],[[less0,K],[pred,K,R],[P,X,H],[ite,P,H,R,W]]).


%solution
f(A,B,C):-ite(f_1,B,A,C).
f_1(A,B):-tail(A,C),head(A,D),app(C,D,B).
% 18,739 inferences, 0.003 CPU in 0.003 seconds (100% CPU, 5684992 Lips)


a:-
    Pos = [
 f(1,[1,2,3],[2,3,1]),
f(0,[1,2,3],[1,2,3]),
f(3,[1,2,3],[1,2,3]),
f(3,[1,2,3,4],[4,1,2,3]),
f(7,[1,2,3,4],[4,1,2,3]),
f(4,[1,2,3,4],[1,2,3,4])
    ],
    Neg =[
	f(4,[1,2,3,4,5],[4,5,1,2,3]),
f(2,[1,2,3,4,5],[5,1,2,3,4])

    ],
    learn(Pos,Neg).
:- time(a).
