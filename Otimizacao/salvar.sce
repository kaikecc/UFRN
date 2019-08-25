function guardar = salvar(B,c)
    
    a = [B c];
    arq = uigetfile("*.txt",pwd(),"Salvar arquivo .txt: ");
  //  Cabecalho = [" Metodo Simplex "; "z x1 x2 x3 x4 x5 x6 = b"];
  
    fprintfMat(arq,a,"%5.1f");
    guardar = 0;
    
endfunction
