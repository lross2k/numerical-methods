function [x] = ElimGauss_Piv(A,b)
  % Declaracion de constantes
  n = length(A);	% Dimension de matriz
  % Proceso de eliminacion hacia adelante
  for k = 1:n-1
    [A,b] = Pivoteo(A,b,k);	% LLamado a funcion externa
    for i = k+1:n
      F = A(i,k)/A(k,k);
      for j = 1:n
        A(i,j) = A(i,j) - F*A(k,j);
      end
      b(i) = b(i) - F*b(k);
    end
  end
  %Proceso de sustitucion hacia atras
  for i = n:-1:1
    suma = 0;
    for j = i+1:n
      suma = suma + A(i,j)*x(j);
    end
    x(i) = (b(i) - suma)/A(i,i);
  end
  % Dar formato a resultado
  x = x';
end
