
library ieee ;
use ieee.std_logic_1164.all;

entity demux1x2 is

port (E_demux1x2, A_demux1x2: in std_logic;
		S0_demux, S1_demux: out std_logic);
end;


architecture ckt of demux1x2 is


begin

S0_demux <= E_demux1x2 and not A_demux1x2;
S1_demux <= E_demux1x2 and A_demux1x2;

end ckt;