
fa = 1000;

fsamp = fa;
 
 
 s1 = super_vec; 
 
 fp = 0.9; // freq de passagem
 fs = 1.4;// freq corte
 
 // normalizacao das freq
 wp = (fp/(fsamp/2))*%pi;
 ws = (fs/(fsamp/2))*%pi;
 
 wt = ws - wp; /// freq de transicao
 
 M = ceil((6.6*%pi/wt) + 1);// tabelado
 
 wc = (ws + wp)/2; // freq de corte intermediaria
 
hd = my_lowpass_ideal(wc,M);// func sinc para passa baixa ideial

w_hamm =window('hm',M);// calcula a janela de hamming

h = hd .* w_hamm;// faz a multiplicacao entre os vetores

s1_filtrado = conv(h,s1);// faz a convolucao entre os sinais

my_fft(s1_filtrado,fs);
