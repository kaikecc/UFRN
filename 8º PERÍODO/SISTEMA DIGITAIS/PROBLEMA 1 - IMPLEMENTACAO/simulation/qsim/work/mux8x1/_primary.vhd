library verilog;
use verilog.vl_types.all;
entity mux8x1 is
    port(
        SL              : in     vl_logic_vector(2 downto 0);
        E_IN            : in     vl_logic_vector(7 downto 0);
        M8              : out    vl_logic
    );
end mux8x1;
