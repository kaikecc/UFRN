entity datapath is
  
  port(aa,b: in bit_vector(7 downto 0);
  tot_ld, tot_clr, clkk: in bit;
  tot_It_s: out bit);
  
end;

architecture ckt of datapath is
 
component reg8bit is
  port( 
  clk: in bit;
  CLR: in bit;
  ENTRADAS: in bit_vector(7 downto 0);
  Qsaidas: out bit_vector(7 downto 0));
  
end component;
 
component mux16x8 is
  
  port( ENTA, ENTB: in bit_vector(7 downto 0);
        SELECIONAR: in bit;
    
        SS : out bit_vector(7 downto 0));
end component;

component comparador8bit is
  
  port(Xx, Yy : in bit_vector(7 downto 0);
      A_igual_B, AA_maior_BB, AA_menor_BB: out bit);
      
end component;

component somador8bit is
  
  port( X, Y: in bit_vector(7 downto 0);
        Ce: in bit;
        Z: out bit_vector( 7 downto 0);
        Cs: out bit);
end component;

signal SaidaM, SaidaR, SaidaS: bit_vector(7 downto 0);
signal s0: bit;

begin

  
MUX: mux16x8 port map(

    ENTA => SaidaR, 
    ENTB => SaidaS,
    SELECIONAR => tot_ld, 
    SS => SaidaM);
  
REG8: reg8bit port map(
    
       clk => clkk,
       CLR => tot_clr,
       ENTRADAS => SaidaM,
       Qsaidas => SaidaR);
          
COMP: comparador8bit port map( -- pode dá problema aqui
  
    Xx => b,
    Yy => SaidaR,
    AA_menor_BB => s0);
    
ADDER: somador8bit port map(
    
       X => aa,
       Y => SaidaR,
       Ce => '0',
       Z => SaidaS);
       
        
        
    
  tot_It_s <= s0;
end ckt;