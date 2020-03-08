library ieee;
use ieee.std_logic_1164.all;

entity datapath is
  
  port(a_dat,s_dat: in std_logic_vector(7 downto 0);
  tot_ld_dat, tot_clr_dat, clk_dat: in std_logic;
  tot_It_s_dat: out std_logic;
  out_reg8bit: out std_logic_vector(7 downto 0));
  
end;

architecture ckt_dat of datapath is


signal  out_mux, out_reg, out_somar: std_logic_vector(7 downto 0);
signal s0: std_logic;


component reg8bit is
  port( 
  clk_reg8bit: in std_logic;
  clr_reg8bit: in std_logic;
  E_reg8bit: in std_logic_vector(7 downto 0);
  Qs_reg8bit: out std_logic_vector(7 downto 0));
  
end component;
 
component mux16x8 is
  
  port( ENTA, ENTB: in std_logic_vector(7 downto 0);
        SELECIONAR: in std_logic;    
        SS : out std_logic_vector(7 downto 0));
end component;

component comparador8bit is
  
  port(X, Y : in std_logic_vector(7 downto 0);
      X_igual_Y, X_maior_Y, X_menor_Y: out std_logic);
      
end component;

component somador8bit is
  
  port( S81, S82: in std_logic_vector(7 downto 0);
        Ce: in std_logic;
        Z: out std_logic_vector( 7 downto 0);
        Cs: out std_logic);
end component;


begin

  
MUX: mux16x8 port map(

    ENTA => out_reg, 
    ENTB => out_somar,
    SELECIONAR => tot_ld_dat, 
    SS => out_mux);
    
   
  
REG8: reg8bit port map(
    
       clk_reg8bit => clk_dat,
       clr_reg8bit => tot_clr_dat,
       E_reg8bit => out_mux,
       Qs_reg8bit => out_reg);
       
    
         
COMP: comparador8bit port map( -- pode dá problema aqui
  
    X => out_reg,
    Y => s_dat,
    X_menor_Y => s0);
    
    
    
ADDER: somador8bit port map(
    
       S81 => a_dat,
       S82 => out_reg,
       Ce => '0',
       Z => out_somar);
    
    
tot_It_s_dat <= s0;
out_reg8bit <= out_mux;

end ckt_dat;