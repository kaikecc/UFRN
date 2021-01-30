library ieee;
use ieee.std_logic_1164.all;

entity reg8bit is
  port( 
  clk_reg8bit: in std_logic;
  clr_reg8bit: in std_logic;
  load8: in std_logic;
  E_reg8bit: in std_logic_vector(7 downto 0);
  Qs_reg8bit: out std_logic_vector(7 downto 0));
  
end;

architecture ckto of reg8bit is

component reg4bit is
  port( 
  clk_reg4bit: in std_logic;
  clr_reg4bit: in std_logic;
  load: in std_logic;
  I_reg4bit: in std_logic_vector(3 downto 0);
  Qs_reg4bit: out std_logic_vector(3 downto 0));
  
end component;  

signal AUX: std_logic_vector(7 downto 0); 

begin
  
  
REG1: reg4bit port map(
  
      clk_reg4bit => clk_reg8bit,
      clr_reg4bit => clr_reg8bit,
		load => load8,
      I_reg4bit => E_reg8bit(3 downto 0),
      Qs_reg4bit => AUX(3 downto 0));

REG2: reg4bit port map(
  
      clk_reg4bit => clk_reg8bit,
      clr_reg4bit => clr_reg8bit,
		load => load8,
      I_reg4bit => E_reg8bit(7 downto 4),
      Qs_reg4bit => AUX(7 downto 4));
    
  Qs_reg8bit <= AUX;  
  
end ckto;