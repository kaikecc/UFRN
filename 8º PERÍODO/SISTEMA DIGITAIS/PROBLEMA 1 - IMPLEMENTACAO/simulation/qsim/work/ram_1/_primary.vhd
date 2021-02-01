library verilog;
use verilog.vl_types.all;
entity ram_1 is
    port(
        dado_entrada    : in     vl_logic_vector(3 downto 0);
        dado_saida      : out    vl_logic_vector(3 downto 0);
        endereco        : in     vl_logic_vector(2 downto 0);
        we              : in     vl_logic;
        ce              : in     vl_logic
    );
end ram_1;
