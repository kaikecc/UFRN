library verilog;
use verilog.vl_types.all;
entity subtrator8bit is
    port(
        SU81            : in     vl_logic_vector(7 downto 0);
        SU82            : in     vl_logic_vector(7 downto 0);
        Z_SU            : out    vl_logic_vector(7 downto 0);
        Cs_SU           : out    vl_logic
    );
end subtrator8bit;
