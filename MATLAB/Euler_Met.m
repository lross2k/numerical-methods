% lross2k
% 1/6/21
% implementacion simbolica metodo Euler o Taylor orden 1
function [xi,yi] = Euler_Met(x0,b,y0,f,n)
  
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
  
  for i=1:n
    y0 += h*vpa(subs(f, [x y], [x0 y0]));
    x0 += h;
    % almacenar resultados por iteracion
    xi(i+1) = double(x0);
    yi(i+1) = double(y0);
  end
  
end
