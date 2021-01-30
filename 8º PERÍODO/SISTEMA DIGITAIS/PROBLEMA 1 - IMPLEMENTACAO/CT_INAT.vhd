library ieee;
use ieee.std_logic_1164.all;

entity CT_INAT is
  port( 
  clk_CT_INAT: in std_logic;
  clr_CT_INAT: in std_logic;
  en_CT_INAT: in std_logic;
  Qs_CT_INAT: out std_logic_vector(7 downto 0));
  
end;

architecture ckto_CT_INAT of CT_INAT is


component mux16x8 is
  
  port( ENTA, ENTB: in std_logic_vector(7 downto 0);
        SELECIONAR: in std_logic;
    
        SS : out std_logic_vector(7 downto 0));
end component;

component reg8bit is
  
  port( 
  clk_reg8bit: in std_logic;
  clr_reg8bit: in std_logic;
  load8: in std_logic;
  E_reg8bit: in std_logic_vector(7 downto 0);
  Qs_reg8bit: out std_logic_vector(7 downto 0));
  
end component;

component somador8bit is
  
  port( S81, S82: in std_logic_vector(7 downto 0);
        Ce: in std_logic;
        Z: out std_logic_vector( 7 downto 0);
        Cs: out std_logic);
        
end component;

signal out_reg8bit, out_mux16x8, out_sum: std_logic_vector(7 downto 0);
begin
  
MUX: mux16x8 port map(
  
  ENTA => out_reg8bit,
  ENTB => out_sum,
  SELECIONAR => en_CT_INAT,
  SS => out_mux16x8);

REG: reg8bit port map(
  
  clk_reg8bit => clk_CT_INAT,
  clr_reg8bit => clr_CT_INAT,
  load8 => '1',
  E_reg8bit => out_mux16x8,
  Qs_reg8bit => out_reg8bit);
  
SUM: somador8bit port map(
  
  S81(0) => '1',
  S81(1) => '0',
  S81(2) => '0',
  S81(3) => '0',
  S81(4) => '0',
  S81(5) => '0',
  S81(6) => '0',
  S81(7) => '0',
  S82 => out_reg8bit,
  Ce => '0',
  Z => out_sum);
  
Qs_CT_INAT <= out_reg8bit;

end ckto_CT_INAT;