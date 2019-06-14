entity ffd is
    port(clk,D,P,C : IN BIT;
         q : OUT BIT);

end ffd;

architecture ckt of ffd is
    
    signal qS:BIT;
    begin
       process(clk,P,C)  
       begin
        if P = '0' then qS <= '1';
        elsif C = '0' then qS <= '0';
        elsif clk = '1' AND clk'EVENT then
            qS <= D;
        end if;
    end process;
    q <= qS;
end ckt;
