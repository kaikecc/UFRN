clc
clear all

N1 = 0;
N2 = 10;
M = 0.1;

function [X] = dtft(N1,N2,M)
    
 n = N1:1:N2;
 k = -M:(M/(length(n)/2)):M;
 
 X = zeros(1,N2);
 X_aux = zeros(1,N2);
  
    for i = N1:N2-1
        
             X_aux(i + 1) = ((0.9 * exp(%i.*%pi/3)).^n(i+1)) * (exp(-%i*(%pi/M) .* n(i+1)' .* k(i+1)));
         
        for j = N1:N2-1
             X(j + 1) = X_aux(j + 1) + X(j + 1);
        end    
    end
 
    
    
endfunction

[X] = dtft(N1,N2,M)

plot2D(abs(X))
    
