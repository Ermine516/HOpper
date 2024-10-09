:- use_module('../../../metagol').
metagol:timeout(300).
%% metagol settings
body_pred(cons/3).
body_pred(empty/1).
body_pred(suc/2).
body_pred(zero/1).

%% background knowledge

suc(A,B) :- integer(A), !, B is A+1.
pred(0,0).
pred(A,B) :- integer(A), A>0, !, B is A-1.
zero(0).
cons([H|T],H,T).
empty([]).



%% metarules
metarule([P,Q], [P,A], [[Q,A]]). 
metarule([P,Q,R], [P,A], [[Q,B],[R,B,A]]). 
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]). 
metarule([P,Q,R,W,V], [P,A], [[Q,A,B,C],[R,W,V,B],[P,C]]). 

%% interpreted metarules
ibk([try,X,_,A],[[X,A]]).
ibk([try,_,Y,A],[[Y,A]]).

%% Solution Not found by Metagol
%f(A):- empty(A).
%f(A):- cons(A,B,C),try(f_1,f_2,B),f(C).
%f_1(A):- zero(B),suc(B,A)
%f_2(A):-z(B),f_3(B,A).
%f_3(A,B):-suc(A,C),suc(C,B).




:-
  %% positive examples
  Pos = [
 f([]),
f([1,1]),
f([2,1]),
f([1,2]),
f([2]),
f([2,2]),
f([2,2,2]),
f([2,2,2,2]),
f([2,1,1,2])
  ],
  %% negative examples
  Neg = [
f([0,1]),
f([1,0]),
f([0,2]),
f([2,0]),
f([1,3]),
f([3,1])
  ],
 time(learn(Pos,Neg)).


