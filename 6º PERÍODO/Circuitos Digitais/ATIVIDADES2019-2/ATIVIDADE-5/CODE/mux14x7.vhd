entity mux14x7 is
  
  port(SELI: in bit;
  AI, BI: in bit_vector(6 downto 0);  
  SI :   out bit_vector(6 downto 0));
end;

architecture ckto of mux14x7 is

component mux2x1 is
  
port( Ea, Eb, SEL: in bit;    
        Saida : out bit);
end component;

signal AUXM: bit_vector(6 downto 0);
begin

M0: mux2x1 port map(
  
        Ea => AI(0),
        Eb => BI(0),
        SEL => SELI,
        Saida => AUXM(0));
        
M1: mux2x1 port map(
  
        Ea => AI(1),
        Eb => BI(1),
        SEL => SELI,
        Saida => AUXM(1));
        
M2: mux2x1 port map(
  
        Ea => AI(2),
        Eb => BI(2),
        SEL => SELI,
        Saida => AUXM(2));
        
M3: mux2x1 port map(
  
        Ea => AI(3),
        Eb => BI(3),
        SEL => SELI,
        Saida => AUXM(3));
M4: mux2x1 port map(
  
        Ea => AI(4),
        Eb => BI(4),
        SEL => SELI,
        Saida => AUXM(4));
        
M5: mux2x1 port map(
  
        Ea => AI(5),
        Eb => BI(5),
        SEL => SELI,
        Saida => AUXM(5));
        
M6: mux2x1 port map( 
  
        Ea => AI(6),
        Eb => BI(6),
        SEL => SELI,
        Saida => AUXM(6));
        
SI(6 downto 0) <= AUXM(6 downto 0);      
        
    
end ckto;

