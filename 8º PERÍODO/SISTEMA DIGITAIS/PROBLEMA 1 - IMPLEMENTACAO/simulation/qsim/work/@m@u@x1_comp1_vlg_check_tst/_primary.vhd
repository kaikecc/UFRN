library verilog;
use verilog.vl_types.all;
entity MUX1_comp1_vlg_check_tst is
    port(
        MC              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end MUX1_comp1_vlg_check_tst;
