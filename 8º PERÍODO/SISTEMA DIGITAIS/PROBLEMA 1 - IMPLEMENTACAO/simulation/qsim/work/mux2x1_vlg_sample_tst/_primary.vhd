library verilog;
use verilog.vl_types.all;
entity mux2x1_vlg_sample_tst is
    port(
        Ea              : in     vl_logic;
        Eb              : in     vl_logic;
        SEL             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mux2x1_vlg_sample_tst;
