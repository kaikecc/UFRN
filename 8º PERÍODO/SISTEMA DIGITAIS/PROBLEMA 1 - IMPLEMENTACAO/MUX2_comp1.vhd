

library ieee;
use ieee.std_logic_1164.all;


entity MUX2_comp1 is
  
  port(s_comp1, s1_comp1, s2_comp1: in std_logic;
        CT_Msg, REGS_GRV, DISPLAY_SUBT_MUL: in std_logic_vector(7 downto 0);--  DISPLAY_SUBT_MUL = (Display*10 - 1)
																										 
																										 
        M2C: out std_logic_vector(7 downto 0));
        
end;

architecture ckt_MUX2_comp1 of MUX2_comp1 is
 
component mux8x1 is
  
  port( SL: in std_logic_vector(2 downto 0);
        E_IN: in std_logic_vector(7 downto 0);
        M8: out std_logic);
        
end component;
 
signal M2C_AUX : std_logic_vector(7 downto 0);

begin

M2C0: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '1', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(0),
		E_IN(4) => DISPLAY_SUBT_MUL(0), -- (Display*10 - 1)
		E_IN(5) => '1', -- 25
		E_IN(6) => '0', -- 60
		E_IN(7) => CT_Msg(0),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(0));
		
M2C1: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '1', -- 2
		E_IN(3) => REGS_GRV(1),
		E_IN(4) => DISPLAY_SUBT_MUL(1), -- (Display*10 - 1)
		E_IN(5) => '0', -- 25
		E_IN(6) => '0', -- 60
		E_IN(7) => CT_Msg(1),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(1));		

M2C2: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(2),
		E_IN(4) => DISPLAY_SUBT_MUL(2), -- (Display*10 - 1)
		E_IN(5) => '0', -- 25
		E_IN(6) => '1', -- 60
		E_IN(7) => CT_Msg(2),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(2));	

M2C3: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(3),
		E_IN(4) => DISPLAY_SUBT_MUL(3), -- (Display*10 - 1)
		E_IN(5) => '1', -- 25
		E_IN(6) => '1', -- 60
		E_IN(7) => CT_Msg(3),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(3));		
	
	
M2C4: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(4),
		E_IN(4) => DISPLAY_SUBT_MUL(4), -- (Display*10 - 1)
		E_IN(5) => '1', -- 25
		E_IN(6) => '1', -- 60
		E_IN(7) => CT_Msg(4),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(4));
		
M2C5: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(5),
		E_IN(4) => DISPLAY_SUBT_MUL(5), -- (Display*10 - 1)
		E_IN(5) => '0', -- 25
		E_IN(6) => '1', -- 60
		E_IN(7) => CT_Msg(5),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(5));
		
M2C6: mux8x1 port map(

		
		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(6),
		E_IN(4) => DISPLAY_SUBT_MUL(6), -- (Display*10 - 1)
		E_IN(5) => '0', -- 25
		E_IN(6) => '0', -- 60
		E_IN(7) => CT_Msg(6),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(6));
		
M2C7: mux8x1 port map(

		E_IN(0) => '0', -- 0
		E_IN(1) => '0', -- 1
		E_IN(2) => '0', -- 2
		E_IN(3) => REGS_GRV(7),
		E_IN(4) => DISPLAY_SUBT_MUL(7), -- (Display*10 - 1)
		E_IN(5) => '0', -- 25
		E_IN(6) => '0', -- 60
		E_IN(7) => CT_Msg(7),
		SL(0) => s_comp1,
		SL(1) => s1_comp1,
		SL(2) => s2_comp1,
		M8 =>  M2C_AUX(7));

		M2C	<= M2C_AUX;	

end ckt_MUX2_comp1;