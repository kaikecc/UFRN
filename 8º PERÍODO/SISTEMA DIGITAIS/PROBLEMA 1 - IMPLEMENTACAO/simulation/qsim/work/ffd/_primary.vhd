library verilog;
use verilog.vl_types.all;
entity ffd is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        P               : in     vl_logic;
        C               : in     vl_logic;
        q               : out    vl_logic
    );
end ffd;
