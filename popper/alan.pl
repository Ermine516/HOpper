%% ##################################################
%% THIS FILE CONTAINS THE ASP PROGRAM GENERATOR
%% IT IS CALLED ALAN
%% VERSION 15
%% ##################################################

#defined functional/2.
#defined irreflexive/2.
#defined direction/2.
#defined type/2.
#defined size/1.
#defined lower/2.

#defined enable_recursion/0.
#defined enable_ho_recursion/0. %David
#defined non_datalog/0.
#defined allow_singletons/0.

#show head_literal/4.
#show body_literal/4.
#show before/2.
#show min_clause/2.
#show direction_/3.

%% HEAD PRED SYMBOL IF GIVEN BY USER 
head_aux(P,A):-
    head_pred(P,A).


%% BODY PRED SYMBOL IF GIVEN BY USER 
body_aux(P,A):-
    body_pred(P,A).

body_aux(P,A):-
    head_aux(P,A),
    not ho_arg(P), 
    1{enable_recursion;enable_ho_recursion}2. 
body_aux(P,A):-
    head_aux(P,A),
    ho_arg(P),
    enable_ho_recursion.

%% GUESS HEAD LITERALS
%% THE SYMBOL INV_K CANNOT APPEAR IN THE HEAD OF CLAUSE C < K
{head_literal(C,P,A,Vars)}:-
    head_vars(A,Vars),
    head_aux(P,A),
    index(P,I),
    C >= I,
    C = 0..N-1,
    max_clauses(N).

%% GUESS BODY LITERALS
{body_literal(C,P,A,Vars)}:-
    body_aux(P,A),
    vars(A,Vars),
    clause(C).

%% THERE IS A CLAUSE IF THERE IS A HEAD LITERAL
clause(C):-
    head_literal(C,_,_,_).

%% NUM BODY LITERALS OF A CLAUSE
%% grounding is > c * (n choose k), where n = |Herbrand base| and k = MaxN
body_size(C,N):-
    clause(C),
    max_body(MaxN),
    N > 0,
    N <= MaxN,
    #count{P,Vars : body_literal(C,P,_,Vars)} == N.

%% AT LEAST ONE HEAD LITERAL
:-
    not clause(0).

%% AT MOST ONE HEAD LITERAL PER CLAUSE
:-
    clause(C),
    #count{P,A : head_literal(C,P,A,_)} > 1.

%% AT LEAST 1 AND MOST MAX_N BODY LITERALS PER CLAUSE
%% THIS CONSTRAINT IS A BIT SNEAKY: WE SAY IT IS IMPOSSIBLE TO HAVE A CLAUSE WITHOUT A SIZE
:-
    clause(C),
    not body_size(C,_).

%% HEAD LITERAL CANNOT BE IN THE BODY
:-
    head_literal(C,P,_,Vars),
    body_literal(C,P,_,Vars).

%% USE CLAUSES IN ORDER
:-
    clause(C1),
    C1 > 1,
    C2 = 0..C1-1,
    not clause(C2).

%% USE VARS IN ORDER IN A CLAUSE
:-
    clause_var(C,Var1),
    Var1 > 1,
    Var2 = 0..Var1-1,
    not clause_var(C,Var2).

%% ##################################################
%% VARS ABOUT VARS - META4LIFE
%% ##################################################
#script (python)
from itertools import permutations
from clingo.symbol import Tuple_, Number
def mk_tuple(xs):
    return Tuple_([Number(x) for x in xs])
def pyhead_vars(arity):
    return mk_tuple(range(arity.number))
def pyvars(arity, max_vars):
    for x in permutations(range(max_vars.number),arity.number):
        yield mk_tuple(x)
def pyvar_pos(pos, vars):
    return vars.arguments[pos.number]
#end.

%% POSSIBLE VAR
var(0..N-1):-
    max_vars(N).

%% CLAUSE VAR
clause_var(C,Var):-
    head_var(C,Var).
