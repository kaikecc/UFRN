

library ieee;
use ieee.std_logic_1164.all;

entity main is
  
port( a : in std_logic;
		b : out std_logic);
  
  
end;

architecture ckt of main is

component mde_b is
port ( clk , r , wr, rd, reset, eq: in std_logic ;
rear_clr, rear_inc, front_clr, front_in, rf_wr, rf_rd, full, empty : out std_logic );
end component;

begin

end ckt;