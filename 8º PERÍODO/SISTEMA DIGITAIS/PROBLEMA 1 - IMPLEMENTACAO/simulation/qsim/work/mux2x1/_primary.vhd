library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        Ea              : in     vl_logic;
        Eb              : in     vl_logic;
        SEL             : in     vl_logic;
        Saida           : out    vl_logic
    );
end mux2x1;
