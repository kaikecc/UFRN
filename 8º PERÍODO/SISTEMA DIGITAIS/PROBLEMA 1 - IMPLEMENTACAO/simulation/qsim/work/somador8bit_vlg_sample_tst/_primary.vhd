library verilog;
use verilog.vl_types.all;
entity somador8bit_vlg_sample_tst is
    port(
        Ce              : in     vl_logic;
        S81             : in     vl_logic_vector(7 downto 0);
        S82             : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end somador8bit_vlg_sample_tst;
