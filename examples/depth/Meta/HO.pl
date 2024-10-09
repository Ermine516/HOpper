:-['../../../metagol'].
metagol:timeout(300).

%% background knowledge
root(t(R,_),R).
children(t(_,C),C).
leaf(t(_,[])).
eqs(X,X).
suc(A,B) :- integer(A), !, B is A+1.
zero(0).
max(A,B,C):- integer(A),integer(B), !, C is max(A,B).
%% metarules

% Finds solution when we use the following Metarules
%metarule([P,Q,R],[P,A,B,C],[[Q,B,D],[R,A,D,C]]):- metagol:type(Q,2,head_pred).
%metarule([P,Q,R,F,W,Z], [P,A,B],[[Z,C],[Q,A,D],[R,F,C,D,E],[W,E,B]]).

% Finds solution When using the following Metarules
%metarule([P,Q,R],[P,A,B,C],[[Q,B,D],[R,A,D,C]]):- metagol:type(Q,2,head_pred).
%metarule([P,Q,R,F], [P,A,B],[[R,C],[Q,F,C,A,B]]).
%metarule([P,Q,R], [P,A,B],[[Q,A,C],[R,C,B]]).

% Finds solution when using the following Metarules
metarule([Q,R],[f_4,A,B,C],[[Q,B,D],[R,A,D,C]]):- metagol:type(Q,2,head_pred).
metarule([Q,F], [f_3,A,B,C],[[Q,F,A,B,C]]).
metarule([P,Q,R], [P,A,B],[[R,C],[Q,C,A,B]]).
metarule([P,Q,R], [P,A,B],[[Q,A,C],[R,C,B]]).


body_pred(children/2).
body_pred(zero/1).
body_pred(suc/2).
body_pred(max/3).
%% interpreted BK
ibk([fold,_,X,[],X],[]).
ibk([fold,P,X,[H|T],Y],[[P,X,H,Z],[fold,P,Z,T,Y]]).

%solution
% f(A,B):- f_1(A,C,D), f_2(F,C,D,B).
% f_1(A,B,C):- zero(B), children(A,C).
% f_2(F,A,B,C):- fold(f_3,A,B,D), suc(D,C).
% f_3(A,B,C):- f(B,D), max(A,D,C).

a:-
    Pos = [
      f(t(9,[t(6,[t(8,[])]),t(9,[])]),3),
      f(t(8,[t(1,[]),t(5,[t(9,[])]),t(7,[t(5,[]),t(2,[]),t(7,[])])]),3),
      f(t(7,[t(6,[]),t(7,[t(6,[]),t(4,[]),t(7,[]),t(1,[])]),t(9,[t(6,[]),t(7,[]),t(5,[]),t(2,[])])]),3),
f(t(9,[t(3,[]),t(10,[]),t(7,[]),t(9,[])]),2),
f(t(6,[t(0,[t(4,[])]),t(8,[t(8,[]),t(8,[])]),t(1,[t(6,[])]),t(4,[])]),3),
f(t(10,[]),1),
f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),3)
    ],
    Neg =[
       f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),2),
f(t(3,[t(2,[]),t(9,[t(6,[]),t(0,[])]),t(4,[])]),1),
f(t(3,[t(6,[t(1,[])]),t(10,[t(4,[]),t(8,[]),t(4,[])]),t(3,[t(1,[]),t(9,[]),t(9,[]),t(2,[])]),t(6,[t(10,[])])]),5),
f(t(9,[t(6,[t(8,[])]),t(9,[])]),0)
    ],
    learn(Pos,Neg).
:- time(a).
