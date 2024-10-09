:-['../../../metagol'].
metagol:timeout(300).


%% background knowledge
add(A,B,C):- integer(A),integer(B),!, C is A+B.
%% metarules

metarule([P,Q], [P,A,B,C],[[Q,A,B,C]]).
metarule([P,Q,F], [P,A,B,C],[[Q,A,B,C,F]]).

body_pred(add/3).


%% interpreted BK
ibk([map,_,[],[],_],[]).
ibk([map,N,[A|As],[B|Bs],F],[[F,N,A,B],[map,N,As,Bs,F]]).

%% Solution

f(A,B,C):-map(A,B,C,add).
% 17,199 inferences, 0.003 CPU in 0.003 seconds (100% CPU, 5579796 Lips)


a:-
    Pos = [
       f(0, [1,2],[1,2]),
       f(1, [1,2],[2,3]),
       f(3,[1,2,4,9],[4,5,7,12]),
       f(2,[5,2,4,9],[7,4,6,11]),
       f(7,[5,2,4,9,3,4,5,4,3],[12,9,11,16,10,11,12,11,10])
    ],
    Neg =[
       f(7,[5,2,4,9,3,4,5,4,3],[5,2,4,9,3,4,5,4,3]),
       f(7,[5,2,4,9,3,4,5,4,3],[6,3,11,10,4,5,6,12,4]),
       f(7,[5,2,4,9,3,4,5,4,3],[13,10,12,17,11,12,13,12,11])
    ],
    learn(Pos,Neg).
:- time(a).
