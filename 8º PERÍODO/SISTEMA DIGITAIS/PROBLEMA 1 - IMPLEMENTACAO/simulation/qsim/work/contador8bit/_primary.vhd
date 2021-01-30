library verilog;
use verilog.vl_types.all;
entity contador8bit is
    port(
        clk_contador8bit: in     vl_logic;
        clr_contador8bit: in     vl_logic;
        SEL_contador8bit: in     vl_logic;
        Qs_contador8bit : out    vl_logic_vector(7 downto 0)
    );
end contador8bit;
