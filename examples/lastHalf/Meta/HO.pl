:- use_module('../../../metagol').

metagol:timeout(300).


%% background knowledge
head([H|_],H).
tail([_|T],T).
empty([]).
any([_]).
app(X,Y,Z):- append(X,[Y],Z).

reverse(X,Y):- empty(Z),fold(rev1,Z,X,Y).
rev1(A,B,C):- head(C,B),tail(C,A).

front(L,Out):-reverse(L,R),tail(R,W),reverse(W,Out).

fold(P,Acc,[H|T],Y) :- call(P,Acc, H, W), fold(P,W,T,Y).
fold(_,X, [], X).


%% metagol settings

body_pred(empty/1).
body_pred(any/1).
body_pred(reverse/2).
body_pred(front/2).
body_pred(app/3).

%% metarules
metarule([P,Q,R,W,V,S,L], [P,A,B,C], [[Q,B,D],[R,W,V,S,D,E],[L,E,A,C]]):- metagol:type(R,5,ibk_head_pred). 
metarule([P,Q], [P,A], [[Q,A]]). 
metarule([P,Q,R], [P,A,B], [[Q,A],[R,B]]). 
metarule([P,Q,R,W,V,S], [P,A,B], [[Q,A,C],[R,W,V,S,C,B]]):- metagol:type(R,5,ibk_head_pred). 

%% interpreted metarules
ibk([caselist,P,_,_,[],Y],[[P,Y]]).
ibk([caselist,_,Q,_,[H],Y],[[Q,H,Y]]).
ibk([caselist,_,_,R,[H|T],Y],[[R,H,T,Y]]).



a:-
  %% positive examples
  Pos = [
f([1],[]),
f([1,2],[2]),
f([1,2,3],[3]),
f([1,2,3,4],[3,4]),
f([1,2,3,4,5],[4,5]),
f([1,2,3,4,5,6],[4,5,6]),
f([1,2,3,4,5,6,7],[5,6,7]),
f([],[]),
f([],[1])

  ],
  %% negative examples
  Neg = [
f([],[1]),
f([1,2],[1,2]),
f([1,2,3,4,5],[1,2,3]),
f([1,2,3,4,5],[]),
f([1,2,3,4,5],[1,2,3,4]),
f([1,2,3,4,5],[5,4,3,2,1])
  ],
 learn(Pos,Neg).

:- time(a).
