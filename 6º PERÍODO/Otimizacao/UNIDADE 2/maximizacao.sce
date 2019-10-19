
function [Zo, A, b] = maximizacao(matriz_aumentada)

    dim = size(matriz_aumentada);// vetor que tem a qnt de linhas por qnt de colunas


    A = matriz_aumentada(:,1:dim(2)-1);// Matriz de coeficientes
    b = matriz_aumentada(:,dim(2));// vetor de resultados

    
    linha1 = A(1,2:dim(2)-1); // A(1,:);// primeira linha da matriz de coeficientes
    
    interacao = 0;

    m = -1;// para iniciar o while

    while m < length(linha1)

      p = max(linha1); // menor valor da primeira linha  (variavel nao basica)
        
      [A , b] = simplex(A, b, p)


        // ****** PRA DECIDIR A HORA DE ACABAR ******       
        linha1 = A(1,2:dim(2)-1);
        negativos = length(find(linha1 < 0));
        if  negativos <= 0 then
            m = length(linha1) + 1;
        end

        //******************************************
        interacao = interacao + 1;
    end
    
    Zo = b(1);
    
     printf('O valor otimo de z = %5.2f',Zo); 
    disp('Matriz de coeficientes: ');
    disp(A);
    disp('Vetor solução: ');
    disp(b);

    salvar(A,b);
    
endfunction
