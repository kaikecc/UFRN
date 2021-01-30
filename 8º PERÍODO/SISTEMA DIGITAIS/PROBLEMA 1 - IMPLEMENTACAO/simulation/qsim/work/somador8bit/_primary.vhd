library verilog;
use verilog.vl_types.all;
entity somador8bit is
    port(
        S81             : in     vl_logic_vector(7 downto 0);
        S82             : in     vl_logic_vector(7 downto 0);
        Ce              : in     vl_logic;
        Z               : out    vl_logic_vector(7 downto 0);
        Cs              : out    vl_logic
    );
end somador8bit;
