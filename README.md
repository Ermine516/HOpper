# Hopper 
  Hopper is a modified version of the inductive logic programming (ILP) system Popper. 
  
## Requirements

[SWI-Prolog](https://www.swi-prolog.org)

[Clingo 5.5.0](https://potassco.org/clingo/)

[pyswip](https://pypi.org/project/pyswip/)

# Running experiments

To run Hopper experiments run
```bash
python3 popper.py --timeout 300 --eval-timeout 0.001 --main "f" examples/(task name)/(FO|HO)
```
For Metagol run
```bash
swipl examples/(task name)/Meta/HO.pl
```

# Usage

You can run Hopper with the command `python popper.py <input dir>`
For instance, running the command `python popper.py examples/dropK/HO\ OPT` produces the output:

```prolog
% BEST PROG 2:
f(A,B,C):-ite_a(B,A,C).
ite_p_a(A,B):-tail(A,B).
% Precision:1.00, Recall:1.00, TP:3, FN:0, TN:2, FP:0
```

Take a look at the examples folder for examples.


# Example problem


Popper requires three files: 

- an examples file
- a background knowledge (BK) file
- a bias file

An examples file simply contains positive and negative examples of the relation you wish to learn:

```prolog
pos(f([1,1,2,1,1])).
pos(f([1,2,1])).
pos(f([1,1])).
pos(f([1])).
pos(f([])).
pos(f([1,2,2,1])).
pos(f([1,1,2,3,2,1,1])).
pos(f([1,1,2,3,3,3,2,1,1])).
pos(f([1,1,2,3,3,4,3,3,2,1,1])).
pos(f([1,1,2,3,3,4,4,3,3,2,1,1])).
pos(f([1,1,2,3,3,4,1,1,2,3,3,4,4,3,3,2,1,1,4,3,3,2,1,1])).
neg(f([1,2,3,4,1])).
neg(f([1,2,4,3,3,2,1])).
```

Likewise, a BK file contains helpful information about the relation you are trying to learn:

```prolog
head([H|_],H).
tail([_|T],T).
empty([]).
any(_).
front([X],[]). 
front([H|T],[H|Y]):-front(T,Y).
last([Y],Y).
last([_|T],Y):- last(T,Y).

higher_order_predicate(condlist,[2],1,1).
condlist(P,[]).
condlist(P,[H|T]):- call(P,H,T).
```

The bias file contains all the information necessary to restrict the search space of Popper. 

There seven things to add to this file:

* max number of cariable
* max number of clauses
* max body size
* head declarations
* body declarations
* type declarations
* direction declarations

Hopper need the first three parameters to restrict the search space:

- `max_vars(N).` sets the maximum number of variables allowed in a rule to be `N`
- `max_body(N).` sets the maximum number of body literals in a rule to be `N`
- `max_clauses(N).` sets the maximum number of rules/clause to be `N`

These parameters are important as they greatly influence the search space. If they are way too high then Popper will likely take a long time to learn a solution. If the settings are way too low then the search space might be too small to contain a good solution. We are currently working on techniques to automatically deduce these settings. But in the meantime finding the correct values can often be process of trial and error.

```prolog
max_vars(3). 
max_clauses(3). 
max_body(3). 

head_pred(f, 1).
body_pred(front,2).
body_pred(last, 2).
body_pred(empty, 1).
body_pred(any, 1).

type(f,(list,)).
type(front,(list,list)).
type(last,(list,element)).
type(empty,(list,)).
type(any,(element,)).

direction(f,(in,)).
direction(last,(in,out)).
direction(front,(in,out)).
direction(empty,(out,)).
direction(any,(in,)).

direction(condlist_a,(in,)).
direction(condlist_p_a,(in,in)).
type(condlist_a,(list,)).
type(condlist_p_a,(element,list)).
```



If we call Hopper with these three files, then it will produce the output:

```prolog
condlist_p_a(A,B):-any(A),empty(B).
condlist_p_a(A,B):-front(B,C),condlist_a(C),last(B,A).
f(A):-condlist_a(A).
% Precision:1.00, Recall:1.00, TP:11, FN:0, TN:2, FP:0
```

# Higher order
To use a higher-order predicate declare it as such using `higher_order_predicate` predicate in BK file.
```prolog
higher_order_predicate(fold, [3], 2, 1).
fold(P, [], A, A).
fold(P, A, [H|T], A3) :- call(P, A, H, A2), fold(P, A2, T, A3).
```
The arguments define in order: name, arities of HO arguments, number of FO arguments, number of instances to be used.

To generate a version of a predicate with more context use `more_context_predicate`.
```prolog
:- more_context_predicate(fold, 1, 3, 1).
higher_order_predicate(fold, [4], 4, 1).
```
The arguments define in order: name, number of HO arguments, number of FO arguments, number of arguments to be added.

# Recursion
To enable recursion add `enable_recursion.` to the bias file. Additionally, one can enable recursion for Higher-order arguments as well, `enable_ho_recursion.` This is expensive and should be avoided unless necessary. 

# Popper settings

To change the goal predicate name from 'f' use the flag `--main`.

To run with statistics use the flag `--stats`.

To run in debug mode use the flag `--debug`.

To run in information mode use the flag `--info`.

To show the full hypothesis space (bounded by `N`) use the flag `--hspace N`.

To run with a maximum learning time use the flag `--timeout`.

To run with a maximum example testing time use the flag `--eval-timeout`.

To allow non-Datalog clauses, where a variable in the head need not appear in the body, add `non_datalog.` to your bias file.

To allow singleton variables (variables that only appear once in a clause), add `allow_singletons.` to your bias file.
