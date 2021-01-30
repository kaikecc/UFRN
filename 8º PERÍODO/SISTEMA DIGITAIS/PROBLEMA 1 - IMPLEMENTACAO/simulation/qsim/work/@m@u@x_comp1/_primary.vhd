library verilog;
use verilog.vl_types.all;
entity MUX_comp1 is
    port(
        s_comp1         : in     vl_logic;
        s1_comp1        : in     vl_logic;
        s2_comp1        : in     vl_logic;
        CT_Msg          : in     vl_logic_vector(7 downto 0);
        REG_GRV         : in     vl_logic_vector(7 downto 0);
        CT_ON           : in     vl_logic_vector(7 downto 0);
        REGS_REP_SQ     : in     vl_logic_vector(7 downto 0);
        DISPLAY_VAL     : in     vl_logic_vector(7 downto 0);
        REGS_REP_S      : in     vl_logic_vector(7 downto 0);
        MC              : out    vl_logic_vector(7 downto 0)
    );
end MUX_comp1;
