library verilog;
use verilog.vl_types.all;
entity somador8bit_vlg_check_tst is
    port(
        Cs              : in     vl_logic;
        Z               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end somador8bit_vlg_check_tst;
