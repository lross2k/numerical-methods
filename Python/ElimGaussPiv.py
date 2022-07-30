# Import pivot function
from Pivot import pivot

# Simple transpose function hack
def transpose(x):
    try:
        len(x[0])
    except TypeError:
        for i in range(len(x)): x[i] = [x[i]] 
    return x

def elim_gauss_piv(A,b):
    x = []
    # Constant declarations
    n = len(A)	# Matrix dimension
    # Forward elimination process
    for k in range(n-1):
        [A,b] = pivot(A,b,k)	# Pivot function call
        for i in range(k+1,n):
            F = A[i][k]/A[k][k]
            for j in range(n):
                A[i][j] = A[i][j] - F*float(A[k][j])
            b[i][0] = b[i][0] - F*float(b[k][0])
    # Reverse substitution process
    for i in range(0,n): x.append(0) # Populate x
    for i in range(n-1,-1,-1):
        suma = 0
        for j in range(i+1,n):
            suma = suma + A[i][j]*x[j]
        x[i] = (b[i][0] - suma)/A[i][i]
    # Transpose result 
    #x = x';
    x = transpose(x)
    return x

