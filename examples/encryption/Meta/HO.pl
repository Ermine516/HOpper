:-['../../../metagol'].
metagol:timeout(300).


%% background knowledge
char_to_int('a',0).
char_to_int('b',1).
char_to_int('c',2).
char_to_int('d',3).
char_to_int('e',4).
char_to_int('f',5).
char_to_int('g',6).
char_to_int('h',7).
char_to_int('i',8).
char_to_int('j',9).
char_to_int('k',10).
char_to_int('l',11).
char_to_int('m',12).
char_to_int('n',13).
char_to_int('o',14).
char_to_int('p',15).
char_to_int('q',16).
char_to_int('r',17).
char_to_int('s',18).
char_to_int('t',19).
char_to_int('u',20).
char_to_int('v',21).
char_to_int('w',22).
char_to_int('x',23).
char_to_int('y',24).
char_to_int('z',25).

int_to_char(0,'a').
int_to_char(1,'b').
int_to_char(2,'c').
int_to_char(3,'d').
int_to_char(4,'e').
int_to_char(5,'f').
int_to_char(6,'g').
int_to_char(7,'h').
int_to_char(8,'i').
int_to_char(9,'j').
int_to_char(10,'k').
int_to_char(11,'l').
int_to_char(12,'m').
int_to_char(13,'n').
int_to_char(14,'o').
int_to_char(15,'p').
int_to_char(16,'q').
int_to_char(17,'r').
int_to_char(18,'s').
int_to_char(19,'t').
int_to_char(20,'u').
int_to_char(21,'v').
int_to_char(22,'w').
int_to_char(23,'x').
int_to_char(24,'y').
int_to_char(25,'z').

head([H|_],H).
tail([_|T],T).
empty([]).
cons([H|T],H,T).

my_succ(X,Y):- integer(X), Z is X+1, Y is Z mod 25. 

my_pred(0,25).
my_pred(X,Y):- integer(X), Y is X-1. 

%% metarules

metarule([P,Q,R], [P,A,B],[[Q,A,C],[R,C,B]]).
metarule([P,Q,F], [P,A,B],[[Q,A,B,F]]).


%% allow metagol to use my_succ in the body of a clause

body_pred(char_to_int/2).
body_pred(int_to_char/2).
body_pred(my_succ/2).
body_pred(my_pred/2).
%% interpreted BK
ibk([map,[],[],_],[]).
ibk([map,[A|As],[B|Bs],F],[[F,A,B],[map,As,Bs,F]]).

%Solution
% f(A,B):-f_1(A,C),f_1(C,B).
% f_1(A,B):-map(A,B,f_2).
% f_2(A,B):-char_to_int(A,C),my_pred(C,B).
% f_2(A,B):-my_pred(A,C),int_to_char(C,B).
% 261,781 inferences, 0.029 CPU in 0.029 seconds (100% CPU, 9089004 Lips)



