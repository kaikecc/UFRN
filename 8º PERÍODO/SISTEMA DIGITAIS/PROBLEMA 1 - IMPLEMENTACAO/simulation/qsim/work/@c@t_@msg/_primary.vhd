library verilog;
use verilog.vl_types.all;
entity CT_Msg is
    port(
        clk_CT_Msg      : in     vl_logic;
        clr_CT_Msg      : in     vl_logic;
        en_CT_Msg       : in     vl_logic;
        Qs_CT_Msg       : out    vl_logic_vector(7 downto 0)
    );
end CT_Msg;
