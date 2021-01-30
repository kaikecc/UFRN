library verilog;
use verilog.vl_types.all;
entity mux8x1_vlg_sample_tst is
    port(
        E_IN            : in     vl_logic_vector(7 downto 0);
        SL              : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end mux8x1_vlg_sample_tst;
