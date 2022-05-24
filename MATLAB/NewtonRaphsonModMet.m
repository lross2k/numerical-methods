% NewtonRaphson con una modificación
function [mNM]=NewtonRaphsonModMet(x0,f,tol,iterMax)
  % Declaracion de variables
  iter = 1:iterMax;                           % Definir iter como un vector
  df = diff(f);                               % Obtener funcion derivada de f
  err = tol + 1e0;                            % Error inicia sobre tol
  U = f/df;
  dU = diff(U);
  % Ciclo de iteraciones
  for i = iter
    if (subs(dU,x0) == 0)                     % Verificar si hay divergencia
      disp("Diverge");
      break
    elseif (vpa(err) <= vpa(tol))             % Verificar si se llego a tol
      disp("Maxima tolerancia alcanzada");
      break      
    else                                      % Proceder a iteracion
      xi = vpa(x0 - subs(U,x0)/subs(dU,x0));  % Calcular nueva x
      err = abs(x0 - xi);                     % Obtener error absoluto
      x0 = xi;                                % Redefinir x0 como xi
      mNM(i,1) = fix(vpa(i));
      mNM(i,2) = xi;                          % Almacenar en mNR
      mNM(i,3) = err;
    end
  end
end