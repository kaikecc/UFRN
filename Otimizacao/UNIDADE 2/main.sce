
clc
clear all

disp("MAXIMIZAÇÃO                         - [1]");
disp("MINIMIZAÇÃO                         - [2]");
disp("DETERMINAÇÃO PARA UMA SOLUÇÃO ÓTIMA - [3]");

opc = input("ESCOLHA UMA OPÇÃO: ");

arq = uigetfile("*.txt","C:\Users\kaike\Desktop\UFRN\Otimizacao\UNIDADE 1\Exercicios\","Escolha um arquivo .txt: "); // Funcao para pegar um arquivo
matriz_aumentada = fscanfMat(arq);// pega o arquivo de formato especificado 


function metodo = main(matriz_aumentada)

   
    select opc

    case 1 then 
        //    [Zo, A, b] = maximizacao(matriz_aumentada);
        disp("ENTROU EM MAX");
    case 2 then
        //  [Zo, A, b] = minimizacao(matriz_aumentada);   
        disp("ENTROU EM MIN");
    case 3 then
            
    else
        break;
    end

    
    metodo = 0; 
endfunction

main(matriz_aumentada)
