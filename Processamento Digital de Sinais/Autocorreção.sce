clc
clear all;
/*
Determine computacionalmente (preferencialmente por MATLAB) uma aproximação da autocorrelação Rxx(n, τ ), para n = 1, 2, 3, . . . , N; τ = 1, 2, 3, . . . , N, de um ruído AWGN
estacionário de média nula e densidade espectral de potência igual a 1. 

Dica1: A autocorrelação pode ser aproximada por R˜xx[n, τ ] = (1/L) sumatorio(xl[n]. ∗ xl[n − τ ].
Dica2: As amostras do ruído são variáveis aleatórias gaussianas independentes e identicamente distribuídas, com
média nula e variância unitária, logo podem ser geradas por uma função equivalente a função
do MATLAB: randn (1, N ∗L). Defina um algoritmo, apresente gráficos da autocorrelação e
analise os resultados considerando sinais de ruído com N ∗L amostras, para N = 10, 50, 100,
e L = 50, 500, 5000, em que L é o número de blocos utilizados no cálculo do sinal médio
(aproximação) de Rxx(n, τ ).

clc 
clear all;

N = input("DIGITE O VALOR DE N: ");
L = input("DIGITE O VALOR DE L: ");

// Função que recebe os valores de entrada e executa a autocorreção
function [Rx]=Rxx(N, L)   
     
   
    x = rand(1,N*L, "normal");  // cria um vetor de amostra de dimensão N * L
    
    Rx = zeros(N,N); // inicia uma matriz N por N com zeros
       
   for l = 0:L-1 // faz o somatório de L blocos 
       
       x_l = x(1+l*N: N+ l*N);// vetor que recebe uma pequena parte do vetor x
         
       for t = 0: N-1 // construção da matriz
           
         x_aux = zeros(1,N);// cria um vetor auxilia de  N posicoes 
         
         x_aux(1:N-t) = x_aux(1:N-t) + x_l(1+t:N);
         
         Rx(t + 1, :) =  x_l.*x_aux + Rx(t+1, :);// preenche a matriz 
     end
          
    end
    
    Rx = Rx/L;// tira a media elemento a elemento
    
    figure// plota o grafico
    mesh(abs(Rx))// tira o módulo
    
   
endfunction

// mostra os resultados
 [Rx]=Rxx(N, L)
