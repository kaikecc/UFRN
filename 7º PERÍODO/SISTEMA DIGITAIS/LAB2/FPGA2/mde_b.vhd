library ieee ;
use ieee.std_logic_1164.all;

entity mde_b is
port ( clk , wr, rd, reset, eq: in std_logic ;
rear_clr, rear_inc, front_clr, front_inc, rf_wr, rf_rd, full, empty : out std_logic );
end mde_b;

architecture ckt of mde_b is
  
type state_type is (init, waitMT, writeMT, waiit, wriite, wriite2, reead, reead2, waitFull, readFull); 
  
signal y_present , y_next : state_type;



begin

process (wr, rd, reset, eq, y_present)
  
begin
  
case y_present is
  
when init =>
y_next <= waitMT; 
 
when waitMT =>
if (reset = '0' and wr = '0') then y_next <= waitMT;
elsif (reset = '0' and wr = '1') then y_next <= writeMT;
elsif(reset = '1') then y_next <= init; end if; 
  
when writeMT => 
 y_next <= waiit;


when waiit =>
if (reset = '0' and wr = '0' and rd = '0') then y_next <= waiit;
elsif (reset = '0' and wr = '0' and rd = '1') then y_next <= reead;
elsif (reset = '0' and wr = '1') then y_next <= wriite; end if; 
  
when wriite => 
y_next <= wriite2;

when wriite2 => 
if (eq = '0') then y_next <= waiit;
else y_next <= waitFull; end if;

when waitFull => 
if (reset = '0' and rd = '0') then y_next <= waitFull;
elsif (reset = '0' and rd = '1') then y_next <= readFull;
elsif(reset = '1') then y_next <= init; end if;

when reead => 
y_next <= reead2;

when reead2 => 
if (eq = '0') then y_next <= waiit;
else y_next <= waitMT; end if;




when readFull => 
y_next <= waiit;


  
end case;

end process ;

process ( clk , reset)
begin
if reset = '1' then
y_present <= init;
elsif ( clk ' event and clk = '1') then
y_present <= y_next ;
end if ;
end process ;

rear_clr <= '1' when y_present = init else '0';
front_clr <= '1' when y_present = init else '0';

rf_rd <= '1' when (y_present = reead or y_present = readFull or y_present = reead2 or  y_present = waiit or y_present = waitFull) else '0';
rf_wr <= '1' when (y_present = writeMT or y_present = wriite or y_present = wriite2 or y_present = waiit) else '0';


empty <= '1' when (y_present = waitMT or y_present = init) else '0';

full <= '1' when y_present = waitFull else '0';

front_inc <= '1' when (y_present = readFull or y_present = reead) else '0';


rear_inc <= '1' when (y_present = wriite or y_present = writeMT) else '0';


end ckt;
