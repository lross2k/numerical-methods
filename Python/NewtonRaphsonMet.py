import sympy as sym

def newton_raphson_met(x0,f,tol,iter_max):
    # Variable declaration
    m_nr = []
    x = sym.Symbol('x')
    iter = range(iter_max)  # List for iteration
    df = sym.diff(f)        # Derivative of f
    err = tol + 1           # Error should start greater than tolerance
    # Iteration cycle
    for i in iter:
        if df.subs(x,x0) == 0:
            print("Detected divergence")
            break
        elif err <= tol:
            print("Tolerance limit reached")
            break
        else:
            xi = x0 - f.subs(x,x0)/df.subs(x,x0) # New X
            err = abs(x0 - xi)                   # New error
            x0 = xi                              # Redefine X0
            m_nr.append([i,float(xi),float(err)])
    return(m_nr)
