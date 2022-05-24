%A es una matriz, b un vector, y k es un numero que indica por cual iteracion voy
function [A,b] = Pivoteo_Parcial(A,b,k)
  A = double(A);
  b = double(b);
  k = double(k);
  
  n=length(A);                                   %Para saber el tamano de la matriz
  e=zeros(n,1);                                  %Vector en donde almacenar valores relativos de cada columna
  
  for i=k:n                                      %Hace el recorrido desde la posicion k hasta n
    e(i)=abs(max(A(i,k)));                       %Obtiene el valor del pivote entre el maximo de la fila
  end
  
  [~,f]=max(e);                                  %Me da la ubicacion del valor maximo
  A([k,f],:)=A([f,k],:);                         %Realiza el cambio de filas necesario
  b([k,f],1)=b([f,k],1);                         %Hace el mismo cambio para el vector de respuestas
  
end