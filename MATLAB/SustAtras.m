function[sol]=SustAtras(A,b)
n=length(A);
sol(n)=b(n)/A(n,n);

for k=n-1:-1:1
    suma =0; 
    for j=k+1:n
        suma=suma+A(k,j)*sol(j);
    end
    sol(k)=(b(k)-suma)/A(k,k);

end

end