:-['../../../metagol'].
metagol:timeout(300).
f(A,B):-empty(C),fold(C,A,B,f_1).
f_1(A,B,C):-f_2(A,C),head(C,B).
f_2(A,B):-tail(B,A).
% 19,808 inferences, 0.003 CPU in 0.003 seconds (100% CPU, 5774412 Lips)


%% background knowledge

empty([]).
head([H|_],H).
tail([_|T],T).
app(A,B,C):-append(A,[B],C).

%% metarules

metarule([P,Q], [P,A,B], [[Q,B,A]]).
metarule([P,Q,R], [P,A,B,C], [[Q,A,C],[R,C,B]]).
metarule([P,Q,R,W], [P,A,B], [[Q,C],[R,C,A,B,W]]).
body_pred(empty/1).
body_pred(head/2).
body_pred(tail/2).
body_pred(app/3).

%% interpreted BK
ibk([fold,X,[],X,_],[]).
ibk([fold,Acc,[H|T],X,F],[[F,Acc,H,Y],[fold,Y,T,X,F]]).

%solution

%f(A,B):-empty(C),fold(C,A,B,f_1).
%f_1(A,B,C):-f_2(A,C),head(C,B).
%f_2(A,B):-tail(B,A).
a:-
    Pos = [
f([1,2,3,4],[4,3,2,1]),
f([1,2,3,4,1],[1,4,3,2,1]),
f([a,b,c],[c,b,a]),
f([a,b,c,d,e,f],[f,e,d,c,b,a])

    ],
    Neg =[
f([a,b,c],[a,b,c]),
f([a,b,c],[]),
f([a,b],[a]),
f([a,b,c],[b,c]),
f([1,2,3,4],[1,4,3,2])
],
    learn(Pos,Neg).
:- time(a).
