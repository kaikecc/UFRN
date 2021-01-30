library verilog;
use verilog.vl_types.all;
entity subtrator8bit_vlg_check_tst is
    port(
        Cs_SU           : in     vl_logic;
        Z_SU            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end subtrator8bit_vlg_check_tst;
