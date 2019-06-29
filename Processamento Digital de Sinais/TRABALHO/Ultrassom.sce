arq = uigetfile();// importar o arquivo ULTRASSOM_UNO
m = fscanfMat(arq);// cria uma matriz


t =   m(:,1);// primeira coluna = tempo em microsegundos
t_d = m(:,2); // segunda coluna = tempo dados em microsegundos


dis = t_d ./ 58; // distancia em cm

//***** gera vetor de diferencas de tempo entre uma amostra e outra ******
dif = zeros(length(t),1);

for i = 1:127            
    dif(i,1) = t(129 - i) - t(129 - (1 + i));
end
for j = 1:127
    dif(j,1) = dif(129-j);
end
// ************************************************************************
//*************** calculo do tamanho do super_vec
soma = 0;
for i = 1:length(t_d)    
    soma = soma + t_d(i);
end
soma1 = 0;
for(m = 1:length(dif))
    soma1 = soma1 + dif(m);
end
soma = soma + soma1; // muito grande o tamaho


//*************************  PROCEDIMENTO PARA AJUSTAR OS VALORES**************

    aux = 1;
    super_vec = zeros(soma,1); //588444 posicoes
    i = 0;
    
   while i < 128
       
        i = i + 1;
        for j = aux: (aux + t_d(i))
            super_vec(j,1) = dis(i);// 
        end;
        
         aux = (aux + t_d(i));
         
        for k = (aux + 1):(aux + dif(i))
            
            super_vec(k,1) = 0;         
        end;
        
        aux = aux + dif(i);
        
        i = i + 1;
    end
 //**********************************************************************
    
 fs = 1000; //freq de amostragem lembra de seguir o teorema de nirquit
   
 ts = 0:(1/fs):(1/fs)*(length(super_vec) - 1);// gera um vetor de tempo com base na freq de amostragem
   
 plot(ts,super_vec)
   
 my_fft(super_vec,fs);// Faz a FFT do sinal
   
 //****************************************************************
  // Salvar em arquivo txt os resultados
  
 // arq = uigetfile();// Cria um arq txt limpo
  
//  Cabecalho = ["Distancia pelo Tempo"; "Tempo Distancia"];
 // fprintfMat(arq, D, "%5.8f", Cabecalho);
  
  //*****************************
