library verilog;
use verilog.vl_types.all;
entity Comparador is
    port(
        X               : in     vl_logic_vector(7 downto 0);
        Y               : in     vl_logic_vector(7 downto 0);
        eq_comparador   : out    vl_logic;
        grt_comparador  : out    vl_logic;
        It_comparador   : out    vl_logic
    );
end Comparador;
