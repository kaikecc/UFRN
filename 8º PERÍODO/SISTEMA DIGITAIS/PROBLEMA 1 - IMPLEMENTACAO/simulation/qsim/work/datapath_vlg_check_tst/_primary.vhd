library verilog;
use verilog.vl_types.all;
entity datapath_vlg_check_tst is
    port(
        addrMemoria     : in     vl_logic_vector(7 downto 0);
        Cont_Local_10   : in     vl_logic;
        CT_ON_Menor_5   : in     vl_logic;
        Display_EN      : in     vl_logic_vector(7 downto 0);
        eq_Comparator   : in     vl_logic;
        grt_Comparator  : in     vl_logic;
        It_Comparator   : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end datapath_vlg_check_tst;
