function [m_steffesen] = SteffensenMet(x_n,f,max_iter,tol)
  syms x;
  format long;
  % puede que haga falta verificar si no se divide por 0
  % pero quiero dormir
  x_n = vpa(x_n); tol = vpa(tol); f = vpa(f);
  c_error = tol + 1;
  iters = 1:max_iter;
  %f = x^2 - cos(x) - 1;      % funcion usada para pruebas
  for n = iters
    if (c_error <= tol)
      disp("max tolerancia");
      return;
    else
      % ----- primera prueba de funcion ----- %
      %f_img = subs(f,x,x_n); % imagen de x en f
      %sf_img = subs(f,x,x_n + f_img); % imagen de x + f(x) en f
      %x_i = x_n - f_img^2 / (sf_img - f_img); % ecuacion para x_i
      % ----- segunda prueba de funcion ----- %
      g = subs(f,x,x_n + subs(f,x,x_n))/subs(f,x,x_n) - 1;
      x_i = x_n - subs(f,x,x_n)/g;
      disp(x_i);  % ===============> IMPRIME X
      c_error = abs(x_n - x_i);
    end
    m_steffesen(n,1) = fix(vpa(n));
    m_steffesen(n,2) = x_i;
    m_steffesen(n,3) = c_error;
    x_n = x_i;
  end
  disp("max iteraciones");
end