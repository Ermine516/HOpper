pos(f([1,2,3],3,[[1,2,3],[1,2,3],[1,2,3]])).
pos(f([[1,2,3],[1,2,3],[1,2,3]],2,[[[1,2,3],[1,2,3],[1,2,3]],[[1,2,3],[1,2,3],[1,2,3]]])).
pos(f([1,2,3,4],4,[[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]])).
pos(f([1,2],5,[[1,2],[1,2],[1,2],[1,2],[1,2]])).
pos(f([],2,[[],[]])).
pos(f([1],0,[])).
pos(f([1],1,[[1]])).
neg(f([1,2,3,4,5],3,[[1,2,3,4,5]])).
neg(f([1,2,3,4,5],2,[])).

