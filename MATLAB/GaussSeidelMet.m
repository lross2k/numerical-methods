function [mSol] = GaussSeidelMet(A,b,x0,itermax,tol,p)
  % Declaracion de contantes
  n = length(A);
  D = diag(diag(A));
  L = tril(A) - D;
  U = triu(A) - D;
  T = inv(D + L)*-U;
  c = inv(D + L)*b;
  % Declaracion de variables
  error = tol + 1;
  cont = 1;
  mSol(cont,1) = cont - 1;
  mSol(cont,2:n+1) = x0;
  mSol(cont,5) = error;
  % Ciclo de iteracion
  while tol<error && !(itermax<cont)
    cont++;
    x0 = T*x0 + c;	% Calcular nuevos valores
    % Almacenar valores de iteracion actual en la respuesta
    mSol(cont,1) = cont - 1;
    mSol(cont,2:n+1) = x0;
    % Obtener error relativo de norma p
    error = ((sum((mSol(cont,2:n+1) - mSol(cont-1,2:n+1)).^p)).^(1/p)) / ((sum((mSol(cont,2:n+1)).^p)).^(1/p));
    % Almacenar error obtenido en la respuesta
    mSol(cont,n+2) = error;
  end
end