// MÉTODO DO CANTO NOROESTE

matriz_aumentada = [20,15,10,50;12,8,16,70;20,40,60,0];


function SI = noroeste(matriz_aumentada)
    
    dim = size(matriz_aumentada);
    
     A = matriz_aumentada(1:dim(1)-1,1:dim(2)-1);// Matriz de coeficientes
     oferta = matriz_aumentada(:,dim(2));// vetor de resultados
     demanda = matriz_aumentada(dim(1),:);// vetor de resultados
     
     while i < n
         
     
     for i = 1:dim(1)-1
         
         for j = 1:dim(2)-1
             
                         
            if oferta(i) - demanda(i) < 0 then
                
                A(i,j) = 
                
                end
                     
            
            
         end
     end
     
    end
    
endfunction
