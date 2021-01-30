library verilog;
use verilog.vl_types.all;
entity multiplicador8bit_vlg_check_tst is
    port(
        M8_OUT          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiplicador8bit_vlg_check_tst;
