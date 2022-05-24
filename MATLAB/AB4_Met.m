function [xi, wi] = AB4_Met(a,b,y0,f,n)

  syms x y;
  
  h = vpa((b - a)/n);
  
  % RK4 retorna w0, w1, ... wn
  [xp,wp] = RK4_Met(a,b,y0,f,n);   % pesima implementacion, se quedara en mis pesadillas
  
  % Filtrar w0, w1, w2, w3
  sn = length(wp);
  xp = vpa(xp(1:sn-(sn-4)));
  wp = vpa(wp(1:sn-(sn-4)));
  %wi = wp;    % could wait?
  
  % Ciclo de iteracion
  for i=4:n
    wp(i+1) = vpa(wp(i) + h/24*(55*subs(f,[x y],[a+h*(i-1) wp(i)])-59*subs(f,[x y],[a+h*(i-2) wp(i-1)])+37*subs(f,[x y],[a+h*(i-3) wp(i-2)])-9*subs(f,[x y],[a+h*(i-4) wp(i-3)])));
    xp(i+1) = vpa(a+h*(i));
  end
  
  xi = double(xp);
  wi = double(wp);
  
end
