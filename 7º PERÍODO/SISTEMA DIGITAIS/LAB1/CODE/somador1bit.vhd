library ieee;
use ieee.std_logic_1164.all;

entity somador1bit is
  
  port( S11, S12, Cin: in std_logic;
        S, Cout: out std_logic
         );
end;

architecture ckt of somador1bit is
  
 begin
   
   S <= (S11 xor S12) xor Cin;
   Cout <= ((S11 xor S12) and Cin) or (S11 and S12);
  
end ckt;
