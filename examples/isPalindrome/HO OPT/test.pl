
head([H|_],H).
tail([_|T],T).
lic([H|T],H,T).
front(X,[]):- tail(X,[]). 
front(X,[H|Y]):- head(X, H), tail(X , T), front(T,Y).

last([Y],Y).
last([_|T],Y):- last(T,Y).


e([]).
app(A,B,C):-append(A,[B],C).

checklist(P,[]).
checklist(P,[H|T]):- call(P,H,T).



checklist_p_a(A,B):-e(B).
checklist_p_a(A,B):-front(B,T),last(B,A),checklist(checklist_p_a,T).
f(A):-checklist(checklist_p_a,A).

