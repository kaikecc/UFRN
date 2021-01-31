library verilog;
use verilog.vl_types.all;
entity Comparador_vlg_check_tst is
    port(
        eq_comparador   : in     vl_logic;
        grt_comparador  : in     vl_logic;
        It_comparador   : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Comparador_vlg_check_tst;
