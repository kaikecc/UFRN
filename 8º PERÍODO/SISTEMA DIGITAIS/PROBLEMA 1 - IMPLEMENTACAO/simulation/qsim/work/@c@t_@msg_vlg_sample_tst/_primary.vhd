library verilog;
use verilog.vl_types.all;
entity CT_Msg_vlg_sample_tst is
    port(
        clk_CT_Msg      : in     vl_logic;
        clr_CT_Msg      : in     vl_logic;
        en_CT_Msg       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CT_Msg_vlg_sample_tst;
