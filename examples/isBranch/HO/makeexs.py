from random import seed
from random import randint
from functools import reduce
import time
# seed random number generator
seed(time.time() )



def maketree(dep,branch):
	root = randint(0, 10)
	newBran = branch+[root]
	numch = randint(0, 4)
	if dep== 0: 
    		return ("t("+str(root)+",e)",[newBran])
	else:
		results=list(zip(*[maketree(dep-1,newBran) for x in range(numch)]))
		if results:
			bran =[]
			for x in list(results[1]):
				bran.extend(x)
			return ("t("+str(root)+","+"["+','.join(results[0])+"])",bran)
		else: 
			return ("t("+str(root)+",e)",[newBran])	
			
for i in range(10): 
	depth = randint(0, 5)
	tree,branches = maketree(depth,[])
	tree.replace(',)',')')
	pairs = [ "pos(f("+tree+",["+','.join([str(y) for y in x])+"])." for x in branches]
	for p in pairs: print(p)
	
