library ieee;
use ieee.std_logic_1164.all;

entity somador8bit is
  
  port( S81, S82: in std_logic_vector(7 downto 0);
        Ce: in std_logic;
        Z: out std_logic_vector( 7 downto 0);
        Cs: out std_logic);
end;

architecture ckt of somador8bit is
  
component somador1bit is
  
  port( S11, S12, Cin: in std_logic;
        S, Cout: out std_logic
         );
end component;


signal Co: std_logic_vector(7 downto 0);--Cout
signal O:  std_logic_vector(7 downto 0); -- saída

begin
 
S0: somador1bit port map(

    S11 => S81(0),
    S12 => S82(0),
    Cin => Ce,
    S => O(0),
    Cout => Co(0));  
   
S1: somador1bit port map(

    S11 => S81(1),
    S12 => S82(1),
    Cin => Co(0),
    S => O(1),
    Cout => Co(1));  
S2: somador1bit port map(

    S11 => S81(2),
    S12 => S82(2),
    Cin => Co(1),
     S => O(2),
    Cout => Co(2)); 
S3: somador1bit port map(

    S11 => S81(3),
    S12 => S82(3),
     S => O(3),
    Cin => Co(2),
    Cout => Co(3));   
S4: somador1bit port map(

    S11 => S81(4),
    S12 => S82(4),
    Cin => Co(3),
     S => O(4),
    Cout => Co(4));
S5: somador1bit port map(

    S11 => S81(5),
    S12 => S82(5),
    Cin => Co(4),
     S => O(5),
    Cout => Co(5));
S6: somador1bit port map(

    S11 => S81(6),
    S12 => S82(6),
    Cin => Co(5),
     S => O(6),
    Cout => Co(6));
S7: somador1bit port map(

    S11 => S81(7),
    S12 => S82(7),
    Cin => Co(6),
    S => O(7),
    Cout => Co(7));
    
  Cs <= Co(7);    
  Z <= O;  
      
end ckt;

