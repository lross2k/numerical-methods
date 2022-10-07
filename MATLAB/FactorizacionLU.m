function[L,U] = FactorizacionLU(A)
   [f,c]=size(A); 
   L=eye(f);
   
   if f==c  
      bandera=1;
      cont_F=2;
      cont_C=1;
      c_Control=0;
      %Transformar matriz original a matriz triangular superior
      while bandera==1
          c_Control=0;
        for i=cont_F:f
            c_Control=c_Control+1;
            piv=A(cont_C,cont_C);
            fraccion=A(i,cont_C)/piv;
            L(i,cont_C)=fraccion; 
            vect_fracciones(i)=fraccion;
            for j=cont_C:c
                mult=A(cont_F-1,j);
                A(i,j)=A(i,j)-(fraccion)*mult;
            end
        end
        if c_Control>1
           cont_F=cont_F+1;
           cont_C=cont_C+1;
           continue;
        end
        
        if c_Control==1
           A;
           bandera=0;
        end
        
      end %while
     U=A;
   else
       disp("Dimensiones incorrectas, la matriz debe ser cuadrada.")
   end
end