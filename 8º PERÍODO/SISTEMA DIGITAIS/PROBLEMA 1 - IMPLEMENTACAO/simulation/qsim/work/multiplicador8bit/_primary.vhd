library verilog;
use verilog.vl_types.all;
entity multiplicador8bit is
    port(
        M8_A            : in     vl_logic_vector(7 downto 0);
        M8_B            : in     vl_logic_vector(7 downto 0);
        M8_OUT          : out    vl_logic_vector(15 downto 0)
    );
end multiplicador8bit;
