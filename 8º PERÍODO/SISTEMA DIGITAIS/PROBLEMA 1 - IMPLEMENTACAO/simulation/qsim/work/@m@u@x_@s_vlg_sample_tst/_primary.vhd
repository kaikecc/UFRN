library verilog;
use verilog.vl_types.all;
entity MUX_S_vlg_sample_tst is
    port(
        ENTA_S          : in     vl_logic_vector(7 downto 0);
        ENTB_S          : in     vl_logic_vector(7 downto 0);
        SEL_S           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MUX_S_vlg_sample_tst;
