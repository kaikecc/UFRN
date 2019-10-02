
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
    
    u = length(max(a,b));
    
    
    I = zeros(5,u+1);
    
    
    
    for i = 0:5
        for j = 0:u
              
            if                   
            I(i,j) = r;
        
        end
     end  
    
    
    
endfunction
