GIT// METODO SIMPLEX 


function [A , b] = simplex(A, b, p)

    q = zeros(1,length(b)-1); // vetor do Fator Limitante
    
    linha1 = A(1,2:dim(2)-1); //    linha1 = A(1,:);
   
    index = find(linha1 == p);  //SÓ PRA SABER O INDICE DE UMA LINHA DE MATRIX
    index = index + 1;
    //vb = length(q)-1:1:length(linha1)-1;
    vb = zeros(1,length(b)-1);
    //******** CASO TENHA MAIS DE UM VALOR 
    if length(index) > 1 then
        index = index(1);
    end
    //*******************


    // tá bom para achar o vetor de fator limitante
    for i = 1:length(b)-1

        if A(i+1,index) <= 0 then // tanto divisao por zero e o denominador negativo dever ser excluido
            q(i) = 100000; // VALOR BEM GRANDE PARA SER EXCLUIDO NA FUNCAO min do fator limitante
        else
            q(i) = b(i+1) / A(i+1,index);
        end
    end


    ql = min(q);// Fator Limitante
    l = find(q == ql); // indice  que identifica a posicao no conjunto B que deve deixar a base


        // index --- controla quem entra base
        // l --- controla qm sai da base

    //************** ROLE PRA ZERAR ELEMENTOS ******************
    for j = 1: length(A(:,1))

        if j == l+1 then

            A(j,:) = A(j,:);

            b(j) = b(j);

        else
            pivo = (A(j,index)/A(l+1,index));

            b(j) = b(j) - pivo*b(l+1);

            for k = 1:length(A(1,:))

                A(j ,k) =  A(j,k) - pivo * A(l+1,k);

            end

        end 

    end

    A(l+1,:) = A(l+1,:) * (1/A(l+1,index));

    b(l+1) = b(l+1) * (1/A(l+1,index));
    //*********************



endfunction


// simplex(matriz_aumentada)

