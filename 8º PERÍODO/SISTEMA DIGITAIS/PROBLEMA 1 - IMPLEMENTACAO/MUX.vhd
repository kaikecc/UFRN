
-- MUX24x8

library ieee;
use ieee.std_logic_1164.all;

entity MUX is

			port (MUX_REGS_GRV, MUX_REGS_REP_SQ, MUX_REGS_REP_S: in std_logic_vector(7 downto 0);
         MUX_Flag_rep_s, MUX_Flag_rep_sq: in std_logic;
    
        REG_OUT : out std_logic_vector(7 downto 0));
end;


architecture ckt_MUX of MUX is

component mux4x1 is
  
  port( Ea, Eb, Ec, Ed: in std_logic;
		  SELEC: in std_logic_vector(1 downto 0);
        M_Saida : out std_logic);
end component;

signal OUTS: std_logic_vector(7 downto 0);

 begin
 
  M0: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(0),
    Eb => MUX_REGS_REP_S(0),
	 Ec => MUX_REGS_REP_SQ(0),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(0));

  M1: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(1),
    Eb => MUX_REGS_REP_S(1),
	 Ec => MUX_REGS_REP_SQ(1),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(1));
	 
	 M2: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(2),
    Eb => MUX_REGS_REP_S(2),
	 Ec => MUX_REGS_REP_SQ(2),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(2));
	 
	  M3: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(3),
    Eb => MUX_REGS_REP_S(3),
	 Ec => MUX_REGS_REP_SQ(3),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(3));
	 
	 M4: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(4),
    Eb => MUX_REGS_REP_S(4),
	 Ec => MUX_REGS_REP_SQ(4),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(4));
	 
	 M5: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(5),
    Eb => MUX_REGS_REP_S(5),
	 Ec => MUX_REGS_REP_SQ(5),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(5));
	 
	 M6: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(6),
    Eb => MUX_REGS_REP_S(6),
	 Ec => MUX_REGS_REP_SQ(6),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(6));
	 
	 M7: mux4x1 port map(
    
    Ea => MUX_REGS_GRV(7),
    Eb => MUX_REGS_REP_S(7),
	 Ec => MUX_REGS_REP_SQ(7),
	 Ed => '0',
    SELEC(0) => MUX_Flag_rep_s,
	 SELEC(1) => MUX_Flag_rep_sq,
    M_Saida => OUTS(7));
	 
		 
	 REG_OUT <= OUTS;
	 
end ckt_MUX;
