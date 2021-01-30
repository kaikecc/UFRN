-- Mux 16 para 8 em VHDL
-- Entradas: ENTA_S, ENTB_S, SEL_S
-- Saídas: S_S
--
-- SEL_S S_S
-- --------------
-- 0    ENTA_S
-- 1    ENTB_S
--
-- Estudante: Kaike C. 
-- 24/02/2020

library ieee;
use ieee.std_logic_1164.all;

entity MUX_S is
  
  port( ENTA_S, ENTB_S: in std_logic_vector(7 downto 0);
        SEL_S: in std_logic;
    
        S_S : out std_logic_vector(7 downto 0));
end;

architecture ckt_MUX_S of MUX_S is
  
  component mux2x1 is
    
  port( Ea, Eb, SEL: in std_logic;    
        Saida : out std_logic);
        
end component;

signal Saidas: std_logic_vector(7 downto 0);

 begin
  
  M0: mux2x1 port map(
    
    Ea => ENTA_S(0),
    Eb => ENTB_S(0),
    SEL => SEL_S,
    Saida => Saidas(0));
   
  M1: mux2x1 port map(
    
    Ea => ENTA_S(1),
    Eb => ENTB_S(1),
    SEL => SEL_S,
    Saida => Saidas(1)); 
    
  M2: mux2x1 port map(
    
    Ea => ENTA_S(2),
    Eb => ENTB_S(2),
    SEL => SEL_S,
    Saida => Saidas(2));
    
  M3: mux2x1 port map(
    
    Ea => ENTA_S(3),
    Eb => ENTB_S(3),
    SEL => SEL_S,
    Saida => Saidas(3));
    
  M4: mux2x1 port map(
    
    Ea => ENTA_S(4),
    Eb => ENTB_S(4),
    SEL => SEL_S,
    Saida => Saidas(4));
    
  M5: mux2x1 port map(
    
    Ea => ENTA_S(5),
    Eb => ENTB_S(5),
    SEL => SEL_S,
    Saida => Saidas(5));
    
  M6: mux2x1 port map(
    
    Ea => ENTA_S(6),
    Eb => ENTB_S(6),
    SEL => SEL_S,
    Saida => Saidas(6));
    
  M7: mux2x1 port map(
    
    Ea => ENTA_S(7),
    Eb => ENTB_S(7),
    SEL => SEL_S,
    Saida => Saidas(7));
   
  S_S <= Saidas; 
  
end ckt_MUX_S;
