entity cp4bit is
  port (
    E0: in bit_vector(3 downto 0); -- recebem as saidas do flipflop
    E1: in bit_vector(3 downto 0); -- recebe o valor pra iniciar
    E2: in bit_vector(3 downto 0); -- E2(3) => '0', e o resto recebe as saidas do flipflops
    E3: in bit_vector(3 downto 0); -- por enquanto tudo zero
       
    SS: in bit_vector(1 downto 0); -- SELETOR 2 BITS
    
    V: out bit_vector(3 downto 0)); -- entradas do flipflops
end;

architecture ckt_cp4 of cp4bit is
  
component mux4x1 is
  
  port( E: in bit_vector(3 downto 0);
      SEL: in bit_vector(1 downto 0);
    
        Saida : out bit);
        
end component; 


signal AUX: bit_vector(3 downto 0);

begin
  
   M0: mux4x1 port map(
 
      E(0) => E0(0),
      E(1) => E1(0),
      E(2) => E2(0),
      E(3) => E3(0),
            
      SEL(0) => SS(0),
      SEL(1) => SS(1),
      
      Saida => AUX(0));
      
 M1: mux4x1 port map(
 
      E(0) => E0(1),
      E(1) => E1(1),
      E(2) => E2(1),
      E(3) => E3(1), 
           
      SEL(0) => SS(0),
      SEL(1) => SS(1),
      
      Saida => AUX(1));
      
   M2: mux4x1 port map(
 
      E(0) => E0(2),
      E(1) => E1(2),
      E(2) => E2(2),
      E(3) => E3(2),
           
      SEL(0) => SS(0),
      SEL(1) => SS(1), 
           
      Saida => AUX(2));
      
 M3: mux4x1 port map(
 
      E(0) => E0(3),
      E(1) => E1(3),
      E(2) => E2(3),
      E(3) => E3(3), 
           
      SEL(0) => SS(0),
      SEL(1) => SS(1), 
           
     Saida => AUX(3));
  
  V <= AUX;

end ckt_cp4;
