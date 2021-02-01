library verilog;
use verilog.vl_types.all;
entity datapath_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clr_CT_ON       : in     vl_logic;
        clr_GRV         : in     vl_logic;
        clr_INAT        : in     vl_logic;
        clr_Local       : in     vl_logic;
        clr_Msg         : in     vl_logic;
        clr_REP_S       : in     vl_logic;
        clr_REP_SQ      : in     vl_logic;
        clr_VAL         : in     vl_logic;
        clrAddr         : in     vl_logic;
        en_CT_ON        : in     vl_logic;
        en_INAT         : in     vl_logic;
        en_Local        : in     vl_logic;
        en_Msg          : in     vl_logic;
        Flag_rep_s      : in     vl_logic;
        Flag_rep_sq     : in     vl_logic;
        ld_GRV          : in     vl_logic;
        ld_REP_S        : in     vl_logic;
        ld_REP_SQ       : in     vl_logic;
        ld_VAL          : in     vl_logic;
        ldAddr          : in     vl_logic;
        s1_comp1        : in     vl_logic;
        s2_comp1        : in     vl_logic;
        s_comp1         : in     vl_logic;
        s_sum           : in     vl_logic;
        setUni_Display  : in     vl_logic;
        sl1_comp1       : in     vl_logic;
        sl2_comp1       : in     vl_logic;
        sl_comp1        : in     vl_logic;
        soma_Display    : in     vl_logic;
        subt_Display    : in     vl_logic;
        sum_Display_MUX_S: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end datapath_vlg_sample_tst;
