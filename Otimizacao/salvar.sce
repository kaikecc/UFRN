function guardar = salvar(B,c)
    
    a = [B c];
    arq = uigetfile("*.txt","C:\Users\kaike\Desktop\UFRN\6° PERÍODO\OTIMIZAÇÃO\Exercicios\","Salvar arquivo .txt: "); // Funcao para pegar um arquivo

  //  Cabecalho = [" Metodo Simplex "; "z x1 x2 x3 x4 x5 x6 = b"];
  
    fprintfMat(arq,a,"%5.2f");
    guardar = 0;
    
endfunction
