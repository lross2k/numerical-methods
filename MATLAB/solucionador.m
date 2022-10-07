function [sol]=solucionador(A,b)
[A,b] = ElimGauss(A,b); %Metodo de eliminacion Gausseana
[sol]=SustAtras(A,b); %Soluciona el sistema por sustitucion hacia atras
