-- Mux 2 para 1 em VHDL
-- Entradas: Ea, Eb, SEL
-- Sa�das: Saida
--
-- SEL Saida
-- ------------
-- 0    Ea
-- 1    Eb
--
-- Estudante: Kaike C. 
-- 24/02/2020

library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
  
  port( Ea, Eb, Ec, Ed: in std_logic;
		  SELEC: in std_logic_vector(1 downto 0);
        M_Saida : out std_logic);
end;

architecture ckt_mux4x1 of mux4x1 is
  
  
 signal A, B, C, D: std_logic;
 
 begin
  
 A <= Ea and not(SELEC(0)) and not(SELEC(1));
 B <= Eb and SELEC(0) and not(SELEC(1));
 C <= Ec and not(SELEC(0)) and SELEC(1);
 D <= Ed and SELEC(0) and SELEC(1);

 
 M_Saida <= A or B or C or D;
  
end ckt_mux4x1;
