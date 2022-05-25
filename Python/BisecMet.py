import sympy as sym

# Dados tol, iterMax, f, a y b
def bisec_met(a,b,f,tol,iter_max):
    # Calcular fa y fb
    x = sym.Symbol('x')
    m_bs = []
    fa = f.subs(f,a) # Convierte a f en f(a), de tipo numero
    fb = f.subs(f,b) # f(b)

    # Verificar si hay cambio de signo
    if fa*fb < 0:
        iter = 0
        error = tol+1

        while error > tol: # Mantiene el ciclo hasta que se alcance la tolerancia deseada
            if iter > iter_max:
                print('Alcanzo la cantidad maxima de iteraciones')
                break

            # Determinar la nueva aproximacion
            xn = (a+b)/2
            yn = f.subs(f,xn) # f(xn)

            # Verifica las condiciones para aplicar biseccion 
            if fa*yn < 0:
                b = xn
                fb = yn
            else:
                a = xn
                fa = yn

            if iter >= 2: # Calcula el error
                error = abs(xn-x_ant)

            # Devuelve la matriz con los valores de interes
            m_bs.append([])
            m_bs[iter].append(iter)
            m_bs[iter].append(xn)
            m_bs[iter].append(error)
            
            x_ant = xn
            iter = iter+1

        iter = iter-1
    else:
        print('No se puede aplicar el metodo')
        m_bs = []

    return m_bs
