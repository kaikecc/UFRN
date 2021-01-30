library verilog;
use verilog.vl_types.all;
entity multiplicador4bit is
    port(
        M_A             : in     vl_logic_vector(3 downto 0);
        M_B             : in     vl_logic_vector(3 downto 0);
        M_OUT           : out    vl_logic_vector(7 downto 0)
    );
end multiplicador4bit;
