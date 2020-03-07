library ieee;
use ieee.std_logic_1164.all;

entity reg2bit is
  port( 
  clk_reg2bit: in std_logic;
  clr_reg2bit: in std_logic;
  pre_reg2bit: in std_logic;
  I_reg2bit: in std_logic_vector(1 downto 0);
  Qs_reg2bit: out std_logic_vector(1 downto 0));
  
end;

architecture ckto of reg2bit is
  
  component ffd IS
port ( clk ,D ,P , C : IN std_logic ;
q : OUT std_logic );
end component;

signal Q: std_logic_vector(1 downto 0);


  begin
    
   D0: ffd port map(
   clk => clk_reg2bit,
   D => I_reg2bit(0),
   P => pre_reg2bit, -- VERIFICAR ISSO
   C => clr_reg2bit, -- VERIFICAR ISSO
   q => Q(0));
   
  D1: ffd port map(
   clk => clk_reg2bit,
   D => I_reg2bit(1),
   P => pre_reg2bit, -- VERIFICAR ISSO
   C => clr_reg2bit, -- VERIFICAR ISSO
   q => Q(1));
   
  
   
 Qs_reg2bit <= Q; 
 
end ckto;


