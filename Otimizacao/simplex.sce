


// Matriz de coeficientes
 A = [1,-12,-15,0,0,0,0;0,1,0,1,0,0,0;0,0,1,0,1,0,0;0,1,1,0,0,1,0;0,1,3,0,0,0,1]
// vetor solucao 
 b = [0;3;4;6;13];
 
function [zo] = simplex(A,b)
    
    q = zeros(1,length(b)); // vetor do Fator Limitante
    a = min(A(1,:)); // menor valor da primeira linha
    
    //*****
    aux = A(1,:);        
    index = find(aux == a);
    //*****
    
    
    for i = 1:length(b)-1
        if abs(A(i,index)) == 0 then
            q(i) = 0;
          else
        q(i) = b(i) / abs(A(i,index));
        end
    end
    
    ql = min(q);// Fator Limitante
    
    l = find(q == ql); // indice que identifica a posicao no conjunto B que deve deixar a base
    
    for j = 1: length(A(:,index)
        
        A(:,index) =  A(:,index) - (A(:,index)/A(l,index)) * A(l,index);
        
        if i == l then
            A(:,index) = A(:,index);
           end 
    end
    
    
    
endfunction
