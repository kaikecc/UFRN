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
close all;

N = input("DIGITE O VALOR DE N: ");
L = input("DIGITE O VALOR DE L: ");



function [autoCorr] = Rxx(N, L)
 */   
    clear all
    clc
   N = 10
   L = 50; 
   
    x = rand(1,N*L, "normal");
    
    
   Rx = zeros(N,N);
       
   for l = 0:L-1 
       
       x_l = x(1+l*N: N+ l*N);
         
       for t = 0: N-1
         x_aux = zeros(1,N);
         x_aux(1:N-t) = x_aux(1:N-t) + x_l(1+t:N);
         Rx(t + 1, :) =  x_l.*x_aux + Rx(t+1, :);
     end
          
    end
    
    Rx = Rx/L;
    
    figure
    mesh(abs(Rx))
//endfunction



