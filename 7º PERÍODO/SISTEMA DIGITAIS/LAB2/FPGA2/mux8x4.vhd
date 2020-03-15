
library ieee;
use ieee.std_logic_1164.all;


entity mux8x4 is
  
  port( Ea_4bits, Eb_4bits: in std_logic_vector(3 downto 0);
		  SEL_4bits: in std_logic;
    
        S_4bits : out std_logic_vector(3 downto 0));
end;

architecture ckt_mux8x4 of mux8x4 is
  
component mux2x1 is
  
  port( Ea, Eb, SEL: in std_logic;
    
        Saida : out std_logic);
end component;

 begin
  
  
M0: mux2x1 port map(Ea_4bits(0), Eb_4bits(0), SEL_4bits, S_4bits(0));
M1: mux2x1 port map(Ea_4bits(1), Eb_4bits(1), SEL_4bits, S_4bits(1));
M2: mux2x1 port map(Ea_4bits(2), Eb_4bits(2), SEL_4bits, S_4bits(2));
M3: mux2x1 port map(Ea_4bits(3), Eb_4bits(3), SEL_4bits, S_4bits(3));
  
end ckt_mux8x4;
