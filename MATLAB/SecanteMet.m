%Dados tol, iterMax, f, x0 y x1
function [mSE]=SecanteMet(a,b,f,tol,iterMax)
  a = vpa(a); b = vpa(b); tol = vpa(tol);
%Calcular fa y fb
  syms x
  fa = vpa(subs(f,x,a)); %Convierte a f en f(a), de tipo numero
  fb = vpa(subs(f,x,b))  ; %f(b)
  iter = 0;
  error = tol+1;
  while error > tol %Mantiene el ciclo hasta que se alcance la tolerancia deseada
      iter = iter+1;
      if iter > iterMax
        disp('Alcanzo la cantidad maxima de iteraciones');
        break;
      end
%Calcula la nueva aproximacion  
      if fa == fb    
        disp('fa es igual a fb, por lo tanto se indefiniria');
        break
        endif
      xi = b-(fb*(b-a))/(fb-fa);    
      yn = vpa(subs(f,x,xi)); %f(xi)
      if iter >= 2 %Calcula el error
        error = abs(xi-b)/abs(xi);
      end
%Asigna las variables como debe de ser      
      a=b;
      fa=fb;
      b=xi;
      fb=yn;
%Devuelve la matriz con los parametros deseados     
      mSE(iter,1) = fix(vpa(iter));
      mSE(iter,2) = xi;
      mSE(iter,3) = error;
    end
end