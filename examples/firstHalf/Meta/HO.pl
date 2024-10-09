:- use_module('../../../metagol').

%% metagol settings
body_pred(tail/2).
body_pred(head/2).
body_pred(empty/1).
body_pred(suc/2).
body_pred(pred/2).
body_pred(zero/1).
body_pred(len/2).
%% background knowledge

head([H|_],H).

tail([_|T],T).

empty([]).

suc(A,B) :- integer(A), !, B is A+1.

pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.

zero(0).

len([],0).
len(X,Y):- tail(X,Z),len(Z,W),suc(W,Y). 


%% metarules


metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]). % chain rule
metarule([P,Q,R,W], [P,A,B], [[Q,A,C],[R,A,C,B,W]]). % ternary intro rule

%% interpreted metarules

ibk([ite,_,0,[],_],[]).
ibk([ite,[H|W],K,[H|T],P],[[P,K,R],[ite,W,R,T,P]]).


%solution
%f(A,B):-len(A,C),ite(A,C,B,f_1).
%f_1(A,B):-pred(A,C),pred(C,B).
% 36,269 inferences, 0.006 CPU in 0.006 seconds (100% CPU, 6062689 Lips)


:-
%% positive examples
  Pos = [
f([1],[1]),
f([1,2],[1]),
f([1,2,3],[1,2]),
f([1,2,3,4],[1,2]),
f([1,2,3,4,5],[1,2,3]),
f([1,2,3,4,5,6],[1,2,3]),
f([1,2,3,4,5,6,7],[1,2,3,4]),
f([],[])
],

%% negative examples
  Neg = [
f([],[1]),
f([1,2,3,4,5],[1,2])
  ],
 time(learn(Pos,Neg)).


