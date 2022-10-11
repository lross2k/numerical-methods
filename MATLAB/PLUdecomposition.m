function [P, L, U] = PLUdecomposition(A)
% Se debe resolver el sistema PA=LU para descomponer
% mediante permutaciones con método Gaussiano

  % Declaración de variables para cálculos
  [m, n] = size(A); % Tomar fila y columnas de A
  % Declaración de variables a retornar
  P = eye(n, n);    % Incializar matriz P
  L = eye(n, n);    % Incializar matriz L
  U = zeros(n, n);  % Incializar matriz U

  % Verificar que la matriz ingresada sea correcta
  if m ~= n
    disp("La matriz debe ser cuadrada.");
    return
  else
    % Se usa elminación Gaussiana para resolver al sistema
    % de cada permutación, este ya se ha visto en el curso
    tol = 1e-8; % tolerancia para eliminación gaussiana
    for k = 1:n
       if abs(A(k, k)) < tol
          for r = k:n
             if abs(A(r, k)) >= tol
                break % terminar si el error es mayor a la tol
             end
          end
          A([r k], 1:n) = A([k r], 1:n);
          if k > 1
            L([r k], 1:k-1) = L([k r], 1:k-1);
          end
          P([r k], 1:n) = P([k r], 1:n);
       end
       % iterar solucionando el sistema
       for i = k+1:n
          L(i, k) = A(i, k) / A(k, k);
          for j = k+1:n
             A(i, j) = A(i, j) - L(i, k)*A(k, j);
          end
       end
       for j = k:n
          % obtener los valores de U multiplicando con base en
          % los valores de cada fila columna de A y la prueba de error
          U(k, j) = A(k, j) * (abs(A(k, j)) >= tol);
       end
    end
  end
end

