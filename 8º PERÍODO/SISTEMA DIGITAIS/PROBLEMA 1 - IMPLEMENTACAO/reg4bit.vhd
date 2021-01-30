


-- LEMBRAR QUE CLR TEM QUER SER '1'
-- load = 0 -> MANTÉM
-- load = 1 -> CARREGA

library ieee;
use ieee.std_logic_1164.all;

entity reg4bit is
  port( 
  clk_reg4bit: in std_logic;
  clr_reg4bit: in std_logic;
  load: in std_logic;
  I_reg4bit: in std_logic_vector(3 downto 0);
  Qs_reg4bit: out std_logic_vector(3 downto 0));
  
end;

architecture ckto of reg4bit is
  
component ffd IS
port ( clk ,D ,P , C : IN std_logic ;
q : OUT std_logic );
end component;

component mux2x1 is
  
  port( Ea, Eb, SEL: in std_logic;
    
        Saida : out std_logic);
end component;

signal Q, SQ: std_logic_vector(3 downto 0);


  begin
    
	 
	MUX0: mux2x1 port map(
	
	Ea => Q(0),
	Eb => I_reg4bit(0),
	SEL => load,
	Saida => SQ(0));
	
	MUX1: mux2x1 port map(
	
	Ea => Q(1),
	Eb => I_reg4bit(1),
	SEL => load,
	Saida => SQ(1));
	
	MUX2: mux2x1 port map(
	
	Ea => Q(2),
	Eb => I_reg4bit(2),
	SEL => load,
	Saida => SQ(2));
	
	MUX3: mux2x1 port map(
	
	Ea => Q(3),
	Eb => I_reg4bit(3),
	SEL => load,
	Saida => SQ(3));
	
	
   D0: ffd port map(
   clk => clk_reg4bit,
   D => SQ(0),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(0));
   
  D1: ffd port map(
   clk => clk_reg4bit,
   D => SQ(1),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(1));
   
  D2: ffd port map(
   clk => clk_reg4bit,
   D => SQ(2),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(2));
   
  D3: ffd port map(
   clk => clk_reg4bit,
   D => SQ(3),
   P => '1', -- VERIFICAR ISSO
   C => clr_reg4bit, -- VERIFICAR ISSO
   q => Q(3));
   
 Qs_reg4bit <= Q; 
 
end ckto;
