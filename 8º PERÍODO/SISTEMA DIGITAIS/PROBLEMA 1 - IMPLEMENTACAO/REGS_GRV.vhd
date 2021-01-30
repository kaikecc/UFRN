library ieee;
use ieee.std_logic_1164.all;

entity REGS_GRV is
  port( 
  clk_REGS_GRV: in std_logic;
  clr_REGS_GRV: in std_logic;
  ld_REGS_GRV: in std_logic;
  data_REGS_GRV: in std_logic_vector(7 downto 0);
  Qs_REGS_GRV: out std_logic_vector(7 downto 0));
  
end;

architecture ckt_REGS_GRV of REGS_GRV is

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
      clk_reg4bit => clk_REGS_GRV,
		clr_reg4bit => clr_REGS_GRV,
		load => ld_REGS_GRV,
		I_reg4bit => data_REGS_GRV(3 downto 0),
		Qs_reg4bit => REG_OUT(3 downto 0));

REG2: reg4bit port map(
      clk_reg4bit => clk_REGS_GRV,
		clr_reg4bit => clr_REGS_GRV,
		load => ld_REGS_GRV,
		I_reg4bit => data_REGS_GRV(7 downto 4),
		Qs_reg4bit => REG_OUT(7 downto 4));
		
Qs_REGS_GRV <= REG_OUT;

end ckt_REGS_GRV;