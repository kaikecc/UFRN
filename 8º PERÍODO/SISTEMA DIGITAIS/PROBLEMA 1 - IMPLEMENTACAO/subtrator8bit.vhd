

-- (SU81 - SU82) = A - B


library ieee;
use ieee.std_logic_1164.all;

entity subtrator8bit is
  
  port( SU81, SU82: in std_logic_vector(7 downto 0);
        Z_SU: out std_logic_vector( 7 downto 0);
        Cs_SU: out std_logic);
end;

architecture ckt of subtrator8bit is
  
component somador1bit is
  
  port( S11, S12, Cin: in std_logic;
        S, Cout: out std_logic
         );
end component;


signal Co: std_logic_vector(7 downto 0);--Cout
signal O:  std_logic_vector(7 downto 0); -- saída
signal AUXOR : std_logic_vector(7 downto 0);
begin
 
AUXOR(0) <= SU82(0) xor '1'; 

S0: somador1bit port map(

    S11 => SU81(0), -- A
    S12 => AUXOR(0), -- B
    Cin => '1', -- FUNCIONA COMO SUBTRATOR
    S => O(0),
    Cout => Co(0));  
   
AUXOR(1) <= SU82(1) xor '1'; 

S1: somador1bit port map(

    S11 => SU81(1),
    S12 => AUXOR(1),
    Cin => Co(0),
    S => O(1),
    Cout => Co(1));  
	 
AUXOR(2) <= SU82(2) xor '1'; 
	 
S2: somador1bit port map(

    S11 => SU81(2),
    S12 => AUXOR(2),
    Cin => Co(1),
     S => O(2),
    Cout => Co(2)); 
	 
AUXOR(3) <= SU82(3) xor '1'; 

S3: somador1bit port map(

    S11 => SU81(3),
    S12 => AUXOR(3),
     S => O(3),
    Cin => Co(2),
    Cout => Co(3));  

AUXOR(4) <= SU82(4) xor '1'; 
 
S4: somador1bit port map(

    S11 => SU81(4),
    S12 => AUXOR(4),
    Cin => Co(3),
     S => O(4),
    Cout => Co(4));
	 
AUXOR(5) <= SU82(5) xor '1'; 
	 
S5: somador1bit port map(

    S11 => SU81(5),
    S12 => AUXOR(5),
    Cin => Co(4),
     S => O(5),
    Cout => Co(5));
	 
AUXOR(6) <= SU82(6) xor '1'; 
	 
S6: somador1bit port map(

    S11 => SU81(6),
    S12 => AUXOR(6),
    Cin => Co(5),
     S => O(6),
    Cout => Co(6));

AUXOR(7) <= SU82(7) xor '1'; 
	 
S7: somador1bit port map(

    S11 => SU81(7),
    S12 => AUXOR(7),
    Cin => Co(6),
    S => O(7),
    Cout => Co(7));
    
  Cs_SU <= Co(7);    
  Z_SU <= O;  
      
end ckt;

