:-['../../../metagol'].
metagol:timeout(300).
%% background knowledge


head([H|_],H).
tail([_|T],T).
empty([]).
any(_).
front([_],[]). 
front([H|T],[H|Y]):-front(T,Y).

last([Y],Y).
last([_|T],Y):- last(T,Y).


%% metarules
metarule([P,Q,R], [P,A,B], [[Q,A],[R,B]]).
metarule([P,Q,R,W], [P,A,B], [[Q,B,A],[R,B,C],[W,C]]):- metagol:type(W,1,head_pred).
metarule([P,Q,R], [P,A], [[Q,R,A]]).

%%Background
body_pred(empty/1).
body_pred(head/2).
body_pred(tail/2).
body_pred(front/2).
body_pred(last/2).
body_pred(any/1).

%% interpreted BK

ibk([condlist,_,[]],[]).
ibk([condlist,P,[H|T]],[[P,H,T]]).

%solution

%f(A):- condlist(f_1,A).
%f_1(A,B):- any(A), empty(B).
%f_1(A,B):- last(B,A),front(B,C),condlist_a(C).

a:-
    Pos = [
f([1,1,2,1,1]),
f([1,2,1]),
f([1,1]),
f([1]),
f([]),
f([1,2,2,1]),
f([1,1,2,3,2,1,1]),
f([1,1,2,3,3,3,2,1,1]),
f([1,1,2,3,3,4,3,3,2,1,1]),
f([1,1,2,3,3,4,4,3,3,2,1,1]),
f([1,1,2,3,3,4,1,1,2,3,3,4,4,3,3,2,1,1,4,3,3,2,1,1])

    ],
    Neg =[
f([1,2,3,4,1]),
f([1,2,4,3,3,2,1])
],
    learn(Pos,Neg).
:- time(a).
