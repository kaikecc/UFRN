library verilog;
use verilog.vl_types.all;
entity comparador4bit is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        AeqB            : out    vl_logic;
        A_maior_B       : out    vl_logic;
        A_menor_B       : out    vl_logic
    );
end comparador4bit;
