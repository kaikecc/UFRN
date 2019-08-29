entity mux14x7 is
  
  port( A1, B1: in bit_vector(6 downto 0); 
  SEL1: in bit;
    
        S1 : out bit_vector(6 downto 0));
end;

architecture ckt of mux14x7 is

component mux2x1 is
  
  port( Ea, Eb, SEL: in bit;
    
        Saida : out bit);
end component;

signal AUXM: bit_vector(6 downto 0);
begin

M0: mux2x1 port map(
  
        Ea => A1(0),
        Eb => B1(0),
        SEL => SEL1,
        Saida => AUXM(0));
        
M1: mux2x1 port map(
  
        Ea => A1(1),
        Eb => B1(1),
        SEL => SEL1,
        Saida => AUXM(1));
M2: mux2x1 port map(
  
        Ea => A1(0),
        Eb => B1(0),
        SEL => SEL1,
        Saida => AUXM(0));
M3: mux2x1 port map(
  
        Ea => A1(3),
        Eb => B1(3),
        SEL => SEL1,
        Saida => AUXM(3));
M4: mux2x1 port map(
  
        Ea => A1(4),
        Eb => B1(4),
        SEL => SEL1,
        Saida => AUXM(4));
M5: mux2x1 port map(
  
        Ea => A1(5),
        Eb => B1(5),
        SEL => SEL1,
        Saida => AUXM(5));
M6: mux2x1 port map(
  
  
        Ea => A1(6),
        Eb => B1(6),
        SEL => SEL1,
        Saida => AUXM(6));
S1 <= AUXM;      
        
  
  
end ckt;

