library verilog;
use verilog.vl_types.all;
entity multiplicador4bit_vlg_sample_tst is
    port(
        M_A             : in     vl_logic_vector(3 downto 0);
        M_B             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end multiplicador4bit_vlg_sample_tst;
