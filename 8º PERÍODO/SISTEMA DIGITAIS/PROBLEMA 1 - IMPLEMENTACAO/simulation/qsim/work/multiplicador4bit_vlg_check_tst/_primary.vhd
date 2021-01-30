library verilog;
use verilog.vl_types.all;
entity multiplicador4bit_vlg_check_tst is
    port(
        M_OUT           : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiplicador4bit_vlg_check_tst;
