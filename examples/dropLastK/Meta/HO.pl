:-['../../../metagol'].

tail([_|T],T).
pred(0,0).
pred(A,B) :- integer(A),0<A, !, B is A-1.
zero(0).
eqs(X,X).

%% metarules

metarule([P,Q,R], [P,A,B,C], [[Q,A],[R,B,C]]).
metarule([P,Q,R,F,W], [P,A,B,C], [[R,A,D],[Q,B,E,F],[W,D,E,C]]):- metagol:type(W,3,head_pred).
metarule([P,Q,R],[P,A,B],[[Q,A,C],[R,C,B]]).


body_pred(pred,2).
body_pred(eqs,2).
body_pred(zero,1).
body_pred(tail,2).
body_pred(reverse,2).

%% interpreted BK
ibk([map2,[],[],_],[]).
ibk([map2,[A|As],[B|Bs],F],[[F,A,B],[map2,As,Bs,F]]).


a:-
    Pos = [
      f(0,[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]],[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]]),	
      f(1,[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]],[[1,2,3],[1,2,3],[1,2,3],[1,2,3]]),
      f(0,[[a,b,c],[a,b,c],[a,b,c]],[[a,b,c],[a,b,c],[a,b,c]]),
      f(2,[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]],[[1,2],[1,2],[1,2],[1,2]]),
      f(1,[[1,2,3],[1,2,3,4],[1,2],[1,2,3,4,5]],[[1,2],[1,2,3],[1],[1,2,3,4]]),
      f(2,[[1,2,3],[1,2,3,4],[1,2],[1,2,3,4,5]],[[1],[1,2],[],[1,2,3]])
    ],
    Neg =[
      f(1,[[a,b,c],[a,b,c],[a,b,c]],[[a,b,c],[a,b,c],[a,b,c]]),
      f(2,[[a,b,c],[a,b,c],[a,b,c]],[[a,b,c],[a,b,c],[a,b,c]]),
      f(1,[[a],[b,b],[c]],[[],[],[]])
    ],
    learn(Pos,Neg).
:- time(a).
