library verilog;
use verilog.vl_types.all;
entity ram_1_vlg_check_tst is
    port(
        dado_saida      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ram_1_vlg_check_tst;
