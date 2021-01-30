library verilog;
use verilog.vl_types.all;
entity MUX2_comp1_vlg_check_tst is
    port(
        M2C             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end MUX2_comp1_vlg_check_tst;
