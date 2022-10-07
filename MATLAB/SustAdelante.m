function[sol]=SustAdelante(A,b)
% Declaracion de constantes
  n = length(A);	% Dimension de matriz
  % Proceso de eliminacion
  for k = 1:n-1
    for i = k+1:n
      F = A(i,k)/A(k,k);
      for j = 1:n
        A(i,j) = A(i,j) - F*A(k,j);
      end
      b(i) = b(i) - F*b(k); %Almacenado de los resultados
    end
  end
  sol = b;         
end
