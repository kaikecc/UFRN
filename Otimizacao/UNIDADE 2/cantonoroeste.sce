// MÉTODO DO CANTO NOROESTE

clc
clear all
//matriz_aumentada = [20,15,10,50;12,8,16,70;20,40,60,0];


function SI = noroeste(matriz_aumentada)
    dim = size(matriz_aumentada);

    A = matriz_aumentada(1:dim(1)-1,1:dim(2)-1);// Matriz de coeficientes
    AUX = A;
    oferta = matriz_aumentada(1:dim(1)-1,dim(2));// vetor de resultados
    demanda = matriz_aumentada(dim(1),1:dim(2)-1);// vetor de resultados




    for i = 1:length(oferta)

        for j = 1:length(demanda)           

            // COMEÇA AQUI
            if oferta(i) > 0 then   // 2           

                // é zero o valor da demanda ?
                if oferta(i) - demanda(j) == oferta(i) then // 1

                    A(i,j) = 0;
                   
                else

                    if oferta(i) - demanda(j) >= 0 then // 0

                        A(i,j) = demanda(j);  
                        oferta(i) = oferta(i) - demanda(j);
                        demanda(j) = 0;
                    else
                        A(i,j) = oferta(i);
                        demanda(j) = abs(oferta(i) - demanda(j));
                        oferta(i) = 0;

                    end // 0
                end // 1
            else
                A(i,j) = 0;
                
            end  //2 
        end
    end 
    disp("Matriz para solução inicial: ")
    disp(A);
    
    disp("Oferta: ");
    disp(oferta);
    
    disp("Demanda: ");
    disp(demanda);
    zo = sum(A .* AUX);

    disp("z = ");
    disp(zo);




    SI = A;


endfunction
noroeste(matriz_aumentada)
