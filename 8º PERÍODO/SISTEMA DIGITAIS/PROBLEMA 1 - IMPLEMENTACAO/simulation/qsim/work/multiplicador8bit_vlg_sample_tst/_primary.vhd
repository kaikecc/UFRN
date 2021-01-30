library verilog;
use verilog.vl_types.all;
entity multiplicador8bit_vlg_sample_tst is
    port(
        M8_A            : in     vl_logic_vector(7 downto 0);
        M8_B            : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end multiplicador8bit_vlg_sample_tst;
