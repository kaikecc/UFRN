library verilog;
use verilog.vl_types.all;
entity ram_1_vlg_sample_tst is
    port(
        ce              : in     vl_logic;
        dado_entrada    : in     vl_logic_vector(3 downto 0);
        endereco        : in     vl_logic_vector(2 downto 0);
        we              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ram_1_vlg_sample_tst;
