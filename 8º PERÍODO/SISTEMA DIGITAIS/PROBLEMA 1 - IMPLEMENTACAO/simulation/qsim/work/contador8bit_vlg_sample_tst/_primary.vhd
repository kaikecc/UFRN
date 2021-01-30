library verilog;
use verilog.vl_types.all;
entity contador8bit_vlg_sample_tst is
    port(
        clk_contador8bit: in     vl_logic;
        clr_contador8bit: in     vl_logic;
        SEL_contador8bit: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end contador8bit_vlg_sample_tst;
