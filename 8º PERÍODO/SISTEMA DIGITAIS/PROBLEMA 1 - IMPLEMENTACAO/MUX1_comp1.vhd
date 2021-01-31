

library ieee;
use ieee.std_logic_1164.all;


entity MUX1_comp1 is
  
  port(MUX1_s_comp1, MUX1_s1_comp1, MUX1_s2_comp1: in std_logic;
       MUX1_CT_Msg, MUX1_REGS_GRV, MUX1_CT_ON, MUX1_REGS_REP_SQ, MUX1_DISPLAY_VAL, MUX1_REGS_REP_S, MUX1_CONT_LOCAL: in std_logic_vector(7 downto 0); 
																										 
																										 
        MC: out std_logic_vector(7 downto 0));
        
end;

architecture ckt_MUX1_comp1 of MUX1_comp1 is
 
component mux8x1 is
  
  port( SL: in std_logic_vector(2 downto 0);
        E_IN: in std_logic_vector(7 downto 0);
        M8: out std_logic);
        
end component;
 
signal MC_AUX : std_logic_vector(7 downto 0);

begin

MC0: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(0),
		E_IN(1) => MUX1_REGS_GRV(0),
		E_IN(2) => MUX1_CT_ON(0),
		E_IN(3) => MUX1_REGS_REP_SQ(0),
		E_IN(4) => MUX1_DISPLAY_VAL(0),
		E_IN(5) => MUX1_REGS_REP_S(0),
		E_IN(6) => MUX1_CONT_LOCAL(0),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(0));
		
MC1: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(1),
		E_IN(1) => MUX1_REGS_GRV(1),
		E_IN(2) => MUX1_CT_ON(1),
		E_IN(3) => MUX1_REGS_REP_SQ(1),
		E_IN(4) => MUX1_DISPLAY_VAL(1),
		E_IN(5) => MUX1_REGS_REP_S(1),
		E_IN(6) => MUX1_CONT_LOCAL(1),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(1));		

MC2: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(2),
		E_IN(1) => MUX1_REGS_GRV(2),
		E_IN(2) => MUX1_CT_ON(2),
		E_IN(3) => MUX1_REGS_REP_SQ(2),
		E_IN(4) => MUX1_DISPLAY_VAL(2),
		E_IN(5) => MUX1_REGS_REP_S(2),
		E_IN(6) => MUX1_CONT_LOCAL(2),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(2));

MC3: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(3),
		E_IN(1) => MUX1_REGS_GRV(3),
		E_IN(2) => MUX1_CT_ON(3),
		E_IN(3) => MUX1_REGS_REP_SQ(3),
		E_IN(4) => MUX1_DISPLAY_VAL(3),
		E_IN(5) => MUX1_REGS_REP_S(3),
		E_IN(6) => MUX1_CONT_LOCAL(3),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(3));	
	
	
MC4: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(4),
		E_IN(1) => MUX1_REGS_GRV(4),
		E_IN(2) => MUX1_CT_ON(4),
		E_IN(3) => MUX1_REGS_REP_SQ(4),
		E_IN(4) => MUX1_DISPLAY_VAL(4),
		E_IN(5) => MUX1_REGS_REP_S(4),
		E_IN(6) => MUX1_CONT_LOCAL(4),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(4));
		
MC5: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(5),
		E_IN(1) => MUX1_REGS_GRV(5),
		E_IN(2) => MUX1_CT_ON(5),
		E_IN(3) => MUX1_REGS_REP_SQ(5),
		E_IN(4) => MUX1_DISPLAY_VAL(5),
		E_IN(5) => MUX1_REGS_REP_S(5),
		E_IN(6) => MUX1_CONT_LOCAL(5),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(5));
		
MC6: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(6),
		E_IN(1) => MUX1_REGS_GRV(6),
		E_IN(2) => MUX1_CT_ON(6),
		E_IN(3) => MUX1_REGS_REP_SQ(6),
		E_IN(4) => MUX1_DISPLAY_VAL(6),
		E_IN(5) => MUX1_REGS_REP_S(6),
		E_IN(6) => MUX1_CONT_LOCAL(6),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(6));
		
MC7: mux8x1 port map(

		E_IN(0) => MUX1_CT_Msg(7),
		E_IN(1) => MUX1_REGS_GRV(7),
		E_IN(2) => MUX1_CT_ON(7),
		E_IN(3) => MUX1_REGS_REP_SQ(7),
		E_IN(4) => MUX1_DISPLAY_VAL(7),
		E_IN(5) => MUX1_REGS_REP_S(7),
		E_IN(6) => MUX1_CONT_LOCAL(7),
		E_IN(7) => '0',
		SL(0) => MUX1_s_comp1,
		SL(1) => MUX1_s1_comp1,
		SL(2) => MUX1_s2_comp1,
		M8 =>  MC_AUX(7));

		MC	<= MC_AUX;	

end ckt_MUX1_comp1;