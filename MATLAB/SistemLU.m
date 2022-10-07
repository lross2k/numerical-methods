function [sol]=SistemLU(A,b)
[L,U]=FactorizacionLU(A); %Método de factorización LU
[sol1]=SustAdelante(L,b); %Averigua la matriz Y mediante sustitución hacia adelante 
[sol]=SustAtras(U,sol1); %Soluciona el sistema por sustitución hacia atras
