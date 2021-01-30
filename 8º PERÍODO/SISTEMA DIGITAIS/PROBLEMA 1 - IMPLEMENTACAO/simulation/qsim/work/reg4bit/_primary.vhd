library verilog;
use verilog.vl_types.all;
entity reg4bit is
    port(
        clk_reg4bit     : in     vl_logic;
        clr_reg4bit     : in     vl_logic;
        load            : in     vl_logic;
        I_reg4bit       : in     vl_logic_vector(3 downto 0);
        Qs_reg4bit      : out    vl_logic_vector(3 downto 0)
    );
end reg4bit;
