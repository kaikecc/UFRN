library ieee ;
use ieee . std_logic_1164 . all;

entity CLK_Div is
port ( clk_in : in std_logic;
clk_out : out std_logic );
end CLK_Div;

architecture ckt of CLK_Div is
  
signal ax : std_logic;

begin
  
process ( clk_in )
variable cnt : integer range 0 to 13500000 := 0;
begin
if ( rising_edge ( clk_in )) then
if ( cnt =13500000) then
cnt :=0;
ax <= not ax ;
else
cnt := cnt +1;
end if ;
end if ;
end process ;
clk_out <= ax ;
end ckt ;
