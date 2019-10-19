entity cp2bit is
  port (EE: in bit_vector(3 downto 0);
        B : in bit_vector(3 downto 0);
        SLC: in bit;
        W : out bit_vector(3 downto 0));
   
end;

architecture ckt_cp of cp2bit is
  
  component mux2x1 is
  
  port( Ea, Eb, SEL: in bit;
    
        Saida : out bit);
end component ;

signal Qm: bit_vector(3 downto 0);

  begin
  
M0: mux2x1 port map(
  Ea => EE(0),
  Eb => B(0),
  SEL => SLC,
  Saida => Qm(0));

M1: mux2x1 port map(
  Ea => EE(1),
  Eb => B(1),
  SEL => SLC,
  Saida => Qm(1));
  
M2: mux2x1 port map(
  Ea => EE(2),
  Eb => B(2),
  SEL => SLC,
  Saida => Qm(2));
  
M3: mux2x1 port map(
  Ea => EE(3),
  Eb => B(3),
  SEL => SLC,
  Saida => Qm(3));
  
  W <= Qm;
end ckt_cp;