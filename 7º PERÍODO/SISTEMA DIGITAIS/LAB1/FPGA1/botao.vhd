library ieee;
use ieee.std_logic_1164.all;

entity botao is
    port (clk , r, bi: in std_logic ;
            bo : out std_logic);
end botao;

architecture button of botao is
    type state_type is (a, b, c);
    signal y_present , y_next : state_type ;
    
begin
    process (bi, y_present)
    begin
        case y_present is
            when a =>
                if bi = '1' then y_next <= a;
                else y_next <= b; end if;
            when b =>
                if bi = '1' then y_next <= a;
                else y_next <= c; end if;
            when c =>
                if bi = '1' then y_next <= a;
                else y_next <= c; end if;
        end case ;
    end process ;

    process (clk ,r)
    begin
        if r = '1' then
            y_present <= a;
        elsif (clk ' event and clk = '1') then
            y_present <= y_next ;
        end if;
    end process ;
        
    bo <= '1' when y_present = b else '0';
end button;