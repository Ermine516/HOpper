:-['../../../metagol'].
metagol:timeout(300).
%f(A):-zero(B),fold(f_1,B,A,C).
%f_1(A,B,C):-decrement(B,C),geq(C,A).
% 26,723 inferences, 0.005 CPU in 0.005 seconds (100% CPU, 5866236 Lips)




%% background knowledge
is_list([]).
is_list([_|_]).

increment(A,B):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    succ(A,B).

decrement(A,B):- 
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    succ(B,A).

my_length(A,B):-
    (nonvar(A) -> is_list(A); true),
    (nonvar(B) -> \+is_list(B); true),
    length(A,B).

cons(A,B,C):-
    append([A],B,C).
comps([H|T],H,T).

tail([_|T],T).
head([H|_],H).
sum(A,B,C):-
    C is A+B.
empty([]).

element([X|_],X):-!.
element([_|T],X):-
    element(T,X).

empty_in([]).
empty_out([]).

zero(0).
one(1).

eq(X,X).

gt(A,B):-
    nonvar(A),
    nonvar(B),
    \+is_list(A),
    \+is_list(B),
    A > B.

geq(A,B):-
    nonvar(A),
    nonvar(B),
    \+is_list(A),
    \+is_list(B),
    A >= B.

even(A):-
    nonvar(A),
    \+ is_list(A),
    0 is A mod 2.
    
    
odd(A):-
    nonvar(A),
    \+ is_list(A),
    1 is A mod 2.

%% metarules
metarule([P,Q,R], [P,A,B,C],[[Q,B,C],[R,C,A]]).
metarule([P,Q,R,W], [P,A],[[Q,C],[R,W,C,A,_]]).

%% Predicates in background
element

body_pred(increment/2).
body_pred(decrement/2).
body_pred(head/2).
body_pred(tail/2).
body_pred(empty/1).
body_pred(zero/1).
body_pred(eq/2).
body_pred(geq/2).
body_pred(even/1).
body_pred(odd/1).

%% interpreted BK

ibk([fold,_,X,[],X],[]).
ibk([fold,P,X,[H|T],Y],[[P,X,H,Z],[fold,P,Z,T,Y]]).


%solution
% f(A):-zero(C),fold(f_1,C,A,B).
% f_1(A,B,C):- decrement(B,C),geq(C,A).

a:-
    Pos = [
 f([7, 11, 12, 14, 22, 28, 39, 40, 43, 45, 48, 51, 52, 60, 70, 85, 95, 98, 99]),
f([57, 98]),
f([7, 11, 14, 17, 22, 22, 22, 33, 41, 50, 74, 78, 90, 93, 96, 98]),
f([2, 6, 8, 15, 20, 24, 25, 26, 28, 29, 35, 37, 41, 49, 50, 52, 57, 60, 61, 62, 64, 66, 66, 70, 71, 85, 88, 95, 99, 100]),
f([5, 9, 20, 38, 39, 47, 53, 54, 64, 70, 84, 90, 93]),
f([6, 10, 38, 46, 68, 79, 87, 89, 97]),
f([1, 2, 4, 4, 6, 11, 17, 18, 19, 23, 25, 26, 33, 36, 37, 39, 45, 45, 49, 49, 49, 49, 51, 53, 54, 56, 60, 62, 63, 64, 66, 67, 75, 75, 76, 79, 83, 85, 87, 90, 93, 98, 98]),
f([3, 5, 12, 13, 18, 24, 25, 31, 35, 36, 38, 52, 56, 57, 59, 60, 61, 61, 62, 66, 68, 70, 75, 77, 78, 79, 82, 88, 89, 90, 91, 92, 94]),
f([64, 79]),
f([15, 17, 25, 30, 34, 44, 49, 51, 53, 74, 79, 80, 81, 83, 98, 101])
    ],
    Neg =[
	f([0,0,0,0]),
f([74, 2, 37, 50, 84, 7, 42, 45, 43, 36, 38, 45]),
f([53, 15, 71, 57, 30, 92, 63, 69, 31, 18, 10, 38, 45, 25, 36, 75, 35, 10, 16, 21, 42, 57, 9, 16, 35, 10, 94]),
f([64,63,63,63,63,63]),
f([42, 49, 61, 12, 43, 43, 61, 24, 36, 68, 22, 79, 33, 16, 8, 38, 23, 29, 79, 46, 59, 83, 42, 53, 1, 9, 32, 75, 20, 39, 55, 32]),
f([12, 60, 41, 72, 87, 94, 39, 43, 30, 53, 84, 6, 86, 27, 13, 96, 16, 49, 2, 96, 6, 73]),
f([92, 101, 66, 46, 22, 85, 8, 45, 60, 71, 90, 42, 68, 72, 52, 40, 47, 24, 11, 70, 67]),
f([97, 10, 70, 13, 97, 89, 7, 30, 55, 92, 31, 33, 63, 24]),
f([90, 9, 18, 5, 72, 75, 63, 97, 30, 39, 43, 16, 69, 94, 50, 34, 88, 95, 27, 82, 75, 49]),
f([20, 74, 34, 76, 14, 31, 61, 63, 2, 55, 54, 59, 55, 19, 48, 87, 36, 88, 5, 22, 17, 76, 29, 83, 3, 86, 10, 20, 38, 99, 35, 95, 58, 87, 22]),
f([67, 66, 52, 60, 16, 23, 65, 26, 43, 46, 7, 55, 47, 81, 85, 31, 58, 84, 39, 50, 5, 62, 26, 92, 16, 37, 82, 2, 10, 31, 59, 28, 39, 40, 84, 86, 46, 16, 5]),
f([30, 71, 63, 66, 77, 82, 71, 79, 28, 22, 78, 97, 74, 49, 51, 40, 70, 9])
    ],
    learn(Pos,Neg).
:- time(a).
