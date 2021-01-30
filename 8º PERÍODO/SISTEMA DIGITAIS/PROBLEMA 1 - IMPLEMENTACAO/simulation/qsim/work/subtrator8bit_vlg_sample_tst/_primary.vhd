library verilog;
use verilog.vl_types.all;
entity subtrator8bit_vlg_sample_tst is
    port(
        SU81            : in     vl_logic_vector(7 downto 0);
        SU82            : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end subtrator8bit_vlg_sample_tst;
