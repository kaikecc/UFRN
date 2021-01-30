library verilog;
use verilog.vl_types.all;
entity MUX_vlg_check_tst is
    port(
        REG_OUT         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end MUX_vlg_check_tst;
