pos(f([1],[])).
pos(f([1,2],[2])).
pos(f([1,2,3],[3])).
pos(f([1,2,3,4],[3,4])).
pos(f([1,2,3,4,5],[4,5])).
pos(f([1,2,3,4,5,6],[4,5,6])).
pos(f([1,2,3,4,5,6,7],[5,6,7])).
pos(f([],[])).
neg(f([],[1])).
neg(f([1,2],[1,2])).
neg(f([1,2,3,4,5],[1,2,3])).
neg(f([1,2,3,4,5],[])).
neg(f([1,2,3,4,5],[1,2,3,4])).
neg(f([1,2,3,4,5],[5,4,3,2,1])).