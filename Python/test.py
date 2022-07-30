#from ElimGauss import elim_gauss
#A = [[1,-1],[2,0]]
#b = [[5],[2]]
#print(elim_gauss(A,b))

#import sympy as sym
#x = sym.Symbol('x')
#f = - 4*x + 15
#from NewtonRaphsonMet import newton_raphson_met
#print(newton_raphson_met(0,f,0.01,10))
#from NewtonRaphsonModMet import newton_raphson_mod_met
#print(newton_raphson_mod_met(0,f,0.01,10))

#from Pivot import identity, zeros, pivot
#print(identity(3))
#print(identity(3,1))
#print(zeros(3))
#print(zeros(3,1))
#pivot([[1,2,5],[3,4,7],[1,2,3]],[[0,0,0],[0,0,0],[0,0,0]],0)
#print(pivot([[1,2,5,8],[3,4,7,8],[1,2,3,8],[8,8,8,8]],[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],0))

#from ElimGaussPiv import elim_gauss_piv
#A = [[1,-1],[2,0]]
#b = [[5],[2]]
#print(elim_gauss_piv(A,b))

# Test using complex numbers for gaussian elimination
from ElimGauss import elim_gauss
A = [[1+4j,-1],[2,0]]
b = [[5],[2]]
print(elim_gauss(A,b))

