
-- Aeq       => A == B
-- A_maior_B => A > B
-- A_menor_B => A < B

library ieee;
use ieee.std_logic_1164.all;

entity comparador4bit is
  
  port(A, B : in std_logic_vector(3 downto 0);
      AeqB, A_maior_B, A_menor_B: out std_logic);
  end;
    
architecture ckt_comparador4bits of comparador4bit is
  
  
  signal AUX0,AUX1: std_logic_vector(3 downto 0);
  signal AgtB, A_igual_B: std_logic; -- MAIOR, IGUAL
   
  
  begin
    
    AUX0(0) <= A(3) xnor B(3);
    AUX0(1) <= A(2) xnor B(2);
    AUX0(2) <= A(1) xnor B(1);
    AUX0(3) <= A(0) xnor B(0);
        
    AUX1(0) <= A(3) and not B(3);
    AUX1(1) <= AUX0(0) and not B(2) and A(2);
    AUX1(2) <= AUX0(0) and AUX0(1) and not B(1) and A(1);
    AUX1(3) <= AUX0(0) and AUX0(1) and AUX0(2) and not B(0) and A(0);    
   
   A_igual_B <= AUX0(0) and AUX0(1) and AUX0(2) and AUX0(3); -- A == B
   
   AgtB <= AUX1(0) or AUX1(1) or AUX1(2) or AUX1(3); -- A > B
    
    
    AeqB <= AUX0(0) and AUX0(1) and AUX0(2) and AUX0(3); -- A == B
    
    A_maior_B <= AUX1(0) or AUX1(1) or AUX1(2) or AUX1(3);
    
    A_menor_B <= A_igual_B nor AgtB;
    
end ckt_comparador4bits;


