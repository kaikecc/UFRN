clc
clear all


function [x] = f(n)
    
    x = (0.9*exp(i*%pi/3))^3;
    
endfunction

function [X] = dtft(x,n,w)
    
 n = N1:1:N2;
 k = -M:1:(M-1);
 
 for i = 0:N
     for n = N1:N2
         
         X = f(n)*(exp(-i*(%pi/M)*n'*k));
 end
    
    
    
endfunction
