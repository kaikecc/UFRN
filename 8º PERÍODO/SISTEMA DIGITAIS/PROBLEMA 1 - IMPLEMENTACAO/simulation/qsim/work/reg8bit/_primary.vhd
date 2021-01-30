library verilog;
use verilog.vl_types.all;
entity reg8bit is
    port(
        clk_reg8bit     : in     vl_logic;
        clr_reg8bit     : in     vl_logic;
        load8           : in     vl_logic;
        E_reg8bit       : in     vl_logic_vector(7 downto 0);
        Qs_reg8bit      : out    vl_logic_vector(7 downto 0)
    );
end reg8bit;
