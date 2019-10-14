
function [Zo, A, b] = maximizacao(matriz_aumentada)

    dim = size(matriz_aumentada);// vetor que tem a qnt de linhas por qnt de colunas


    A = matriz_aumentada(:,1:dim(2)-1);// Matriz de coeficientes
    b = matriz_aumentada(:,dim(2));// vetor de resultados

    q = zeros(1,length(b)-1); // vetor do Fator Limitante
    linha1 = A(1,:);// primeira linha da matriz de coeficientes
    //vb = length(q)-1:1:length(linha1)-1;
    vb = zeros(1,length(b)-1);
    interacao = 0;

    m = -1;// para iniciar o while

    while m < length(linha1)

        a = min(linha1); // menor valor da primeira linha  (variavel nao basica)
        
        simplex(a, A, b, q);


        // ****** PRA DECIDIR A HORA DE ACABAR ******       
        linha1 = A(1,:);
        negativos = find(linha1 < 0);
        if length(negativos) <= 0 then
            m = length(linha1) + 1;
        end

        //******************************************
        interacao = interacao + 1;
    end
    
    Zo = b(1);
    
endfunction
