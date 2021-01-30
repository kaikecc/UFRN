library verilog;
use verilog.vl_types.all;
entity comparador8bit is
    port(
        X               : in     vl_logic_vector(7 downto 0);
        Y               : in     vl_logic_vector(7 downto 0);
        X_igual_Y       : out    vl_logic;
        X_maior_Y       : out    vl_logic;
        X_menor_Y       : out    vl_logic
    );
end comparador8bit;
