clc
clear all

// Matriz de coeficientes
A = [1,-12,-15,0,0,0,0;0,1,0,1,0,0,0;0,0,1,0,1,0,0;0,1,1,0,0,1,0;0,1,3,0,0,0,1];
// vetor solucao 
b = [0;3;4;6;13];



function [zo] = simplex(A,b)

    q = zeros(1,length(b)-1); // vetor do Fator Limitante

    m = -1;

    while m < length(A(1,:))


        a = min(A(1,:)); // menor valor da primeira linha  (variavel nao basica)  
        
        //***** SÓ PRA SABER O INDICE DE UMA LINHA DE MATRIX
        aux = A(1,:);        
        index = find(aux == a);
        //*****

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

//************** ROLE PRA ZERAR ELEMENTOS ******************
        for j = 1: length(A(:,1))

            if j == l+1 then
                
                A(j,:) = A(j,:);
                
                b(j) = b(j);
                
            else
                pivo = (A(j,index)/A(l+1,index))
                 b(j) = b(j) - pivo*b(l+1);
                 
                 for k = 1:length(A(1,:))
                     
               // A(j ,index) =  A(j,index) - (A(j,index)/A(l+1,index)) * A(l+1,index);
                A(j ,k) =  A(j,k) - (A(j,index)/A(l+1,index))pi * A(l+1,k);
                
                end
               
            end 

    end
    //*********************
    
       // ****** DECIDIR A HORA DE ACABAR ******
       
        linha1 = A(1,:);
        negativos = find(linha1 < 0);

        if length(negativos) < 0 then
            m = length(A(1,:)) + 1;
        end
        
        //***********



    end

    zo = b(1);


endfunction

