library verilog;
use verilog.vl_types.all;
entity ffd_vlg_sample_tst is
    port(
        C               : in     vl_logic;
        clk             : in     vl_logic;
        D               : in     vl_logic;
        P               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ffd_vlg_sample_tst;
