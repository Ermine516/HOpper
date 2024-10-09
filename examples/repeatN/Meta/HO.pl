:-['../../../metagol'].

%% background knowledge

suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),A>0, !, B is A-1.
zero(0).
head([H|_],H).
tail([_|T],T).
empty([]).
less0(X):- integer(X),0<X.
app(A,B,C):-append(A,[B],C).


%% metarules
metarule([P,Q], [P,A,B,C], [[Q,A,C,B]]).
metarule([P,Q,R,W], [P,A,B,C], [[Q,D],[R,W,D,B,C,A]]).

%%Background
body_pred(empty/1).
body_pred(head/2).
body_pred(tail/2).
body_pred(app/3).
metagol:timeout(300).
%% interpreted BK
ibk([ite,_,X,0,X],[]).
ibk([ite,P,X,K,W],[[less0,K],[pred,K,R],[P,X,H],[ite,P,H,R,W]]).
ibk([ite2,_,X,0,X,_],[]).
ibk([ite2,P,X,K,W,L],[[less0,K],[pred,K,R],[P,X,H,L],[ite2,P,H,R,W,L]]).


%solution

%f(A,B,C):- empty(D),ite2(f_1,D,B,C,A).
%f_1(A,B,C):-app(A,C,B).
% 18,148 inferences, 0.003 CPU in 0.003 seconds (100% CPU, 5538269 Lips)

a:-
    Pos = [
f([1,2,3],3,[[1,2,3],[1,2,3],[1,2,3]]),
f([[1,2,3],[1,2,3],[1,2,3]],2,[[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]]]),
f([1,2,3,4],4,[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]]),
f([1,2],5,[[1,2],[1,2],[1,2],[1,2],[1,2]]),
f([],2,[[],[]])

    ],
    Neg =[
f([1,2,3,4,5],3,[[1,2,3,4,5]]),
f([1,2,3,4,5],2,[[1,2,3,4,5],[1,2,3,4,5],[1,2,3,4,5]])
],
    learn(Pos,Neg).
:- time(a).
