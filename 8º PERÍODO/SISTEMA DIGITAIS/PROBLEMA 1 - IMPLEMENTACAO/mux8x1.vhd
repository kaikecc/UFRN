
library ieee;
use ieee.std_logic_1164.all;


entity mux8x1 is
  
  port( SL: in std_logic_vector(2 downto 0);
        E_IN: in std_logic_vector(7 downto 0);
        M8: out std_logic);
        
end;


architecture circuito of mux8x1 is
 
 
signal M_AUX : std_logic_vector(7 downto 0);

begin


M_AUX(0) <= E_IN(0) and not SL(0) and not SL(1) and not SL(2); -- 000
M_AUX(1) <= E_IN(1) and not SL(0) and not SL(1) and     SL(2); -- 001
M_AUX(2) <= E_IN(2) and not SL(0) and 	   SL(1) and not SL(2); -- 010
M_AUX(3) <= E_IN(3) and not SL(0) and     SL(1) and 	  SL(2); -- 011
M_AUX(4) <= E_IN(4) and 	 SL(0) and not SL(1) and not SL(2); -- 100
M_AUX(5) <= E_IN(5) and 	 SL(0) and not SL(1) and     SL(2); -- 101
M_AUX(6) <= E_IN(6) and		 SL(0) and     SL(1) and not SL(2); -- 110
M_AUX(7) <= E_IN(7) and     SL(0) and     SL(1) and     SL(2); -- 111

M8 <= M_AUX(0) or M_AUX(1) or M_AUX(2) or M_AUX(3) or M_AUX(4) or M_AUX(5) or M_AUX(6) or M_AUX(7);
    
end circuito;
