library verilog;
use verilog.vl_types.all;
entity reg4bit_vlg_check_tst is
    port(
        Qs_reg4bit      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end reg4bit_vlg_check_tst;
