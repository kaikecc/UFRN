library verilog;
use verilog.vl_types.all;
entity MUX_SUM is
    port(
        REGS_GRV        : in     vl_logic_vector(7 downto 0);
        REGS_REP_SQ     : in     vl_logic_vector(7 downto 0);
        REGS_REP_S      : in     vl_logic_vector(7 downto 0);
        DISPLAY_VAL     : in     vl_logic_vector(7 downto 0);
        Flag_rep_s      : in     vl_logic;
        Flag_rep_sq     : in     vl_logic;
        SUM_OUT         : out    vl_logic_vector(7 downto 0)
    );
end MUX_SUM;
