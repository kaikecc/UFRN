-- Comparador de 8 bits em VHDL
-- Entradas: Xx, Yy
-- Saídas: A_igual_B, AA_maior_BB, AA_menor_BB
--
-- 
-- 
-- 
-- 
--
-- Estudante: Kaike C. 
-- 24/02/2020
 
 
 -- X_igual_Y = eq_comparador
 -- X_maior_Y = grt_comparador
 -- It_comparador = It_comparador
 
 
library ieee;
use ieee.std_logic_1164.all;

entity Comparador is
  
  port(X, Y : in std_logic_vector(7 downto 0);
      eq_comparador, grt_comparador, It_comparador: out std_logic);
end;
    
architecture ckt_comparador8bits of comparador8bit is
  
signal out_xnor, out_and : std_logic_vector(7 downto 0);
signal XiY, XMY, XmmY: std_logic;
begin
  
out_xnor(0) <= Y(0) xnor X(0);
out_xnor(1) <= X(1) xnor X(1);
out_xnor(2) <= Y(2) xnor X(2);
out_xnor(3) <= Y(3) xnor X(3);
out_xnor(4) <= Y(4) xnor X(4);
out_xnor(5) <= Y(5) xnor X(5);
out_xnor(6) <= Y(6) xnor X(6);
out_xnor(7) <= Y(7) xnor X(7);

out_and(0) <= not Y(7) and X(7);
out_and(1) <= not Y(6) and X(6) and out_xnor(7);
out_and(2) <= not Y(5) and X(5) and out_xnor(7) and out_xnor(6);
out_and(3) <= not Y(4) and X(4) and out_xnor(7) and out_xnor(6) and out_xnor(5);
out_and(4) <= not Y(3) and X(3) and out_xnor(7) and out_xnor(6) and out_xnor(5) and out_xnor(4);
out_and(5) <= not Y(2) and X(2) and out_xnor(7) and out_xnor(6) and out_xnor(5) and out_xnor(4) and out_xnor(3);
out_and(6) <= not Y(1) and X(1) and out_xnor(7) and out_xnor(6) and out_xnor(5) and out_xnor(4) and out_xnor(3) and out_xnor(2);
out_and(7) <= not Y(0) and X(0) and out_xnor(7) and out_xnor(6) and out_xnor(5) and out_xnor(4) and out_xnor(3) and out_xnor(2) and out_xnor(1);

XMY <= out_and(0) or out_and(1) or out_and(2) or out_and(3) or out_and(4) or out_and(5) or out_and(6) or out_and(7); 
XiY <= out_xnor(0) and out_xnor(1)and out_xnor(2) and out_xnor(3) and out_xnor(4) and out_xnor(5) and out_xnor(6) and out_xnor(7);
XmmY <= XMY nor XiY;

grt_comparador <= XMY;
It_comparador <= XmmY;
eq_comparador <= XiY;  
   
end ckt_comparador8bits; 