clause_var(C,Var):-
    body_var(C,Var).

%% HEAD VAR
head_var(C,Var):-
    head_literal(C,_,_,Vars),
    var_member(Var,Vars).
%% BODY VAR
body_var(C,Var):-
    body_literal(C,_,_,Vars),
    var_member(Var,Vars).

%% VAR IN A TUPLE OF VARS
var_member(Var,Vars):-
    var_pos(Var,Vars,_).

%% VAR IN A LITERAL
var_in_literal(C,P,Vars,Var):-
    head_literal(C,P,_,Vars),
    var_member(Var,Vars).
var_in_literal(C,P,Vars,Var):-
    body_literal(C,P,_,Vars),
    var_member(Var,Vars).

%% HEAD VARS ARE ALWAYS 0,1,...,A-1
head_vars(A,@pyhead_vars(A)):-
    head_pred(_,A).


%% NEED TO KNOW LITERAL ARITIES
seen_arity(A):-
    head_pred(_,A).
seen_arity(A):-
    body_pred(_,A).
max_arity(K):-
    #max{A : seen_arity(A)} == K.

%% POSSIBLE VARIABLE PERMUTATIONS FROM 1..MAX_ARITY
vars(A,@pyvars(A,MaxVars)):-
    max_vars(MaxVars),
    max_arity(K),
    A=1..K.



%% POSITION OF VAR IN TUPLE
var_pos(@pyvar_pos(Pos,Vars),Vars,Pos):-
    vars(A,Vars),
    Pos = 0..A-1.

%% ##################################################
%% REDUCE CONSTRAINT GROUNDING BY ORDERING CLAUSES
%% ##################################################
before(C1,C2):-
    C1 < C2,
    head_literal(C1,P,_,_),
    head_literal(C2,Q,_,_),
    lower(P,Q).

before(C1,C2):-
    C1 < C2,
    head_literal(C1,P,_,_),
    head_literal(C2,P,_,_),
    not recursive_clause(C1,P,A),
    recursive_clause(C2,P,A).

count_lower(P,N):-
    head_literal(_,P,_,_),
    #count{Q : lower(Q,P)} == N.

min_clause(C,N+1):-
    recursive_clause(C,P,A),
    count_lower(P,N).

min_clause(C,N):-
    head_literal(C,P,A,_),
    not recursive_clause(C,P,A),
    count_lower(P,N).

%% ##################################################
%% BIAS CONSTRAINTS
%% ##################################################
%% DATALOG
:-
    not non_datalog,
    head_var(C,Var),
    not body_var(C,Var).

%% ELIMINATE SINGLETONS
:-
    not allow_singletons,
    clause_var(C,Var),
    #count{P,Vars : var_in_literal(C,P,Vars,Var)} == 1.

%% MUST BE CONNECTED
head_connected(C,Var):-
    head_var(C,Var).
head_connected(C,Var1):-
    head_literal(C,_,A,_),
    Var1 >= A,
    head_connected(C,Var2),
    body_literal(C,_,_,Vars),
    var_member(Var1,Vars),
    var_member(Var2,Vars),
    Var1 != Var2.
:-
    head_literal(C,_,A,_),
    Var >= A,
    body_var(C,Var),
    not head_connected(C,Var).

%% IRREFLEXIVE
%% prevents: head:-q(A,B),q(B,A)
:-
    irreflexive(P,2),
    body_literal(C,P,2,Vars1),
    body_literal(C,P,2,Vars2),
    Vars1 = (Var1,Var2),
    Vars2 = (Var2,Var1),
    Vars1 < Vars2.

%% TODO: GENERALISE THE BELOW
%% DYADIC FUNCTIONAL
%% CAN REPLICATE RECALL
%% prevents: head:- q(+A,-B),q(+A,-C)
:-
    functional(P,2),
    body_literal(C,P,2,(V1,_)),
    #count{V2 : body_literal(C,P,2,(V1,V2))} > 1.

