// MÉTODO DO PROCESSO DO CUSTO MINIMO

clc
clear all
matriz_aumentada = [20,15,10,50;12,8,16,70;20,40,60,0];


function SI = customin(matriz_aumentada)

    dim = size(matriz_aumentada);

    A = matriz_aumentada(1:dim(1)-1,1:dim(2)-1);// Matriz de coeficientes
    oferta = matriz_aumentada(1:dim(1)-1,dim(2));// vetor de resultados
    demanda = matriz_aumentada(dim(1),1:dim(2)-1);// vetor de resultados
    AUX = zeros(dim(1)-1,dim(2)-1);
    B = A;
    index = zeros(1,2);
    menor_valor = 10000;
    m = -1;

    while m < 0

        for i = 1:length(oferta)

            for j = 1:length(demanda) 

                if  A(i,j) < menor_valor then
                    menor_valor = A(i, j) ;
                    index = [i,j];
                end
            end
        end

        
        if ((oferta(index(1))) == 0 & (demanda(index(2))) == 0) then

            A(index(1), index(2)) = 10000;
            menor_valor = 10000;
        else 
            if oferta(index(1)) - demanda(index(2)) < 0 then

                A(index(1), index(2)) = oferta(index(1));
                AUX(index(1), index(2)) = oferta(index(1));
                demanda(index(2)) = abs(oferta(index(1)) - demanda(index(2)));
                oferta(index(1)) = 0;

            else

                A(index(1), index(2)) = demanda(index(2)); 
                AUX(index(1), index(2)) = demanda(index(2));           
                oferta(index(1)) = oferta(index(1)) - demanda(index(2));
                demanda(index(2)) = 0;
            end
            menor_valor = 10000;

        end

        if (length(find(oferta == 0)) == length(oferta)) then
            m = 1;
        end
    end

   
    disp("Matriz de solução inicial: ");
    disp(AUX);
    disp("Oferta: ");
    disp(oferta);
    disp("Demanda: ");
    disp(demanda);
    
    disp("zo: ");
    disp(sum(AUX .* B));
 SI = 0;

endfunction

customin(matriz_aumentada)
