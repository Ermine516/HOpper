:- use_module('../../../metagol').
metagol:timeout(300).

%% background knowledge


tail([_|T],T).
head([H|_],H).

empty([]).
eq(X,X).

%% metagol settings

body_pred(tail/2).
body_pred(head/2).
body_pred(eq/2).
body_pred(empty1).

%% metarules
metarule([P,Q,R,W], [P,A,B], [[Q,C],[R,C,A,B,W]]). 
metarule([P,R,W], [P,A,B], [[R,W,A,B]]). 

%% interpreted metarules

ibk([any,P,X,Y],[[P,X,Y]]).
ibk([any,P,[_|T],Y],[[any,P,T,Y]]).



a:-
  %% positive examples
  Pos = [
f([7, 11, 12, 14, 22, 28, 39, 40, 43, 45, 48, 51, 52, 60, 70, 85, 95, 98, 99],40),
f([57, 98],57),
f([7, 11, 14, 17, 22, 22, 22, 33, 41, 50, 74, 78, 90, 93, 96, 98],33),
f([2, 6, 8, 15, 20, 24, 25, 26, 28, 29, 35, 37, 41, 49, 50, 52, 57, 60, 61, 62, 64, 66, 66, 70, 71, 85, 88, 95, 99, 100],20)
  ],
  %% negative examples
  Neg = [
f([74, 2, 37, 50, 84, 7, 42, 45, 43, 36, 38, 45],46),
f([53, 15, 71, 57, 30, 92, 63, 69, 31, 18, 10, 38, 45, 25, 36, 75, 35, 10, 16, 21, 42, 57, 9, 16, 35, 10, 94],0),
f([64,63,63,63,63,63],65)
  ],
 learn(Pos,Neg).

:- time(a).
