library verilog;
use verilog.vl_types.all;
entity reg8bit_vlg_check_tst is
    port(
        Qs_reg8bit      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end reg8bit_vlg_check_tst;
