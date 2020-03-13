library ieee;
use ieee.std_logic_1164.all;

entity reg4bit is
  port( 
  clk_reg4bit: in std_logic;
  clr_reg4bit: in std_logic;
  I_reg4bit: in std_logic_vector(3 downto 0);
  Qs_reg4bit: out std_logic_vector(3 downto 0));
  
end;

architecture ckto of reg4bit is
  
  component ffd IS
port ( clk ,D ,P , C : IN std_logic ;
q : OUT std_logic );
end component;

signal Q: std_logic_vector(3 downto 0);


  begin
    
   D0: ffd port map(
   clk => clk_reg4bit,
   D => I_reg4bit(0),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(0));
   
  D1: ffd port map(
   clk => clk_reg4bit,
   D => I_reg4bit(1),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(1));
   
  D2: ffd port map(
   clk => clk_reg4bit,
   D => I_reg4bit(2),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(2));
   
  D3: ffd port map(
   clk => clk_reg4bit,
   D => I_reg4bit(3),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(3));
   
 Qs_reg4bit <= Q; 
 
end ckto;
