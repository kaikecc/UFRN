		 library ieee;
		 use ieee.std_logic_1164.all;
		 
		 entity datapath is
			
			port(clk, setUni_Display, soma_Display, subt_Display : in std_logic;
			 clrAddr, sl_comp1, sl1_comp1, sl2_comp1 : in std_logic;
			 s_comp1, s1_comp1, s2_comp1 : in std_logic;
			 clr_Local, clr_CT_ON, clr_Msg : in std_logic;
			 clr_INAT, en_INAT, en_Local: in std_logic;
			 en_Msg, ldAddr, en_CT_ON, ld_REP_S, ld_REP_SQ : in std_logic;
			 ld_GRV, clr_VAL, ld_VAL, Flag_rep_s, Flag_rep_sq, s_sum : in std_logic;
			 clr_GRV, clr_REP_S, clr_REP_SQ, sum_Display_MUX_S : in std_logic;
			 
			
			 Cont_Local_10, CT_ON_Menor_5, It_Comparator : out std_logic;
			 addrMemoria, Display_EN: out std_logic_vector(7 downto 0); 
			 grt_Comparator, eq_Comparator : out std_logic);
			
			
			 
		 end;
			
		 architecture ckt_datapath of datapath is
		 
		 
		 component MUX_S is
			
			port(ENTA_S, ENTB_S: in std_logic_vector(7 downto 0);
			  SEL_S: in std_logic;
			
			  S_S : out std_logic_vector(7 downto 0));
		 end component;
		 
		 component MUX_Display is
			
			port( setUni, sum_Display, sub_Display: in std_logic;
			  MUX_Display_CT_Msg, DISPLAY_VAL_1, DISPLAY_VAL_0: in std_logic_vector(7 downto 0); -- DISPLAY_VAL_+1 <= DISPLAY_VAL_1
											 -- DISPLAY_VAL_-1 <= DISPLAY_VAL_0
											 
			  MD: out std_logic_vector(7 downto 0));
			  
		 end component;
		 
		 component Comparador_Cont_Local is
			
			port(X, Y : in std_logic_vector(7 downto 0);
			eq_comparador_Local, grt_comparador_Local, It_comparador_Local: out std_logic);
		 end component;
		 
		 
		 
		 component REGS_GRV is
			port( 
			clk_REGS_GRV: in std_logic;
			clr_REGS_GRV: in std_logic;
			ld_REGS_GRV: in std_logic;
			data_REGS_GRV: in std_logic_vector(7 downto 0);
			Qs_REGS_GRV: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 component REGS_REP_S is
			port( 
			clk_REGS_REP_S: in std_logic;
			clr_REGS_REP_S: in std_logic;
			ld_REGS_REP_S: in std_logic;
			data_REGS_REP_S: in std_logic_vector(7 downto 0);
			Qs_REGS_REP_S: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 component REGS_REP_SQ is
			port( 
			clk_REGS_REP_SQ: in std_logic;
			clr_REGS_REP_SQ: in std_logic;
			ld_REGS_REP_SQ: in std_logic;
			data_REGS_REP_SQ: in std_logic_vector(7 downto 0);
			Qs_REGS_REP_SQ: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 
		 component CT_Msg is
			port( 
			clk_CT_Msg: in std_logic;
			clr_CT_Msg: in std_logic;
			en_CT_Msg: in std_logic;
			Qs_CT_Msg: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 
		 
		 component Cont_Local is
			port( 
			clk_Cont_Local: in std_logic;
			clr_Cont_Local: in std_logic;
			en_Cont_Local: in std_logic;
			Qs_Cont_Local: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 
		 component Display_VAL is
			port( 
			
			clk_Display_VAL: in std_logic;
			clr_Display_VAL: in std_logic;
			ld_Display_VAL: in std_logic;
			data_Display_VAL: in std_logic_vector(7 downto 0);
			Qs_Display_VAL: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 
		 
		 component CT_INAT is
			port( 
			clk_CT_INAT: in std_logic;
			clr_CT_INAT: in std_logic;
			en_CT_INAT: in std_logic;
			Qs_CT_INAT: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 
		 component Contador_ON is
			port( 
			clk_Contador_ON: in std_logic;
			clr_Contador_ON: in std_logic;
			en_Contador_ON: in std_logic;
			Qs_Contador_ON: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 
		 component MUX_SUM is
		 
			 port (MUX_SUM_REGS_GRV, MUX_SUM_REGS_REP_SQ, MUX_SUM_REGS_REP_S, MUX_SUM_DISPLAY_VAL: in std_logic_vector(7 downto 0);
			 
			 MUX_SUM_Flag_rep_s, MUX_SUM_Flag_rep_sq: in std_logic;
			
			  SUM_OUT : out std_logic_vector(7 downto 0)); -- ENTRADA PARA SOMADOR++
		 end component;
		 
		 
		 
		 component MUX is
		 
			 port (MUX_REGS_GRV, MUX_REGS_REP_SQ, MUX_REGS_REP_S: in std_logic_vector(7 downto 0);
			 MUX_Flag_rep_s, MUX_Flag_rep_sq: in std_logic;
			
			  REG_OUT : out std_logic_vector(7 downto 0));
		 end component;
		 
		 
		 
		 component multiplicador8bit is -- Multiplicador (Display * 10)
			
			port( M8_A, M8_B: in std_logic_vector(7 downto 0);
			  M8_OUT: out std_logic_vector(15 downto 0));
			  
		 end component;
		 
		 
		 
		 
		 component MUX1_comp1 is
			
			port(MUX1_s_comp1, MUX1_s1_comp1, MUX1_s2_comp1: in std_logic;
			  MUX1_CT_Msg, MUX1_REGS_GRV, MUX1_CT_ON, MUX1_REGS_REP_SQ, MUX1_DISPLAY_VAL, MUX1_REGS_REP_S, MUX1_CONT_LOCAL: in std_logic_vector(7 downto 0); 
											 
											 
			  MC: out std_logic_vector(7 downto 0));
			  
		 end component;
		 
		 
		 component Comparador_CT_ON is
			
			port(X, Y : in std_logic_vector(7 downto 0);
			eq_comparador_CT_ON, grt_comparador_CT_ON, It_comparador_CT_ON: out std_logic);
		 end component;
		 
		 
		 
		 
		 component somador8bit is
			
			port( S81, S82: in std_logic_vector(7 downto 0);
			  Ce: in std_logic;
			  Z: out std_logic_vector( 7 downto 0);
			  Cs: out std_logic);
		 end component;
		 
		 
		 component addr is
			port( 
			clk_addr: in std_logic;
			clr_addr: in std_logic;
			ld_addr: in std_logic;
			data_addr: in std_logic_vector(7 downto 0);
			Qs_addr: out std_logic_vector(7 downto 0));
			
		 end component;
		 
		 
		 component MUX2_comp1 is
			
			port(MUX2_sl_comp1, MUX2_sl1_comp1, MUX2_sl2_comp1: in std_logic;
			  MUX2_CT_Msg, MUX2_REGS_GRV, DISPLAY_SUBT_MUL: in std_logic_vector(7 downto 0);--  DISPLAY_SUBT_MUL = (Display*10 - 1)
											 
											 
			  M2C: out std_logic_vector(7 downto 0));
			  
		 end component;
		 
		 
		 component subtrator8bit is
			
			port( SU81, SU82: in std_logic_vector(7 downto 0);
			  Z_SU: out std_logic_vector( 7 downto 0);
			  Cs_SU: out std_logic);
		 end component;
		 
		 
		 component Comparador is
			
			port(X, Y : in std_logic_vector(7 downto 0);
			eq_comparador, grt_comparador, It_comparador: out std_logic);
		 end component;
		 
			  
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 signal datain_REGS_REP_S, data_Somador : std_logic_vector(7 downto 0);
		 signal data_MUX_S, data_CT_Msg : std_logic_vector(7 downto 0);
		 signal somador1, subtrador1: std_logic_vector(7 downto 0);
		 signal dataMuxDisplay: std_logic_vector(7 downto 0);
		 signal auxData_REGS_GRV, auxQs_REGS_GRV : std_logic_vector(7 downto 0);
		 signal auxData_REGS_REP_S, auxQs_REGS_REP_S : std_logic_vector(7 downto 0);
		 signal auxData_REGS_REP_SQ, auxQs_REGS_REP_SQ : std_logic_vector(7 downto 0);
		 signal auxQs_CT_Msg, auxQs_Cont_Local: std_logic_vector(7 downto 0);
		 signal auxQs_Display_VAL, auxQs_CT_INAT, auxQs_CT_ON: std_logic_vector(7 downto 0);
		 signal auxQs_MUX_SUM, auxQs_MUX: std_logic_vector(7 downto 0); 
		 signal auxQs_MULT0_10, auxQs_MUX1_comp1, out_addr: std_logic_vector(7 downto 0); 
		 signal auxQs_subtrator,auxQs_subtrator1, auxQs_MUX2: std_logic_vector(7 downto 0);
		 signal aux_Cont_Local, aux_CT_ON_5 : std_logic;
		 signal aux_eq_Comparator, aux_grt_Comparator, aux_It_Comparator: std_logic;
		 signal auxFlag_rep_s, auxFlag_rep_sq: std_logic;
		 begin
		 
		 MUXS: MUX_S port map(
			
			ENTA_S => data_Somador,
			ENTB_S => datain_REGS_REP_S,
			SEL_S => sum_Display_MUX_S,
			S_S => data_MUX_S);
			
		 MUXDISPLAY: MUX_Display port map(
			 
			  setUni => setUni_Display,
			  sum_Display => soma_Display,
			  sub_Display => subt_Display,
			  
			  MUX_Display_CT_Msg => auxQs_CT_Msg,
			  DISPLAY_VAL_1 => data_Somador,
			  DISPLAY_VAL_0 => auxQs_subtrator1,
			  MD => dataMuxDisplay);
			  
		 COMPARADOR10: Comparador_Cont_Local port map(
		 
			  X => auxQs_Cont_Local,
			  Y(0) => '0', -- 10 em BIN
			  Y(1) => '1',
			  Y(2) => '0',
			  Y(3) => '1',
			  Y(4) => '0',
			  Y(5) => '0',
			  Y(6) => '0',
			  Y(7) => '0',
			  -- grt_comparador_Local => ,
			 -- It_comparador_Local => );
			  eq_comparador_Local => aux_Cont_Local);
			 
		 
		 REGSGRV: REGS_GRV port map(
		 
			 
			clk_REGS_GRV => clk,
			clr_REGS_GRV => clr_GRV,
			ld_REGS_GRV => ld_GRV,
			data_REGS_GRV => data_Somador,
			Qs_REGS_GRV => auxQs_REGS_GRV);
			
		 REGSREPS: REGS_REP_S port map(
		 
			clk_REGS_REP_S => clk,
			clr_REGS_REP_S => clr_REP_S,
			ld_REGS_REP_S => ld_REP_S,
			data_REGS_REP_S => data_MUX_S,
			Qs_REGS_REP_S => auxQs_REGS_REP_S);
		 
		 REGSREPSQ: REGS_REP_SQ port map(
		  
			clk_REGS_REP_SQ => clk,
			clr_REGS_REP_SQ => clr_REP_SQ,
			ld_REGS_REP_SQ => ld_REP_SQ,
			data_REGS_REP_SQ => data_Somador,
			Qs_REGS_REP_SQ => auxQs_REGS_REP_SQ);
			
			
		 CTMSG: CT_Msg port map(
			
			clk_CT_Msg => clk,
			clr_CT_Msg => clr_Msg,
			en_CT_Msg => en_Msg,
			Qs_CT_Msg => auxQs_CT_Msg);
		  
		 CONTLOCAL: Cont_Local  port map(
		 
			clk_Cont_Local => clk,
			clr_Cont_Local => clr_Local,
			en_Cont_Local => en_Local,
			Qs_Cont_Local => auxQs_Cont_Local);
			
		 DISPLAYVAL: Display_VAL  port map(
		 
			clk_Display_VAL => clk,
			clr_Display_VAL => clr_VAL,
			ld_Display_VAL => ld_VAL,
			data_Display_VAL => dataMuxDisplay,	
			Qs_Display_VAL => auxQs_Display_VAL);
		 
		 CTINAT: CT_INAT port map(
		 
			clk_CT_INAT => clk,
			clr_CT_INAT => clr_INAT,
			en_CT_INAT => en_INAT,
			Qs_CT_INAT => auxQs_CT_INAT);
		 
		 CONTON: Contador_ON port map(
		
			clk_Contador_ON => clk,
			clr_Contador_ON => clr_CT_ON,
			en_Contador_ON => en_CT_ON,
			Qs_Contador_ON => auxQs_CT_ON);
		  
		 auxFlag_rep_s <= s_sum or Flag_rep_s; -- ADAPTAR PARA PUDER FUNCIONAR
		 auxFlag_rep_sq <= s_sum or Flag_rep_sq;

		 MUXSUM: MUX_SUM port map( -- OLHAR A VARIAVEL s_sum
		 
		 MUX_SUM_REGS_GRV => auxQs_REGS_GRV,
		 MUX_SUM_REGS_REP_SQ => auxQs_REGS_REP_SQ, 
		 MUX_SUM_REGS_REP_S => auxQs_REGS_REP_S,
		 MUX_SUM_DISPLAY_VAL => auxQs_Display_VAL,
		 
		 MUX_SUM_Flag_rep_s => auxFlag_rep_s,
		 MUX_SUM_Flag_rep_sq => auxFlag_rep_sq,   
		 SUM_OUT => auxQs_MUX_SUM);
		 
		 MUXX: MUX  port map(
		 
		 MUX_REGS_GRV => auxQs_REGS_GRV,
		 MUX_REGS_REP_SQ => auxQs_REGS_REP_SQ,
		 MUX_REGS_REP_S => auxQs_REGS_REP_S,
		 
		 MUX_Flag_rep_s => Flag_rep_s,
		 MUX_Flag_rep_sq => Flag_rep_sq,   
		 REG_OUT => auxQs_MUX);
		 
		 MULTPLICADOR10_0: multiplicador8bit port map(
		 
		 M8_A => auxQs_Display_VAL,
		 
		 M8_B(0) => '0', -- MULTIPLICA POR 10
		 M8_B(1) => '1',
		 M8_B(2) => '0',
		 M8_B(3) => '1',
		 M8_B(4) => '0',
		 M8_B(5) => '0',
		 M8_B(6) => '0',
		 M8_B(7) => '0',
		 
		 M8_OUT(7 downto 0) => auxQs_MULT0_10);
		 
		 
		 MUX1: MUX1_comp1 port map( -- MUITOS PROBLEMAS
		 
		 MUX1_s_comp1 => s_comp1,
		 MUX1_s1_comp1 => s1_comp1,
		 MUX1_s2_comp1 => s2_comp1,
		 
		 MUX1_CT_Msg => auxQs_CT_Msg, 
		 MUX1_REGS_GRV => auxData_REGS_GRV,
		 MUX1_CT_ON => auxQs_CT_ON,
		 MUX1_REGS_REP_SQ => auxQs_REGS_REP_SQ, 
		 MUX1_DISPLAY_VAL => auxQs_Display_VAL, 
		 MUX1_REGS_REP_S => auxQs_REGS_REP_S,
		 MUX1_CONT_LOCAL => auxQs_Cont_Local, 
		 MC => auxQs_MUX1_comp1);
		 
		 
		 COMPARADORON: Comparador_CT_ON port map(
			
		  X => auxQs_CT_ON,
		  
		  Y(0) => '1', -- Compara com 5
		  Y(1) => '0',
		  Y(2) => '1',
		  Y(3) => '0',
		  Y(4) => '0',
		  Y(5) => '0',
		  Y(6) => '0',
		  Y(7) => '0',
		 --eq_comparador_CT_ON => ,
		 --grt_comparador_CT_ON => ,
		 It_comparador_CT_ON => aux_CT_ON_5);
		 
		 SOMADOR: somador8bit port map(
			
			S81 => auxQs_MUX_SUM,
			
			S82(0) => '1', -- soma sempre com + 1
			S82(1) => '0',
			S82(2) => '0',
			S82(3) => '0',
			S82(4) => '0',
			S82(5) => '0',
			S82(6) => '0',
			S82(7) => '0',
		  
		  
		  Ce => '0',
		  Z => data_Somador);
	  
		 ADDRR: addr  port map(
		
			clk_addr => clk,
			clr_addr => clrAddr,
			ld_addr => ldAddr,
			data_addr => auxQs_MUX,
			Qs_addr => out_addr);
			
		 MUX2: MUX2_comp1  port map(
	  
			MUX2_sl_comp1  => sl_comp1,
			MUX2_sl1_comp1 => sl1_comp1,
			MUX2_sl2_comp1 => sl2_comp1,
			
			MUX2_CT_Msg => auxQs_CT_Msg,
			MUX2_REGS_GRV => auxQs_REGS_GRV,
			DISPLAY_SUBT_MUL => auxQs_subtrator,                           
			M2C => auxQs_MUX2);
				 
		 SUB0: subtrator8bit port map(
	  
		 SU81 => auxQs_MULT0_10,
		 
		 SU82(0) => '1',
		 SU82(1) => '0',
		 SU82(2) => '0',
		 SU82(3) => '0',
		 SU82(4) => '0',
		 SU82(5) => '0',
		 SU82(6) => '0',
		 SU82(7) => '0',
		 
		 Z_SU => auxQs_subtrator);
		 
		 
		 SUB1: subtrator8bit port map(
	  
		 SU81 => auxQs_Display_VAL,
		 
		 SU82(0) => '1',
		 SU82(1) => '0',
		 SU82(2) => '0',
		 SU82(3) => '0',
		 SU82(4) => '0',
		 SU82(5) => '0',
		 SU82(6) => '0',
		 SU82(7) => '0',
		 
		 Z_SU => auxQs_subtrator1); 
		
		
		 MULTPLICADOR10_1: multiplicador8bit port map(
	 
		 M8_A => auxQs_subtrator1,
		 
		 M8_B(0) => '0', -- MULTIPLICA POR 10
		 M8_B(1) => '1',
		 M8_B(2) => '0',
		 M8_B(3) => '1',
		 M8_B(4) => '0',
		 M8_B(5) => '0',
		 M8_B(6) => '0',
		 M8_B(7) => '0',
		 M8_OUT(7 downto 0) => datain_REGS_REP_S);  
		
		
		 
		 COMPARATTOR: Comparador port map(
			
			X => auxQs_MUX2, 
			Y => auxQs_MUX1_comp1,
			eq_comparador => aux_eq_Comparator,
			grt_comparador => aux_grt_Comparator, 
			It_comparador => aux_It_Comparator);
		
		
		
		
		
		
		eq_Comparator <= aux_eq_Comparator;
		grt_Comparator <= aux_grt_Comparator;
		It_Comparator <= aux_It_Comparator;
		
		Cont_Local_10 <= aux_Cont_Local;
		CT_ON_Menor_5 <= aux_CT_ON_5;
		addrMemoria <= out_addr;
		Display_EN <= auxQs_Display_VAL;
		
		
	 end ckt_datapath;