%% TRIADIC FUNCTIONAL
%% prevents: head:- q(+A,+B,-C),q(+A,+B,-D)
:-
    functional(P,3),
    direction_(P,0,in),
    direction_(P,1,in),
    direction_(P,2,out),
    body_literal(C,P,_,(V1,V2,_)),
    #count{V3 : body_literal(C,P,_,(V1,V2,V3))} > 1.

%% TETRADIC (fancy) FUNCTIONAL
%% prevents: head:- q(+A,+B,-C,-D),q(+A,+B,-D,-E)
:-
    functional(P,4),
    direction_(P,0,in),
    direction_(P,1,in),
    direction_(P,2,out),
    direction_(P,3,out),
    body_literal(C,P,_,(V1,V2,_,_)),
    #count{(V3,V4) : body_literal(C,P,_,(V1,V2,V3,V4))} > 1.

%% ##################################################
%% SUBSUMPTION
%% ##################################################
same_head(C1,C2):-
    C1 < C2,
    head_literal(C1,P,A,Vars),
    head_literal(C2,P,A,Vars).

not_body_subset(C1,C2):-
    clause(C1),
    clause(C2),
    C1 < C2,
    body_literal(C1,P,A,Vars),
    not body_literal(C2,P,A,Vars).

body_subset(C1,C2):-
    clause(C1),
    clause(C2),
    C1 < C2,
    not not_body_subset(C1,C2),
    body_literal(C1,P,A,Vars),
    body_literal(C2,P,A,Vars).

:-
    C1 < C2,
    same_head(C1,C2),
    body_subset(C1,C2).

%% ##################################################
%% SIMPLE TYPE MATCHING
%% ##################################################
#script (python)
def pytype(pos, types):
    return types.arguments[pos.number]
#end.

%% needed to compute the tuple length from the type. 
type_aux(P, @pylen(Types), Types):-
    type(P,Types).
    
    
var_type(C,Var,@pytype(Pos,Types)):-
    var_in_literal(C,P,Vars,Var),
    var_pos(Var,Vars,Pos),
    vars(A,Vars),
    type_aux(P,A,Types). %% needed to enforce the arity of the predicate
    
:-
    clause_var(C,Var),
    #count{Type : var_type(C,Var,Type)} > 1.

%% ##################################################
%% CLAUSE ORDERING
%% ##################################################
%% WHY DID I ADD THIS? ORDER SHOULD NOT MATTER
%% ORDER BY CLAUSE SIZE
%% p(A)<-q(A),r(A). (C1)
%% p(A)<-s(A). (C2)
bigger(C1,C2):-
    body_size(C1,N1),
    body_size(C2,N2),
    C1 < C2,
    N1 > N2.

%% TWO NON-RECURSIVE CLAUSES
:-
    C1 < C2,
    not recursive_clause(C1,_,_),
    not recursive_clause(C2,_,_),
    same_head(C1,C2),
    bigger(C1,C2).

%% TWO NON-RECURSIVE CLAUSES
:-
    C1 > 0,
    C1 < C2,
    recursive_clause(C1,_,_),
    recursive_clause(C2,_,_),
    same_head(C1,C2),
    bigger(C1,C2).

%% ########################################
%% RECURSION
%% ########################################
num_recursive(P,N):-
    head_literal(_,P,_,_),
    #count{C : recursive_clause(C,P,_)} == N.

recursive:-
    recursive_clause(_,_,_).

recursive_clause(C,P,A):-
    head_literal(C,P,A,_),
    body_literal(C,P,A,_).

base_clause(C,P,A):-
    head_literal(C,P,A,_),
    not body_literal(C,P,A,_).

%% NO RECURSION IN THE FIRST CLAUSE
:-
    recursive_clause(0,_,_).

%% A RECURSIVE CLAUSE MUST HAVE MORE THAN ONE BODY LITERAL
:-
    C > 0,
    recursive_clause(C,_,_),
    body_size(C,1).

