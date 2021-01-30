library verilog;
use verilog.vl_types.all;
entity CT_Msg_vlg_check_tst is
    port(
        Qs_CT_Msg       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end CT_Msg_vlg_check_tst;
