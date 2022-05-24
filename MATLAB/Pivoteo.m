function [A,B] = Pivoteo(A,B,k)
  % Declaracion de constantes
  n = length(A);	% Dimension de matriz
  e = zeros(n,1);	% Matriz identidad
  % Ciclo para calcular valor de escalones
  for i = k:n
    e(i) = abs(A(i,k))/abs(max(A(i,:)));
  end
  % Realizar cambios en matrices
  [~,f] = max(e);
  A([k,f],:) = A([f,k],:);
  B([k,f],:) = B([f,k],:);
end
