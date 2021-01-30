library verilog;
use verilog.vl_types.all;
entity reg4bit_vlg_sample_tst is
    port(
        clk_reg4bit     : in     vl_logic;
        clr_reg4bit     : in     vl_logic;
        I_reg4bit       : in     vl_logic_vector(3 downto 0);
        load            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reg4bit_vlg_sample_tst;
