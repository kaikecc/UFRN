-- Mux 2 para 1 em VHDL
-- Entradas: Ea, Eb, SEL
-- Saídas: Saida
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

entity mux2x1 is
  
  port( Ea, Eb, SEL: in std_logic;
    
        Saida : out std_logic);
end;

architecture ckt_mux2x1 of mux2x1 is
  
 begin
  
  Saida <= (Ea and not(SEL)) or ( Eb and (SEL));
  
end ckt_mux2x1;
