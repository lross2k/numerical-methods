def identity(n, r_j=-1):
    id = []
    r_j = n if r_j == -1 else r_j
    for i in range(n):
        sub = []
        for j in range(r_j):
            sub.append(1*(i == j))
        id.append(sub)
    return(id)

def zeros(n, r_j=-1):
    id = []
    r_j = n if r_j == -1 else r_j
    for i in range(n):
        sub = []
        for j in range(r_j):
            sub.append(0)
        id.append(sub)
    return(id)

def trim_rows_forward(A,init_row,end_row):
    tmp = []
    for i in range(init_row,end_row+1):
        tmp.append(A[i]) 
    return(tmp)

def trim_rows_backwards(A,init_row,end_row):
    tmp = []
    for i in range(end_row,init_row-1,-1):
        tmp.append(A[i]) 
    return(tmp)

def swap_rows(A,r0,r1):
    tmp_r0 = A[r0][:]
    tmp_r1 = A[r1][:]
    A[r0] = tmp_r1
    A[r1] = tmp_r0
    return(A)

def pivot(A,B,k):
    # Constantes
    n = len(A)
    e = zeros(n,1)
    # Stepping cycle
    for i in range(k,n):
        e[i] = [abs(A[i][k])/abs(max(A[i]))]
    # Matrix interchanging
    f = e.index(max(e))
    swap_rows(A,k,f)
    swap_rows(B,k,f)
    return([A,B])
