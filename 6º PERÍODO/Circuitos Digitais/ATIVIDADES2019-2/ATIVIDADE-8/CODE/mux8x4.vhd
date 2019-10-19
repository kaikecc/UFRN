entity mux8x4 is
  
  port(E1, E2: in bit_vector(3 downto 0);
      SELEC: in bit;
      M: out bit_vector(3 downto 0));
      
end;
      
architecture cktt of mux8x4 is
  
component mux2x1 is
  
  port( Ea, Eb, SEL: in bit;
    
        Saida : out bit);
end component;

signal AUX: bit_vector(3 downto 0);

 begin
   
   M0: mux2x1 port map(
     Ea => E1(0),
     Eb => E2(0),
     SEL => SELEC,
     Saida => AUX(0));
     
   M1: mux2x1 port map(
     Ea => E1(1),
     Eb => E2(1),
     SEL => SELEC,
     Saida => AUX(1));
     
   M2: mux2x1 port map(
     Ea => E1(2),
     Eb => E2(2),
     SEL => SELEC,
     Saida => AUX(2));    
    
    M3: mux2x1 port map(
     Ea => E1(3),
     Eb => E2(3),
     SEL => SELEC,
     Saida => AUX(3));
     
     
    M <= AUX;
end cktt;

