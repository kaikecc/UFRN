library verilog;
use verilog.vl_types.all;
entity reg8bit_vlg_sample_tst is
    port(
        clk_reg8bit     : in     vl_logic;
        clr_reg8bit     : in     vl_logic;
        E_reg8bit       : in     vl_logic_vector(7 downto 0);
        load8           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end reg8bit_vlg_sample_tst;
