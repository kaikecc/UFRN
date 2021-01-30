library verilog;
use verilog.vl_types.all;
entity comparador4bit_vlg_check_tst is
    port(
        A_maior_B       : in     vl_logic;
        A_menor_B       : in     vl_logic;
        AeqB            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end comparador4bit_vlg_check_tst;
