#from ElimGauss import elim_gauss
#A = [[1,-1],[2,0]]
#b = [[5],[2]]
#print(elim_gauss(A,b))

import sympy as sym
x = sym.Symbol('x')
f = - 4*x + 15
from NewtonRaphsonMet import newton_raphson_met
print(newton_raphson_met(0,f,0.01,10))
