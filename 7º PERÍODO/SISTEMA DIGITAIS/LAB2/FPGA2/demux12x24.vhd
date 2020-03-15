
library ieee ;
use ieee.std_logic_1164.all;

entity demux12x24 is

port (E_demux12x24: in std_logic_vector(12 downto 0);
      A_demux12x24: in std_logic;
		S0_demux12X24, S1_demux12X24: out std_logic_vector(12 downto 0));
end;


architecture ckt of demux12x24 is

component demux1x2 is

port (E_demux1x2, A_demux1x2: in std_logic;
		S0_demux, S1_demux: out std_logic);
end component;


begin

D0: demux1x2 port map(E_demux12x24(0), A_demux12x24, S0_demux12X24(0), S1_demux12X24(0));
D1: demux1x2 port map(E_demux12x24(1), A_demux12x24, S0_demux12X24(1), S1_demux12X24(1));
D2: demux1x2 port map(E_demux12x24(2), A_demux12x24, S0_demux12X24(2), S1_demux12X24(2));
D3: demux1x2 port map(E_demux12x24(3), A_demux12x24, S0_demux12X24(3), S1_demux12X24(3));
D4: demux1x2 port map(E_demux12x24(4), A_demux12x24, S0_demux12X24(4), S1_demux12X24(4));
D5: demux1x2 port map(E_demux12x24(5), A_demux12x24, S0_demux12X24(5), S1_demux12X24(5));
D6: demux1x2 port map(E_demux12x24(6), A_demux12x24, S0_demux12X24(6), S1_demux12X24(6));
D7: demux1x2 port map(E_demux12x24(7), A_demux12x24, S0_demux12X24(7), S1_demux12X24(7));
D8: demux1x2 port map(E_demux12x24(8), A_demux12x24, S0_demux12X24(8), S1_demux12X24(8));
D9: demux1x2 port map(E_demux12x24(9), A_demux12x24, S0_demux12X24(9), S1_demux12X24(9));
D10: demux1x2 port map(E_demux12x24(10), A_demux12x24, S0_demux12X24(10), S1_demux12X24(10));
D11: demux1x2 port map(E_demux12x24(11), A_demux12x24, S0_demux12X24(11), S1_demux12X24(11));
D12: demux1x2 port map(E_demux12x24(12), A_demux12x24, S0_demux12X24(12), S1_demux12X24(12));


end ckt;