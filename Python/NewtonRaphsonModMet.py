import sympy as sym

def newton_raphson_mod_met(x0,f,tol,iter_max):
    # Variable declaration
    m_nr = []
    x = sym.Symbol('x')
    iter = range(iter_max)
    df = sym.diff(f)
    err = tol + 1
    u = f/df
    du = sym.diff(u)
    # Iteration cycle
    for i in iter:
        if du.subs(x,x0) == 0:
            print("Detected divergence")
            break
        elif err <= tol:
            print("Tolerance limit reached")
            break
        else:
            xi = x0 - u.subs(x,x0)/du.subs(x,x0)
            err = abs(x0 - xi)
            x0 = xi
            m_nr.append([i,float(xi),float(err)])
    return(m_nr)
