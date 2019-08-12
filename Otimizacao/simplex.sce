


// Matriz de coeficientes
A = [1,-12,-15,0,0,0,0;0,1,0,1,0,0,0;0,0,1,0,1,0,0;0,1,1,0,0,1,0;0,1,3,0,0,0,1]
// vetor solucao 
b = [0;3;4;6;13];



function [zo] = simplex(A,b)

    q = zeros(1,length(b)-1); // vetor do Fator Limitante

    m = -1;

    while m < length(A(1,:))


        a = min(A(1,:)); // menor valor da primeira linha  (variavel nao basica)  
        //*****
        aux = A(1,:);        
        index = find(aux == a);
        //*****

        // tá bom para achar o vetor de fator limitante
        for i = 1:length(b)-1
            if abs(A(i+1,index)) == 0 then
                q(i) = 100000; // VALOR BEM GRANDE PARA SER EXCLUIDO NA FUNCAO min
            else
                q(i) = b(i+1) / abs(A(i+1,index));
            end
        end


        ql = min(q);// Fator Limitante

        l = find(q == ql); // indice que identifica a posicao no conjunto B que deve deixar a base

        for j = 1: length(A(:,index))

            if j == l+1 then
                A(j,index) = A(j,index);
                b(j) = b(j);
            else
                A(j ,index) =  A(j,index) - (A(j,index)/A(l+1,index)) * A(l+1,index);

                b(j) = b(j) - (A(j,index)/A(l+1,index))*b(l+1);
            end 

        end

        linha1 = A(1,:);
        negativos = find(linha1 < 0);

        if length(negativos) < 0 then
            m = length(A(1,:)) + 1;
        end



    end

    zo = b(1);

endfunction


