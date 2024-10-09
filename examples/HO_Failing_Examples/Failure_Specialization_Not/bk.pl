l(a). l(b).
d(a). d(c).


higher_order_predicate(notpred, [1], 1, 1).

notpred(P, X) :- not(call(P, X)).
