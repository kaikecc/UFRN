library verilog;
use verilog.vl_types.all;
entity MUX_S is
    port(
        ENTA_S          : in     vl_logic_vector(7 downto 0);
        ENTB_S          : in     vl_logic_vector(7 downto 0);
        SEL_S           : in     vl_logic;
        S_S             : out    vl_logic_vector(7 downto 0)
    );
end MUX_S;
