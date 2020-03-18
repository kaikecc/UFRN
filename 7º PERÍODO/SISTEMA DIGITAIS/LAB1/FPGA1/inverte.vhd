library ieee;
use ieee.std_logic_1164.all;


entity inverte is
generic(n : integer := 7);

port(v : in std_logic_vector(n-1 downto 0);

		o : out std_logic_vector(n-1 downto 0));

end inverte;

architecture ckt of inverte is


function "NOT" (a : std_logic_vector(n-1 downto 0)) return std_logic_vector is

variable s : std_logic_vector(n-1 downto 0);

begin

for i in 0 to n-1 loop

s(i) := not a(i);

end loop;

return s;
end "NOT";

begin

o <= NOT v;


end ckt;