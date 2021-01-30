library ieee;
use ieee.std_logic_1164.all;

entity addr is
  port( 
  clk_addr: in std_logic;
  clr_addr: in std_logic;
  ld_addr: in std_logic;
  data_addr: in std_logic_vector(7 downto 0);
  Qs_addr: out std_logic_vector(7 downto 0));
  
end;

architecture ckt_addr of addr is

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
      clk_reg4bit => clk_addr,
		clr_reg4bit => clr_addr,
		load => ld_addr,
		I_reg4bit => data_addr(3 downto 0),
		Qs_reg4bit => REG_OUT(3 downto 0));

REG2: reg4bit port map(
      clk_reg4bit => clk_addr,
		clr_reg4bit => clr_addr,
		load => ld_addr,
		I_reg4bit => data_addr(7 downto 4),
		Qs_reg4bit => REG_OUT(7 downto 4));
		
Qs_addr <= REG_OUT;

end ckt_addr;