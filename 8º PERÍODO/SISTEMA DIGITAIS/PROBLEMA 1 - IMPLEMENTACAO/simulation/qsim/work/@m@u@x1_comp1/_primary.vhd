library verilog;
use verilog.vl_types.all;
entity MUX1_comp1 is
    port(
        MUX1_s_comp1    : in     vl_logic;
        MUX1_s1_comp1   : in     vl_logic;
        MUX1_s2_comp1   : in     vl_logic;
        MUX1_CT_Msg     : in     vl_logic_vector(7 downto 0);
        MUX1_REGS_GRV   : in     vl_logic_vector(7 downto 0);
        MUX1_CT_ON      : in     vl_logic_vector(7 downto 0);
        MUX1_REGS_REP_SQ: in     vl_logic_vector(7 downto 0);
        MUX1_DISPLAY_VAL: in     vl_logic_vector(7 downto 0);
        MUX1_REGS_REP_S : in     vl_logic_vector(7 downto 0);
        MUX1_CONT_LOCAL : in     vl_logic_vector(7 downto 0);
        MC              : out    vl_logic_vector(7 downto 0)
    );
end MUX1_comp1;
