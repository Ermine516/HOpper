:- use_module('../../../metagol').
metagol:timeout(300).

%% background knowledge

head([H|_],H).
tail([_|T],T).
empty([]).

suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
even(X):- integer(X), 0 is X mod 2.

%% metagol settings

body_pred(head/2).
body_pred(tail/2).
body_pred(suc/2).
body_pred(pred/2).
body_pred(eqs/2).
body_pred(zero/1).
body_pred(even/1).
body_pred(empty/1).

%% metarules

metarule([P,R,W], [P,A], [[R,W,A]]). 

%% interpreted metarules
ibk([all,_,[]],[]).
ibk([all,P,[H|T]],[[P,H],[all,P,T]]).

%% Solution
f(A):-all(even,A).
% 16,892 inferences, 0.003 CPU in 0.003 seconds (100% CPU, 5562306 Lips)


a:-
  %% positive examples
  Pos = [
f([2,4,6,8,10])

  ],
  %% negative examples
  Neg = [
f([2,4,3,8,10])
  ],
 learn(Pos,Neg).

:- time(a).
