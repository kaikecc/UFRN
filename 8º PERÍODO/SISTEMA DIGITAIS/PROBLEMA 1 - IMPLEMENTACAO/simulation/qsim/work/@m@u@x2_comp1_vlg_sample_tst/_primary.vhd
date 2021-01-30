library verilog;
use verilog.vl_types.all;
entity MUX2_comp1_vlg_sample_tst is
    port(
        CT_Msg          : in     vl_logic_vector(7 downto 0);
        DISPLAY_SUBT_MUL: in     vl_logic_vector(7 downto 0);
        REGS_GRV        : in     vl_logic_vector(7 downto 0);
        s1_comp1        : in     vl_logic;
        s2_comp1        : in     vl_logic;
        s_comp1         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MUX2_comp1_vlg_sample_tst;
