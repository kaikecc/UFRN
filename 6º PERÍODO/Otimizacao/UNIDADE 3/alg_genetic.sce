
/*


1. Gerar a população inicial.
2. Avaliar cada indivíduo da população.
3. Enquanto critério de parada nao for satisfeito faça
    3.1 Selecionar os individuos mais aptos.
    3.2 Criar novos indivíduos aplicando os operadores crossover e mutaçao.
    3.3 Armazenar os novos indivíduos em uma nova população.
    3.4 Avaliar cada cromossomo da nova população.
*/

function y = f(x)
    
    y = x.^2 - 3.x + 4;
    
endfunction

function I = individuos(a,b,n)
    
    u = length(dec2bin(max(a,b)));
    i = 0;
    q = zeros(1,n);
    I = zeros(u+1,n);
    
    while i < n
        
      i = i + 1;  
      q(i) = ceil(rand(1,'uniform')*(max(a,b)));  
      /*
      if q(i) < (max(a,b)/2) then
         q(i) = q(i) * (-1);
      end
       */     
    end
    
    
    for i = 1:u+1
        
        v = strsplit(dec2bin(abs(q(i))),1:length(dec2bin(abs(q(i))))-1);
        
        for j = 1:n
                                        
            I(i,j) = v(j);
        
        end
     end  
   
    
    
    
endfunction
