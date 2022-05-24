% lross2k
% 1/6/21
% implementacion simbolica metodo Runge-Kutta orden 4
function [xi,wi] = RK4_Met(ti,b,w0,f,n)

  % prevenir error por dependencias
  if (exist('OCTAVE_VERSION', 'builtin'))
    pkg load symbolic;
  end
  
  % declarar variables simbolicas
  syms x y;

  % declarar variables del problema
  h = vpa((b - ti)/n);
  
  % almacenar resultados iniciales
  xi(1) = double(ti);
  wi(1) = double(w0);
  
  % ciclo de iteraciones
  for i=1:n
    k1 = h*vpa(subs(f, [x y], [ti w0]));
    k2 = h*vpa(subs(f, [x y], [ti+h/2 w0+k1/2]));
    k3 = h*vpa(subs(f, [x y], [ti+h/2 w0+k2/2]));
    k4 = h*vpa(subs(f, [x y], [ti+h w0+k3]));
    w0 = w0 + (k1 + 2*k2 + 2*k3 + k4)/6;
    ti += h;
    
    % almacenar valores en vectores
    xi(i+1) = double(ti);
    wi(i+1) = double(w0);
  end
  
end
