library verilog;
use verilog.vl_types.all;
entity REGS_GRV_vlg_sample_tst is
    port(
        clk_reg8bit     : in     vl_logic;
        clr_reg8bit     : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        ld              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end REGS_GRV_vlg_sample_tst;
