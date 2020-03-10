library ieee;
use ieee.std_logic_1164.all;

entity combinational_logic is
  
  port(c_comb_logic, tot_It_s_comb_logic, s0, s1: in std_logic;  -- e0 == c
                                                                 -- e1 == tot_It_s
                                   
        d_comb_logic, tot_ld_comb_logic, tot_clr_comb_logic, n1, n0: out std_logic);
        
end;

architecture ckto of combinational_logic is
  
signal oout: std_logic_vector(4 downto 0);
  
begin
    
 oout(0) <= (s1 and s0);                                                   -- d
 
 oout(1) <= s1 and not(s0);                                                -- tot_ld
 
 oout(2) <= not(s1) and not(s0);                                           -- tot_clr
 
 oout(3) <= (not(s1) and s0 and not(c_comb_logic) and not(tot_It_s_comb_logic)) or (not(s1) and s0 and c_comb_logic); -- n1
 
 oout(4) <= not(s0) or (not(s1) and s0 and not(c_comb_logic));                        -- n0
   
d_comb_logic <= oout(0);  
tot_ld_comb_logic <= oout(1);
tot_clr_comb_logic <= oout(2);

n0 <= oout(4);
n1 <= oout(3);

end ckto;
