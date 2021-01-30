library verilog;
use verilog.vl_types.all;
entity MUX_Display_vlg_sample_tst is
    port(
        CT_Msg          : in     vl_logic_vector(7 downto 0);
        DISPLAY_VAL_0   : in     vl_logic_vector(7 downto 0);
        DISPLAY_VAL_1   : in     vl_logic_vector(7 downto 0);
        setUni          : in     vl_logic;
        sub_Display     : in     vl_logic;
        sum_Display     : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MUX_Display_vlg_sample_tst;
