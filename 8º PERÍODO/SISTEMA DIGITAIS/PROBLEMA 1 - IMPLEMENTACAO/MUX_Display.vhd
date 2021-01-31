

library ieee;
use ieee.std_logic_1164.all;


entity MUX_Display is
  
  port( setUni, sum_Display, sub_Display: in std_logic;
        MUX_Display_CT_Msg, DISPLAY_VAL_1, DISPLAY_VAL_0: in std_logic_vector(7 downto 0); -- DISPLAY_VAL_+1 <= DISPLAY_VAL_1
																										 -- DISPLAY_VAL_-1 <= DISPLAY_VAL_0
																										 
        MD: out std_logic_vector(7 downto 0));
        
end;

architecture ckt_MUX_Display of MUX_Display is
 
component mux8x1 is
  
  port( SL: in std_logic_vector(2 downto 0);
        E_IN: in std_logic_vector(7 downto 0);
        M8: out std_logic);
        
end component;
 
signal MD_AUX : std_logic_vector(7 downto 0);

begin

MD0: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(0),
		E_IN(1) => DISPLAY_VAL_0(0),
		E_IN(2) => DISPLAY_VAL_1(0),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '1',
		E_IN(6) => '1',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(0));
		
MD1: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(1),
		E_IN(1) => DISPLAY_VAL_0(1),
		E_IN(2) => DISPLAY_VAL_1(1),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(1));		

MD2: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(2),
		E_IN(1) => DISPLAY_VAL_0(2),
		E_IN(2) => DISPLAY_VAL_1(2),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(2));

MD3: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(3),
		E_IN(1) => DISPLAY_VAL_0(3),
		E_IN(2) => DISPLAY_VAL_1(3),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(3));	
	
	
MD4: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(4),
		E_IN(1) => DISPLAY_VAL_0(4),
		E_IN(2) => DISPLAY_VAL_1(4),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(4));
		
MD5: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(5),
		E_IN(1) => DISPLAY_VAL_0(5),
		E_IN(2) => DISPLAY_VAL_1(5),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(5));
		
MD6: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(6),
		E_IN(1) => DISPLAY_VAL_0(6),
		E_IN(2) => DISPLAY_VAL_1(6),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(6));
		
MD7: mux8x1 port map(

		E_IN(0) => MUX_Display_CT_Msg(7),
		E_IN(1) => DISPLAY_VAL_0(7),
		E_IN(2) => DISPLAY_VAL_1(7),
		E_IN(3) => '0',
		E_IN(4) => '0',
		E_IN(5) => '0',
		E_IN(6) => '0',
		E_IN(7) => '0',
		SL(0) => setUni,
		SL(1) => sum_Display,
		SL(2) => sub_Display,
		M8 =>  MD_AUX(7));

		MD	<= MD_AUX;	

end ckt_MUX_Display;