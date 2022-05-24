%Dados a,b,f,tol,iterMax
function [mFP]=FPosiMet(a,b,f,tol,iterMax)
syms x
a = vpa(a); b = vpa(b); tol = vpa(tol);
%Calcular fa y fb
fa = vpa(subs(f,x,a)); %f(a)  
fb = vpa(subs(f,x,b)); %f(b)

%Verificar si hay cambio de signo: fa*fb<0
if fa*fb<0
    iter = 1;
    error = tol+1;
    while error>tol
        if iter>iterMax
           disp('Alcanzó la cantidad de iteraciones permitidas');
           break;
        end
        xn = b-fb*(b-a)/(fb-fa);
        yn = vpa(subs(f,x,xn)); %f(xn)
        if fa*yn<0
            b=xn; fb=yn;
        else
            a=xn; fa=yn;
        end
        if iter >=2
           error = abs(xn-xAnt); 
        end
        mFP(iter,1)=fix(vpa(iter));
        mFP(iter,2)=xn;
        mFP(iter,3)=error;
        xAnt = xn;
        iter = iter+1;
    end
    iter = iter -1;
else
   disp('No se puede aplicar el método')
   mFP=[];
end

end