library ieee ;
use ieee.std_logic_1164.all;

entity mde_b is
port ( clk , r , c, tot_It_s: in std_logic ;
d_mde, tot_ld, tot_clr : out std_logic );
end mde_b;

architecture ckt of mde_b is
  
type state_type is (inicio, esperar, somar, fornecer); 
  
signal y_present , y_next : state_type;

signal d: std_logic;

begin

process (c, tot_It_s, y_present)
  
begin
  
case y_present is
  
when inicio =>
y_next <= esperar; 
 
when esperar =>
if (c = '0' and tot_It_s = '1') then y_next <= esperar; 
elsif (c = '0' and tot_It_s = '0') then y_next <= fornecer;
elsif (c = '1' and tot_It_s = '1') then y_next <= somar; 
elsif (c = '1' and tot_It_s = '0') then y_next <= somar; end if;
  
when somar => 
 if (tot_It_s = '1') then y_next <= somar;
 else y_next <= esperar; end if;

when fornecer =>
  y_next <= inicio;
  
end case;

end process ;

process ( clk , r)
begin
if r = '0' then
y_present <= inicio ;
elsif ( clk ' event and clk = '1') then
y_present <= y_next ;
end if ;
end process ;


d <= '1' when y_present = fornecer else '0';
tot_clr <= '0' when y_present = inicio else '1'; -- mudei os bits
tot_ld <= '1' when y_present = somar else '0';

d_mde <= d;

end ckt;
