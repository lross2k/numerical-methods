% lross2k
% 1/6/21
% implementacion simbolica metodo Runge-Kutta orden 2
function [xi,yi] = RK2_Met(x0,b,y0,f,n)
  
  % prevenir errores en octave
  if (exist('OCTAVE_VERSION', 'builtin'))
    pkg load symbolic;
  end

  % declaracion de variables simbolicas
  syms x y;
  
  % declaracion de constantes
  h = vpa((b - x0)/n);
  
  % almacenar resultados iniciales
  xi(1) = x0;
  yi(1) = y0;
  
  % dar formato a variables iniciales
  x0 = vpa(x0);
  y0 = vpa(y0);
  
  % ciclo de iteracion
  for i=1:n
    f1 = vpa(subs(f, [x y], [x0 y0]));
    f2 = vpa(subs(f, [x y], [x0+h y0+h*f1]));
    y0 += h*(f1 + f2)/2;
    x0 += h;
    % almacenar resultados por iteracion
    xi(i+1) = double(x0);
    yi(i+1) = double(y0);
  end
  
end
