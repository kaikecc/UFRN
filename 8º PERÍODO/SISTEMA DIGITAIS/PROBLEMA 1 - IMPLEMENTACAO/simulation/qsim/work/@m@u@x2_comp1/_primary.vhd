library verilog;
use verilog.vl_types.all;
entity MUX2_comp1 is
    port(
        s_comp1         : in     vl_logic;
        s1_comp1        : in     vl_logic;
        s2_comp1        : in     vl_logic;
        CT_Msg          : in     vl_logic_vector(7 downto 0);
        REGS_GRV        : in     vl_logic_vector(7 downto 0);
        DISPLAY_SUBT_MUL: in     vl_logic_vector(7 downto 0);
        M2C             : out    vl_logic_vector(7 downto 0)
    );
end MUX2_comp1;
