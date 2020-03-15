
library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
  
  port( Ea, Eb, SEL: in std_logic;
    
        Saida : out std_logic);
end;

architecture ckt_mux2x1 of mux2x1 is
  
 begin
  
  Saida <= (Ea and not(SEL)) or ( Eb and (SEL));
  
end ckt_mux2x1;
