library ieee;
use ieee.std_logic_1164.all;

entity Display_VAL is
  port( 
  clk_Display_VAL: in std_logic;
  clr_Display_VAL: in std_logic;
  ld_Display_VAL: in std_logic;
  data_Display_VAL: in std_logic_vector(7 downto 0);
  Qs_Display_VAL: out std_logic_vector(7 downto 0));
  
end;

architecture ckt_Display_VAL of Display_VAL is

component reg4bit is
  port( 
  clk_reg4bit: in std_logic;
  clr_reg4bit: in std_logic;
  load: in std_logic;
  I_reg4bit: in std_logic_vector(3 downto 0);
  Qs_reg4bit: out std_logic_vector(3 downto 0));
  
end component;

signal REG_OUT: std_logic_vector(7 downto 0);
begin

REG1: reg4bit port map(
      clk_reg4bit => clk_Display_VAL,
		clr_reg4bit => clr_Display_VAL,
		load => ld_Display_VAL,
		I_reg4bit => data_Display_VAL(3 downto 0),
		Qs_reg4bit => REG_OUT(3 downto 0));

REG2: reg4bit port map(
      clk_reg4bit => clk_Display_VAL,
		clr_reg4bit => clr_Display_VAL,
		load => ld_Display_VAL,
		I_reg4bit => data_Display_VAL(7 downto 4),
		Qs_reg4bit => REG_OUT(7 downto 4));
		
Qs_Display_VAL <= REG_OUT;

end ckt_Display_VAL;