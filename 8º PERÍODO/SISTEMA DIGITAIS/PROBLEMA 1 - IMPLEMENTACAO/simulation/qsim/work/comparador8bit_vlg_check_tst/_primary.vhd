library verilog;
use verilog.vl_types.all;
entity comparador8bit_vlg_check_tst is
    port(
        X_igual_Y       : in     vl_logic;
        X_maior_Y       : in     vl_logic;
        X_menor_Y       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end comparador8bit_vlg_check_tst;
