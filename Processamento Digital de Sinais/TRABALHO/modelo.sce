//fss = 10000;

//[acc] = sensor(10000,620,15)
function [acc] = sensor(f_s,freq_fund,A)

t = [0:1/f_s:10];

f = freq_fund;

Amp = A;

acc = 0;

for i = 1:2:1000
    
    distancia = (Amp/i)*sin(2*%pi*i*f.*t);
    
        
    acc = acc + distancia;
end

//my_fft(acc,10000);

endfunction
