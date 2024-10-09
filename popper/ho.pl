more_context_predicate(Name, PredArgs, NormalArgs, Added) :- 
    length(LNormalArgs, NormalArgs), length(LPredArgs, PredArgs), append(LPredArgs, LNormalArgs, LOldArgs),
    Head =.. [Name|LOldArgs],
    length(LContextArgs, Added), append(LOldArgs, LContextArgs, LNewArgs), NewHead =.. [Name|LNewArgs],
    clause(Head, Clause),
    map_predicate_calls(Clause, Name, LPredArgs, LContextArgs, Clause2),
    assertz(NewHead :- Clause2),
    numbervars((Clause, Clause2), 1, _),
    fail.

more_context_predicate(_, _, _, _).


map_predicate_calls(V, _, _, _, V) :- var(V), !.
map_predicate_calls([], _, _, _, []) :- !.
map_predicate_calls([H|T], A, B, C, [H2|T2]) :- !, 
  map_predicate_calls(H, A, B, C, H2),
  map_predicate_calls(T, A, B, C, T2).

%calls to arguments
map_predicate_calls(Term, _, PredArgs, ContextArgs, Out) :-
Term =.. [call,CallPred|CallArgs], member(CallPred, PredArgs), !,
  append(CallArgs, ContextArgs, NewArgs), Out =.. [call,CallPred|NewArgs].

%recursive calls
map_predicate_calls(Term, Name, _, ContextArgs, Out) :-
  Term =.. [Name|TArgs], !,
  append(TArgs, ContextArgs, NewArgs), Out =.. [Name|NewArgs].
    
map_predicate_calls(Term, A, B, C, Out) :- 
  Term =.. [TName|TArgs],
  map_predicate_calls(TArgs, A, B, C, OArgs), Out =.. [TName|OArgs].
