library verilog;
use verilog.vl_types.all;
entity MUX_vlg_sample_tst is
    port(
        Flag_rep_s      : in     vl_logic;
        Flag_rep_sq     : in     vl_logic;
        REGS_GRV        : in     vl_logic_vector(7 downto 0);
        REGS_REP_S      : in     vl_logic_vector(7 downto 0);
        REGS_REP_SQ     : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end MUX_vlg_sample_tst;
