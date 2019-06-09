entity FFJK is
 port(clk,J,K,P,C:in bit;
   q,qb:out bit);
end FFJK;

architecture ckt of FFJK is

signal qS: bit;

begin

 process(clk,P,C)
 begin
  if P='0' then qS<='1';
  elsif C='0' then qS<='0';
  elsif clk='1' and clk'event then
   if J='1' and K='1' then qS <= not qS;
   elsif J='1' and K='0' then qS<='1';
   elsif J='0' and K='1' then qS<='0';
    end if;
  end if;
 end process;
 q<=qS;
 qb<=NOT qS;
end ckt;
