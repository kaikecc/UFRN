library verilog;
use verilog.vl_types.all;
entity mux4x1 is
    port(
        Ea              : in     vl_logic;
        Eb              : in     vl_logic;
        Ec              : in     vl_logic;
        Ed              : in     vl_logic;
        SELEC           : in     vl_logic_vector(1 downto 0);
        M_Saida         : out    vl_logic
    );
end mux4x1;
