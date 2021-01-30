library ieee;
use ieee.std_logic_1164.all;

entity REGS_REP_SQ is
  port( 
  clk_REGS_REP_SQ: in std_logic;
  clr_REGS_REP_SQ: in std_logic;
  ld_REGS_REP_SQ: in std_logic;
  data_REGS_REP_SQ: in std_logic_vector(7 downto 0);
  Qs_REGS_REP_SQ: out std_logic_vector(7 downto 0));
  
end;

architecture ckt_REGS_REP_SQ of REGS_REP_SQ is

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
      clk_reg4bit => clk_REGS_REP_SQ,
		clr_reg4bit => clr_REGS_REP_SQ,
		load => ld_REGS_REP_SQ,
		I_reg4bit => data_REGS_REP_SQ(3 downto 0),
		Qs_reg4bit => REG_OUT(3 downto 0));

REG2: reg4bit port map(
      clk_reg4bit => clk_REGS_REP_SQ,
		clr_reg4bit => clr_REGS_REP_SQ,
		load => ld_REGS_REP_SQ,
		I_reg4bit => data_REGS_REP_SQ(7 downto 4),
		Qs_reg4bit => REG_OUT(7 downto 4));
		
Qs_REGS_REP_SQ <= REG_OUT;

end ckt_REGS_REP_SQ;