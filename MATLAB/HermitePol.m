%Esta funcion recibe un matriz Nod donde la primer fila corresponden los valores x0,x1,xn
%la segunda fila corresponde a los valores de y0,y1,yn y la tercera los valores de y0',y1',yn'
%La funcion retorna el polinomio de Hermite que corresponde a los valores ingresados
function [H] = HermitePol(Nod)
%Declaracion de variables necesarias
  n = size(Nod,1);
  g = n-1;
  Res = 0;
  syms x;

%Ciclos que permiten recorrer la matriz Nod para ir montando el sistema de ecuaciones que posteriormente se resuelve 
  for k=1:n
    for j=1:n
      for i=0:(2*g+1)   
        p = x^i;                                 %Genera los x^i que multiplican a los valores de a0, a1, a2n+1
        pp = diff(p);                            %Deriva p ya que la derivada debe aparecer en el sistema
        val = double(subs(p,x,vpa(Nod(1,j))));        %Evalua las expresiones obtenidas
        valp = double(subs(pp,x,vpa(Nod(1,j))));
        Res(j,i+1) = val;                        %Asigna los valores obtenidos a la matriz de respuestas
        Res(j+n,i+1) = valp;
      end
    end
  end
 
%Ciclo para generar una matriz que contenga y0,y1,yn
  for i=1:n
      a(1,i) = Nod(2,i);      
  end
    
%Ciclo para generar una matriz que contenga y0',y1',yn'    
  for i=1:n
      c(1,i) = Nod(3,i);      
  end
  
  r = [a c];                                     %Concatena las dos matrices recien generadas
  b = vpa(r');
  A = vpa(Res); 
  H = ElimGauss_PivPar(A,b);                     %Se llama a la funcion ElimGauss_PivPar para resolver el sistema de ecuaciones
  H = H';
 
%Monta el polinomio obtenido de tal forma que quede expresado como una funcion
  Ress=0;
  for i=0:(2*g+1)
    temp = Ress;
    Resp = vpa(H(1,i+1))*x^i;
    Ress = Resp + temp;
  end

%Devuelve el polinomio
  H = Ress;
end

