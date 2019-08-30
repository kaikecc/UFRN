// METODO SIMPLEX PARA PROBLEMAS DE MAXIMIZACAO
clc
clear all

arq = uigetfile("*.txt","C:\Users\kaike\Desktop\UFRN\6° PERÍODO\OTIMIZAÇÃO\Exercicios\","Escolha um arquivo .txt: "); // Funcao para pegar um arquivo
matriz_aumentada = fscanfMat(arq);// pega o arquivo de formato especificado 

function metodo = simplex(matriz_aumentada)


    dim = size(matriz_aumentada);// vetor que tem a qnt de linhas por qnt de colunas


    A = matriz_aumentada(:,1:dim(2)-1);// Matriz de coeficientes
    b = matriz_aumentada(:,dim(2));// vetor de resultados

    q = zeros(1,length(b)-1); // vetor do Fator Limitante
    linha1 = A(1,:);// primeira linha da matriz de coeficientes
    vb = length(q)-1:1:length(linha1)-1;
    
    interacao = 0;

    m = -1;// para iniciar o while


    while m < length(linha1)
      
        a = min(linha1); // menor valor da primeira linha  (variavel nao basica)        

        //***** SÓ PRA SABER O INDICE DE UMA LINHA DE MATRIX
        interacao = interacao + 1;
        index = find(linha1 == a);
        //*****************
        if length(index) > 1 then
            index = index(1);
        end

        // tá bom para achar o vetor de fator limitante
        for i = 1:length(b)-1

            if A(i+1,index) <= 0 then // tanto divisao por zero e o denominador negativo dever ser excluido
                q(i) = 100000; // VALOR BEM GRANDE PARA SER EXCLUIDO NA FUNCAO min
            else
                q(i) = b(i+1) / A(i+1,index);
            end
        end


        ql = min(q);// Fator Limitante
        l = find(q == ql); // indice  que identifica a posicao no conjunto B que deve deixar a base
        
        
        vb(l) = index - 1;
        //************** ROLE PRA ZERAR ELEMENTOS ******************
        for j = 1: length(A(:,1))
            
           
            
            if j == l+1 then

                A(j,:) = A(j,:);

                b(j) = b(j);

            else
                pivo = (A(j,index)/A(l+1,index));
               
                b(j) = b(j) - pivo*b(l+1);

                for k = 1:length(linha1)

                    A(j ,k) =  A(j,k) - pivo * A(l+1,k);

                end

            end 
     
    end
    
                A(l+1,:) = A(l+1,:) * (1/A(l+1,index));

                b(l+1) = b(l+1) * (1/A(l+1,index));
        //*********************


        // ****** PRA DECIDIR A HORA DE ACABAR ******       
        linha1 = A(1,:);
        negativos = find(linha1 < 0);
        if length(negativos) <= 0 then
            m = length(linha1) + 1;
        end

        //******************************************
        
    end
      
   
    printf('O valor otimo de z = %5.2f',b(1)); 
    printf('\n Numero de interacoes = %5.1f',interacao);
    disp('Os indices da base: ');
    //disp(gsort(unique(vb(1:interacao+1))));
    disp(((vb(1:interacao+1))));
    disp('Matriz de coeficientes: ');
    disp(A);
    disp('Vetor solução: ');
    disp(b);
    salvar(A,b);  
    
    metodo = 0;

endfunction


simplex(matriz_aumentada)

