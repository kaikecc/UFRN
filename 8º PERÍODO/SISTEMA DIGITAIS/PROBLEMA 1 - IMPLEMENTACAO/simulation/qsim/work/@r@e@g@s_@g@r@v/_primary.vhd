library verilog;
use verilog.vl_types.all;
entity REGS_GRV is
    port(
        clk_reg8bit     : in     vl_logic;
        clr_reg8bit     : in     vl_logic;
        ld              : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        Qs_reg8bit      : out    vl_logic_vector(7 downto 0)
    );
end REGS_GRV;
