library verilog;
use verilog.vl_types.all;
entity MUX1_comp1_vlg_sample_tst is
    port(
        MUX1_CONT_LOCAL : in     vl_logic_vector(7 downto 0);
        MUX1_CT_Msg     : in     vl_logic_vector(7 downto 0);
        MUX1_CT_ON      : in     vl_logic_vector(7 downto 0);
        MUX1_DISPLAY_VAL: in     vl_logic_vector(7 downto 0);
        MUX1_REGS_GRV   : in     vl_logic_vector(7 downto 0);
        MUX1_REGS_REP_S : in     vl_logic_vector(7 downto 0);
        MUX1_REGS_REP_SQ: in     vl_logic_vector(7 downto 0);
        MUX1_s1_comp1   : in     vl_logic;
        MUX1_s2_comp1   : in     vl_logic;
        MUX1_s_comp1    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MUX1_comp1_vlg_sample_tst;
