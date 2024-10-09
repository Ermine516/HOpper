:-['../../../metagol'].
metagol:timeout(300).


%% background knowledge
root(t(R,_),R).
children(t(_,C),C).
leaf(t(_,[])).
eqs(X,X).
%% metarules

metarule([P,Q], [P,A,B],[[Q,A,B]]).
metarule([P,Q,F], [P,A,B],[[Q,A,C],[F,C,B]]).
metarule([P,Q,F], [P,A,B],[[Q,F,A,B]]).


body_pred(root/2).
body_pred(children/2).
body_pred(leaf/1).
body_pred(eqs/2).

%% interpreted BK
ibk([any,P,[H|_],A],[[P,H,A]]).
ibk([any,P,[_|T],A],[[any,P,T,A]]):- metagol:type(P,2,head_pred).

%solution
%f(A,B):-eqs(A,B).
%f(A,B):-children(A,C),f_1(C,B).
%f_1(A,B):-any(f,A,B).
% 32,853 inferences, 0.005 CPU in 0.005 seconds (100% CPU, 6070772 Lips)


a:-
    Pos = [
      f(t(9,[t(6,[t(8,[])]),t(9,[])]),t(9,[t(6,[t(8,[])]),t(9,[])])),
      f(t(9,[t(6,[t(8,[])]),t(9,[])]),t(9,[])),
      f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),t(7,[t(5,[]),t(2,[]),t(7,[])])),
      f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])),
      f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),t(9,[t(6,[]),t(0,[])])),
      f(t(3,[t(2,[t(4,[t(5,[])])])]),t(5,[])),
      f(t(3,[t(2,[t(4,[t(5,[t(3,[t(2,[t(4,[t(5,[])])])])])])])]),t(5,[]))
    ],
    Neg =[
       f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),t(9,[t(6,[]),t(4,[])])),
       f(t(3,[t(6,[t(1,[])]),t(10,[t(4,[]),t(8,[]),t(4,[])]),t(3,[t(1,[]),t(9,[]),t(9,[]),t(2,[])]),t(6,[t(10,[])])]),t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]))
    ],
    learn(Pos,Neg).
:- time(a).
