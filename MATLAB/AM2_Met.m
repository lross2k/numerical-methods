function [wi] = AM2_Met(w_arr,t0,f,h)

  syms x y;

  wi = vpa(0);
  w_arr = vpa(w_arr);
  t0 = vpa(t0);
  h = vpa(h);

  if (length(w_arr) ~= 3)
    disp("El metodo AM2 requiere de 3 puntos iniciales");
    return;
  end
  
  %w_arr = [w0 w1 w2]
  f0 = subs(f, [x y], [t0 w_arr(1)])
  f1 = subs(f, [x y], [h+t0 w_arr(2)])
  f2 = subs(f, [x y], [2*h+t0 w_arr(3)])
  
  wi = double(w_arr(2) + h/12*(5*f2+8*f1-f0));

end
