library verilog;
use verilog.vl_types.all;
entity MUX_SUM_vlg_sample_tst is
    port(
        DISPLAY_VAL     : in     vl_logic_vector(7 downto 0);
        Flag_rep_s      : in     vl_logic;
        Flag_rep_sq     : in     vl_logic;
        REGS_GRV        : in     vl_logic_vector(7 downto 0);
        REGS_REP_S      : in     vl_logic_vector(7 downto 0);
        REGS_REP_SQ     : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end MUX_SUM_vlg_sample_tst;