%% STOP RECURSION BEFORE BASE CASES
:-
    C1 > 0,
    C1 < C2,
    recursive_clause(C1,_,_),
    base_clause(C2,_,_),
    same_head(C1,C2).

%% CANNOT HAVE RECURSION WITHOUT A BASECASE
:-
    recursive_clause(_,P,A),
    not base_clause(_,P,A).

%% DISALLOW TWO RECURSIVE CALLS
:-
    C > 0,
    recursive_clause(C,P,A),
    #count{Vars : body_literal(C,P,A,Vars)} > 1.

%% PREVENT LEFT RECURSION
:-
    C > 0,
    num_in_args(P,1),
    head_literal(C,P,A,Vars1),
    body_literal(C,P,A,Vars2),
    var_pos(Var,Vars1,Pos1),
    var_pos(Var,Vars2,Pos2),
    direction_(P,Pos1,in),
    direction_(P,Pos2,in).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENSURES INPUT VARS ARE GROUND
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#script (python)
def pydirection(pos, directions):
    return directions.arguments[pos.number]
def pylen(directions):
    return Number(len(directions.arguments))
#end.

arity(P,A):-
    head_aux(P,A).
arity(P,A):-
    body_aux(P,A).

direction_aux(P, @pylen(Directions), Directions):-
    direction(P,Directions).

direction_(P,Pos,@pydirection(Pos,Directions)):-
    arity(P,A),
    Pos=0..A-1,
    direction_aux(P,A,Directions).

num_in_args(P,N):-
    direction_(P,_,_),
    #count{Pos : direction_(P,Pos,in)} == N.

%% VAR SAFE IF HEAD INPUT VAR
safe_var(C,Var):-
    head_literal(C,P,_,Vars),
    var_pos(Var,Vars,Pos),
    direction_(P,Pos,in).

%% VAR SAFE IF IN A LITERAL THAT ONLY HAS OUT VARS
safe_var(C,Var):-
    num_in_args(P,0),
    body_literal(C,P,_,Vars),
    var_member(Var,Vars).

%% VAR SAFE IF IN SAFE LITERAL
safe_var(C,Var):-
    safe_literal(C,P,Vars),
    var_member(Var,Vars).

%% LITERAL WITH N INPUT VARS IS SAFE IF N VARS ARE SAFE
safe_literal(C,P,Vars):-
    num_in_args(P,N),
    N > 0,
    body_literal(C,P,_,Vars),
    #count{Pos :
        var_pos(Var,Vars,Pos),
        direction_(P,Pos,in),
        safe_var(C,Var)
    } == N.

%% SAFE VARS
:-
    direction_(_,_,_), % guard for when no direction_s are given
    clause_var(C,Var),
    not safe_var(C,Var).

%% ########################################
%% Addition ASP code
%% ########################################

#script (python)
from itertools import permutations
from clingo.symbol import Tuple_, Number, Function
def mk_tuple(xs):
    return Tuple_([Number(x) for x in xs])
#end.

%% P IS DEFNED BY AT LEAST TWO CLAUSES
num_clauses(P,N):-
    head_literal(_,P,_,_),
    #count{C : head_literal(C,P,_,_)} == N.

multiclause(P,A):-
    head_literal(_,P,A,_),
    not num_clauses(P,1).

index(P,0):-
    head_pred(P,_).


mem(X, T, C) :- (X,) = T, body_literal(C, _, _, T).
mem(X, T, C) :- (X, _) = T, body_literal(C, _, _, T).
mem(X, T, C) :- (_, X) = T, body_literal(C, _, _, T).
mem(X, T, C) :- (_, _, X) = T, body_literal(C, _, _, T).
mem(X, T, C) :- (_, X, _) = T, body_literal(C, _, _, T).
mem(X, T, C) :- (X, _, _) = T, body_literal(C, _, _, T).