a:-
    Pos = [
       f(['w', 'h', 'r', 'e', 'b', 't', 'w', 't', 'g'],['u', 'f', 'p', 'c', 'z', 'r', 'u', 'r', 'e']),
f(['u', 'n'],['s', 'l']),
f(['g', 'm', 'm', 'z', 'q', 'y'],['e', 'k', 'k', 'x', 'o', 'w']),
f(['v', 'g', 'a', 'j', 'n', 't', 'p', 'v', 'r', 'e', 'y', 'v', 'y'],['t', 'e', 'y', 'h', 'l', 'r', 'n', 't', 'p', 'c', 'w', 't', 'w']),
f(['t'],['r']),
f(['d', 'k', 'n', 'e', 'v'],['b', 'i', 'l', 'c', 't']),
f(['m', 'o', 'z', 't', 'w', 'y', 'u', 'a', 'k', 'y', 'h', 'k', 'k', 'k', 'a', 'j', 'p'],['k', 'm', 'x', 'r', 'u', 'w', 's', 'y', 'i', 'w', 'f', 'i', 'i', 'i', 'y', 'h', 'n']),
f(['c', 'x', 's', 'o', 'b', 'h', 'd', 'i', 'r', 's'],['a', 'v', 'q', 'm', 'z', 'f', 'b', 'g', 'p', 'q']),
f(['y', 'k', 'h', 'i', 'z', 'i', 's', 'e', 'z', 'v', 'f', 's', 'i', 'y', 'c', 'q'],['w', 'i', 'f', 'g', 'x', 'g', 'q', 'c', 'x', 't', 'd', 'q', 'g', 'w', 'a', 'o']),
f(['k', 't', 'q', 's', 'g', 'b', 'd', 'c', 'b', 'e', 'b', 'r', 's', 'n', 'l', 't', 'f', 'd', 'e'],['i', 'r', 'o', 'q', 'e', 'z', 'b', 'a', 'z', 'c', 'z', 'p', 'q', 'l', 'j', 'r', 'd', 'b', 'c']),
f(['x', 'c', 'b', 'p', 'k', 'l', 'w', 's', 'p', 'x', 'j', 'n', 'b', 'x', 'n', 'z', 'f', 'e'],['v', 'a', 'z', 'n', 'i', 'j', 'u', 'q', 'n', 'v', 'h', 'l', 'z', 'v', 'l', 'x', 'd', 'c']),
f(['n'],['l']),
f(['q', 't'],['o', 'r']),
f(['v', 'q', 'i', 'f', 'o', 's', 'k', 'w', 'v', 'f'],['t', 'o', 'g', 'd', 'm', 'q', 'i', 'u', 't', 'd']),
f(['y', 'j', 'n', 'd', 'x', 'q', 'e', 'r', 'j', 'g', 'o', 't', 'c', 'x'],['w', 'h', 'l', 'b', 'v', 'o', 'c', 'p', 'h', 'e', 'm', 'r', 'a', 'v']),
f(['f', 'q', 'd', 'f', 'v', 'c', 'o', 'r', 'z', 'q', 'y', 'z', 'x', 'v', 'y'],['d', 'o', 'b', 'd', 't', 'a', 'm', 'p', 'x', 'o', 'w', 'x', 'v', 't', 'w']),
f(['f', 'h', 'e', 'm', 'r', 's', 'x', 'q', 'm', 'v', 'j', 'l'],['d', 'f', 'c', 'k', 'p', 'q', 'v', 'o', 'k', 't', 'h', 'j']),
f(['j', 'k', 'r', 'l', 'o', 'x'],['h', 'i', 'p', 'j', 'm', 'v']),
f(['s', 'j', 'y', 'g', 'c', 'x', 'p', 'b'],['q', 'h', 'w', 'e', 'a', 'v', 'n', 'z']),
f(['h', 'w', 'y', 'y', 'a', 'h', 'v', 't', 'r', 'l', 'e', 'b', 'y', 'b', 'r', 'l', 's', 'z', 'k'],['f', 'u', 'w', 'w', 'y', 'f', 't', 'r', 'p', 'j', 'c', 'z', 'w', 'z', 'p', 'j', 'q', 'x', 'i']),
f(['u', 'y', 'w', 'y', 'e', 'z', 'e', 'e', 'z', 'p', 'i', 'k', 't', 'w', 'w', 'o', 'b', 'i', 'r', 'r'],['s', 'w', 'u', 'w', 'c', 'x', 'c', 'c', 'x', 'n', 'g', 'i', 'r', 'u', 'u', 'm', 'z', 'g', 'p', 'p']),
f(['u', 'x', 'c', 'c', 'y'],['s', 'v', 'a', 'a', 'w']),
f(['u', 'j', 'm', 'b', 'm', 'k', 'g', 'm', 'm', 'd', 'e', 'k', 'j', 'v', 'd', 'd'],['s', 'h', 'k', 'z', 'k', 'i', 'e', 'k', 'k', 'b', 'c', 'i', 'h', 't', 'b', 'b']),
f(['i', 'i', 'h', 'b', 'p', 'p'],['g', 'g', 'f', 'z', 'n', 'n']),
f(['e', 'd', 'e', 's', 'a', 'z', 'q', 'i', 'e', 'x', 'l', 'r', 'f', 'b', 'w', 'k', 'f', 'b'],['c', 'b', 'c', 'q', 'y', 'x', 'o', 'g', 'c', 'v', 'j', 'p', 'd', 'z', 'u', 'i', 'd', 'z']),
f(['l', 'm', 'b', 'y', 'y', 'y', 's', 'g', 'n', 'k'],['j', 'k', 'z', 'w', 'w', 'w', 'q', 'e', 'l', 'i']),
f(['a', 'p', 'w', 'c', 'j', 'k', 'g', 'y', 'e', 'w', 'f', 'z', 't', 'k'],['y', 'n', 'u', 'a', 'h', 'i', 'e', 'w', 'c', 'u', 'd', 'x', 'r', 'i']),
f(['b'],['z'])
    ],
    Neg =[
      f(['t', 'q'],['w', 't']),
f(['m', 'i', 'b', 'g', 'k', 'm', 'm', 'y', 'p', 'o', 'x', 'y', 'h', 'g', 'p', 'i', 'h'],['o', 'k', 'd', 'i', 'm', 'o', 'o', 'a', 'r', 'q', 'z', 'a', 'j', 'i', 'r', 'k', 'j']),
f(['n', 'e', 'e', 'h', 'i', 'b', 'r', 'x', 'q', 'v', 'y', 'x', 'z', 'e', 'r'],['x', 'o', 'o', 'r', 's', 'l', 'b', 'h', 'a', 'f', 'i', 'h', 'j', 'o', 'b']),
f(['s', 'k', 'i', 'd', 'y', 'o', 'z', 'b', 'm'],['g', 'y', 'w', 'r', 'm', 'c', 'n', 'p', 'a']),
f(['d', 'f', 's', 'l', 'n', 'w', 'h', 'f', 'p', 'j', 'i', 'o', 'i', 'd', 's', 'v', 'n', 'w', 'u'],['p', 'r', 'e', 'x', 'z', 'i', 't', 'r', 'b', 'v', 'u', 'a', 'u', 'p', 'e', 'h', 'z', 'i', 'g']),
f(['r', 'r', 'h', 'x', 'm', 'o', 'n', 'z', 'w', 'y', 'u', 'u', 'z'],['x', 'x', 'n', 'd', 's', 'u', 't', 'f', 'c', 'e', 'a', 'a', 'f']),
f(['o', 't', 'u', 'b', 'm', 'v', 'm', 'w', 'x', 'l', 'k', 'v', 'w', 'g'],['g', 'l', 'm', 't', 'e', 'n', 'e', 'o', 'p', 'd', 'c', 'n', 'o', 'y']),
f(['y', 'p', 'z', 'k', 'a', 'r', 'k', 'p', 'l', 'c', 'q'],['j', 'a', 'k', 'v', 'l', 'c', 'v', 'a', 'w', 'n', 'b']),
f(['y', 'x', 'x', 'o'],['i', 'h', 'h', 'y']),
f(['t', 'r', 'h', 'n', 'g', 'i', 's', 'j'],['b', 'z', 'p', 'v', 'o', 'q', 'a', 'r']),
f(['z', 'v', 'x', 'q', 'p', 'f', 'o', 't', 'y', 'f', 'x', 'x', 'a'],['d', 'z', 'b', 'u', 't', 'j', 's', 'x', 'c', 'j', 'b', 'b', 'e']),
f(['p', 'i'],['o', 'h']),
f(['p', 'i'],['p', 'i'])
    ],
    learn(Pos,Neg).
:- time(a).
