

// s --> sinal de dados
// fs --> frequencia de amostragem do sinal 
function [S, frequency, fc] = my_fft(s,fs)
    
    normal = length(s);
    aux = 0:normal-1;
    T = normal/fs;
    
    frequency = aux/T;
    S = fft(s) / normal;
    fc = ceil(normal/2);
    S = S(1:fc);  
    
     plot(frequency(1:fc), abs(S));   
           
endfunction
