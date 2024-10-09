:- use_module('../../../metagol').

%% metagol settings
body_pred(tail/2).
body_pred(head/2).
body_pred(empty/1).
body_pred(eq/2).
body_pred(member/2).
%% background knowledge

head([H|_],H).
tail([_|T],T).
empty([]).
eq(A,A).


%% metarules

metarule([P,Q,R], [P,A], [[Q,B],[R,A,B]]).
metarule([P,Q,R], [P,A,B,C], [[Q,C,B],[R,C,A]]).
metarule([P,R], [P,_,B,C], [[R,B,C]]):- metagol:type(R,2,head_pred).
metarule([P,Q,R,W], [P,A,B], [[R,Q,W,A,B]]). 

%% interpreted metarules
ibk([caselist,P,_,[],Y],[P,Y]).
ibk([caselist,_,Q,[H|T],Y],[Q,H,T,Y]).


%solution



:-
%% positive examples
  Pos = [
f([1,1,2,3,4],1),
f([1,2,3,2,3],2),
f([1,2,3,2,3],3)
],

%% negative examples
  Neg = [
f([1,1,2,4,5],2),
f([1,2,3,4,5],3)
  ],
 time(learn(Pos,Neg)).


