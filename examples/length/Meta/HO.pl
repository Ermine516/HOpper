:- use_module('../../../metagol').

metagol:timeout(300).
%% background knowledge
tail([_|T],T).
head([H|_],H).
empty([]).
zero(0).
one(1).
any(_).
suc(X,Y):- integer(X),!, Y is X+1.
%% metagol settings

body_pred(tail/2).
body_pred(head/2).
body_pred(suc/2).
body_pred(empty/1).
body_pred(zero/1).
body_pred(any/1).
body_pred(one/1).

%% metarules
metarule([P,Q], [P,A,_,C], [[Q,A,C]]). 
metarule([P,Q,R,W], [P,A,B], [[Q,C],[R,W,C,A,B]]). 

%% interpreted metarules

ibk([fold,_,X,[],X],[]).
ibk([fold,P,X,[H|T],Y],[[P,X,H,Z],[fold,P,Z,T,Y]]).



a:-
  %% positive examples
  Pos = [
f([3,3,1],3),
f([4],1),
f([4,3],2),
f([4,3,2,2,3,5,2,7],8)

  ],
  %% negative examples
  Neg = [
f([3,3,1],2),
f([4],0),
f([4],2)
  ],
 learn(Pos,Neg).

:- time(a).
