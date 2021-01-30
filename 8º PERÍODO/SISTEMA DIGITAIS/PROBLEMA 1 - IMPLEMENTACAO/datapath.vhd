    
    
    
    library ieee;
    use ieee.std_logic_1164.all;
    
    entity datapath is
      
      port(setUni_Display, sum_Display, sub_Display : in std_logic;
       clr_addr, s1_comp1, sl1_comp1, sl2_comp1 : in std_logic;
       clr_Cont_Local, clr_CT_ON, clr_CT_Msg : in std_logic;
       clr_CT_INAT, en_CT_INAT, en_Cont_Local: in std_logic;
       en_CT_Msg, en_CT_ON, ld_REGS_REP_S, ld_REGS_REP_SQ : in std_logic;
       ld_REGS_GRV, Flag_rep_s, Flag_sq, s_sum : in std_logic;
       clr_REGS_GRV, clr_REGS_REP, sum_Display_MUX_S : in std_logic;
      
       Cont_Local_10, CT_ON_Menor_5, It_Comparator : out std_logic;
       grt_Comparator, eq_Comparator : out std_logic);
      
      
       
    end;
      
    architecture ckt_datapath of datapath is
    
    
    component MUX_S is
      
      port( ENTA_S, ENTB_S: in std_logic_vector(7 downto 0);
        SEL_S: in std_logic;
      
        S_S : out std_logic_vector(7 downto 0));
    end component;
    
    component MUX_Display is
      
      port( setUni, sum_Display, sub_Display: in std_logic;
        CT_Msg, DISPLAY_VAL_1, DISPLAY_VAL_0: in std_logic_vector(7 downto 0); -- DISPLAY_VAL_+1 <= DISPLAY_VAL_1
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
      
    end;
    
    
    
    
    component Display_VAL is
      port( 
      clk_Display_VAL: in std_logic;
      clr_Display_VAL: in std_logic;
      en_Display_VAL: in std_logic;
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
    
       port (REGS_GRV, REGS_REP_SQ, REGS_REP_S, DISPLAY_VAL: in std_logic_vector(7 downto 0);
       Flag_rep_s, Flag_rep_sq: in std_logic;
      
        SUM_OUT : out std_logic_vector(7 downto 0)); -- ENTRADA PARA SOMADOR++
    end component;
    
    
    
    component MUX is
    
       port (REGS_GRV, REGS_REP_SQ, REGS_REP_S: in std_logic_vector(7 downto 0);
       Flag_rep_s, Flag_rep_sq: in std_logic;
      
        REG_OUT : out std_logic_vector(7 downto 0));
    end component;
    
    
    
    component multiplicador8bit is -- Multiplicador (Display * 10)
      
      port( M8_A, M8_B: in std_logic_vector(7 downto 0);
        M8_OUT: out std_logic_vector(15 downto 0));
        
    end component;
    
    
    
    
    component MUX1_comp1 is
      
      port(s_comp1, s1_comp1, s2_comp1: in std_logic;
        CT_Msg, REG_GRV, CT_ON, REGS_REP_SQ, DISPLAY_VAL, REGS_REP_S: in std_logic_vector(7 downto 0); 
                               
                               
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
      
      port(s_comp1, s1_comp1, s2_comp1: in std_logic;
        CT_Msg, REGS_GRV, DISPLAY_SUBT_MUL: in std_logic_vector(7 downto 0);--  DISPLAY_SUBT_MUL = (Display*10 - 1)
                               
                               
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
    
    
    
    
    
    
    begin
    
    MUXS: MUX_S port map(
      ENTA_S => ,
      ENTB_S => ,
      SEL_S => ,
      S_S => );
      
    MUXDISPLAY: MUX_Display port map(
        setUni => ,
        sum_Display => ,
        sub_Display => ,
        CT_Msg => ,
        DISPLAY_VAL_1 => ,
        DISPLAY_VAL_0 => 
        MD => );
        
    COMPARADOR10: Comparador_Cont_Local port map(
        X => ,
        Y => ,
        q_comparador_Local => ,
        grt_comparador_Local => ,
        It_comparador_Local => );
    
     REGSGRV: REGS_GRV port map(
    
       
      clk_REGS_GRV => ,
      clr_REGS_GRV => ,
      ld_REGS_GRV => ,
      data_REGS_GRV => ,
      Qs_REGS_GRV => );
      
    REGSREPS: REGS_REP_S port map(
    
    clk_REGS_REP_S => ,
      clr_REGS_REP_S => ,
      ld_REGS_REP_S => ,
      data_REGS_REP_S => ,
      Qs_REGS_REP_S => );
    
    REGSREPSQ: REGS_REP_SQ port map(
    clk_REGS_REP_SQ => ,
      clr_REGS_REP_SQ => ,
      ld_REGS_REP_SQ => ,
      data_REGS_REP_SQ => ,
      Qs_REGS_REP_SQ => );
      
      
     CTMSG: CT_Msg port map(
     clk_CT_Msg => ,
      clr_CT_Msg => ,
      en_CT_Msg => ,
      Qs_CT_Msg => );
     
    CONTLOCAL: Cont_Local  port map(
    
    clk_Cont_Local => ,
      clr_Cont_Local => ,
      en_Cont_Local => ,
      Qs_Cont_Local => );
      
    DISPLAYVAL: Display_VAL  port map(
    
    clk_Display_VAL => ,
      clr_Display_VAL => ,
      en_Display_VAL => ,
      Qs_Display_VAL => );
    
    CTINAT: CT_INAT port map(
    
    clk_CT_INAT => ,
      clr_CT_INAT => ,
      en_CT_INAT => ,
      Qs_CT_INAT => );
    
    CONTON: Contador_ON port map(
   
    clk_Contador_ON => ,
      clr_Contador_ON => ,
      en_Contador_ON => ,
      Qs_Contador_ON => );
     
    MUXSUM: MUX_SUM port map(
    
    REGS_GRV => ,
    REGS_REP_SQ => , 
    REGS_REP_S => ,
    DISPLAY_VAL =>
    Flag_rep_s => ,
    Flag_rep_sq => ,   
    SUM_OUT => );
    
    MUXX: MUX  port map(
    
    REGS_GRV => ,
    REGS_REP_SQ => ,
    REGS_REP_S => ,
    Flag_rep_s => ,
    Flag_rep_sq => ,   
    REG_OUT => );
    
    MULTPLICADOR10_0: multiplicador8bit port map(
    M8_A => ,
    M8_B => ,
    M8_OUT => );
    
    
    MUX1: MUX1_comp1 port map(
    
    s_comp1 => ,
    s1_comp1 => ,
    s2_comp1 => ,
    CT_Msg => , 
    REG_GRV => ,
    CT_ON => ,
    REGS_REP_SQ => , 
    DISPLAY_VAL => , 
    REGS_REP_S => ,                  
    MC => );
    
    
    COMPARADORON: Comparador_CT_ON port map(
      
     X => ,
     Y => ,
    eq_comparador_CT_ON => ,
    grt_comparador_CT_ON => ,
    It_comparador_CT_ON => );
    
  SOMADOR: somador8bit port map(
      
      S81 => ,
      S82 => ,
     Ce => ,
     Z => ,
     Cs => );
  
  ADDRR: addr  port map(
   
      clk_addr => ,
      clr_addr => ,
      ld_addr => ,
      data_addr => ,
      Qs_addr => );
      
  MUX2: MUX2_comp1  port map(
  
      s_comp1  => ,
      s1_comp1 => ,
      s2_comp1 => ,
      CT_Msg => ,
      REGS_GRV => ,
      DISPLAY_SUBT_MUL => ,                           
      M2C => );
          
  SUB0: subtrator8bit port map(
  
    SU81 => ,
    SU82 => ,
    Z_SU => ,
    Cs_SU => );
    
    
  SUB1: subtrator8bit port map(
  
    SU81 => ,
    SU82 => ,
    Z_SU => ,
    Cs_SU => ); 
   
   
 MULTPLICADOR10_0: multiplicador8bit port map(
 
    M8_A => ,
    M8_B => ,
    M8_OUT => );   
     
 end ckt_datapath;