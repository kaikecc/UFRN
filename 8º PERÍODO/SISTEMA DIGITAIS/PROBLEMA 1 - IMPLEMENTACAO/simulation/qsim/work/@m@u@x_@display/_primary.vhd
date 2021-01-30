library verilog;
use verilog.vl_types.all;
entity MUX_Display is
    port(
        setUni          : in     vl_logic;
        sum_Display     : in     vl_logic;
        sub_Display     : in     vl_logic;
        CT_Msg          : in     vl_logic_vector(7 downto 0);
        DISPLAY_VAL_1   : in     vl_logic_vector(7 downto 0);
        DISPLAY_VAL_0   : in     vl_logic_vector(7 downto 0);
        MD              : out    vl_logic_vector(7 downto 0)
    );
end MUX_Display;
