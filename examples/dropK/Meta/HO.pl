:- use_module('../../../metagol').
metagol:timeout(300).

%% background knowledge

suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),A>0, !, B is A-1.
eqs(X,X).
zero(0).

less0(X):- 0<X.

head([H|_],H).
tail([_|T],T).
empty([]).

%% metagol settings

body_pred(head/2).
body_pred(tail/2).
body_pred(suc/2).
body_pred(pred/2).
body_pred(eqs/2).
body_pred(zero/1).
body_pred(empty/1).

%% metarules
metarule([P,R], [P,A,B], [[R,A,B]]). 
metarule([P,R,W], [P,A,B,C], [[R,W,B,A,C]]). 

%% interpreted metarules
ibk([ite,_,_,0,[]],[]).
ibk([ite,P,X,K,[H|T]],[[less0,K],[pred,K,R],[P,X,H],[ite,P,H,R,T]]).


%% Solution


a:-
  %% positive examples
  Pos = [
f(3,[1,2,3,4,5],[4,5]),
f(1,[1,2,3,4,5],[2,3,4,5]),
f(0,[1,2,3,4,5],[1,2,3,4,5])
  ],
  %% negative examples
  Neg = [
f(1,[1,2,3,4,5],[1,2,3,4,5]),
f(1,[1,2,3,4,5],[1,2,3])
  ],
 learn(Pos,Neg).

:- time(a).
