%Dados tol, iterMax, f, a y b
function [mBS]=BisecnMet(a,b,f,tol,iterMax)
tol = vpa(tol); a = vpa(a); b = vpa(b);
%Calcular fa y fb
  syms x
  fa = vpa(subs(f,x,sym(a))); %Convierte a f en f(a), de tipo numero
  fb = vpa(subs(f,x,sym(b))); %f(b)

%Verificar si hay cambio de signo
  if fa*fb < 0
    iter = 1;
    error = tol+1;
    
    while error > tol %Mantiene el ciclo hasta que se alcance la tolerancia deseada
      if iter > iterMax
        disp('Alcanzo la cantidad maxima de iteraciones');
        break;    
      endif
%Determinar la nueva aproximacion
      xn = (a+b)/2;
      yn = vpa(subs(f,x,sym(xn))); %f(xn)
      
%Verifica las condiciones para aplicar biseccion 
      if fa*yn < 0 
        b = xn;
        fb = yn;
        
      else
        a = xn;
        fa = yn;
        
      end
      
      if iter >= 2 %Calcula el error
        error = abs(xn-xAnt);
      end

%Devuelve la matriz con los valores de interes
      mBS(iter,1) = fix(vpa(iter));
      mBS(iter,2) = vpa(xn);
      mBS(iter,3) = error;
      
      xAnt = xn;
      iter = iter+1;
    end
    iter = iter-1;
  else
    disp('No se puede aplicar el metodo')
    mBS = [];
  end

end