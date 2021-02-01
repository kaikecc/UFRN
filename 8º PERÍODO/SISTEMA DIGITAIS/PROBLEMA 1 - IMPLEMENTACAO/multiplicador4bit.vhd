library ieee;
use ieee.std_logic_1164.all;

entity multiplicador4bit is
  
  port( M_A, M_B: in std_logic_vector(3 downto 0);
        M_OUT: out std_logic_vector(7 downto 0));
        
end;

architecture ckt_multiplicador4bit of multiplicador4bit is

component somador8bit is
  
port( S81, S82: in std_logic_vector(7 downto 0);
        Ce: in std_logic;
        Z: out std_logic_vector(7 downto 0);
        Cs: out std_logic);
        
end component;

signal OUT_S0, OUT_S1, OUT_S2, AUXS1, AUXS2 : std_logic_vector(7 downto 0);

begin

AUXS1(0) <= M_A(0) and M_B(0);
AUXS1(1) <= M_A(1) and M_B(0);
AUXS1(2) <= M_A(2) and M_B(0);
AUXS1(3) <= M_A(3) and M_B(0);

AUXS1(4) <= M_A(0) and M_B(1);
AUXS1(5) <= M_A(1) and M_B(1);
AUXS1(6) <= M_A(2) and M_B(1);
AUXS1(7) <= M_A(3) and M_B(1);

SUM0: somador8bit port map(
  
  S81(0) => AUXS1(0),
  S81(1) => AUXS1(1),
  S81(2) => AUXS1(2),
  S81(3) => AUXS1(3),
  S81(4) => '0',
  S81(5) => '0',
  S81(6) => '0',
  S81(7) => '0',
  
  
  S82(0) => '0',
  S82(1) =>  AUXS1(4),
  S82(2) =>  AUXS1(5),
  S82(3) =>  AUXS1(6),
  S82(4) =>  AUXS1(7),
  S82(5) => '0',
  S82(6) => '0',
  S82(7) => '0',
  
  Ce => '0',
  Z => OUT_S0);
 
AUXS2(0) <= M_A(0) and M_B(2);
AUXS2(1) <= M_A(1) and M_B(2);
AUXS2(2) <= M_A(2) and M_B(2);
AUXS2(3) <= M_A(3) and M_B(2);

AUXS2(4) <= M_A(0) and M_B(3);
AUXS2(5) <= M_A(1) and M_B(3);
AUXS2(6) <= M_A(2) and M_B(3);
AUXS2(7) <= M_A(3) and M_B(3);


SUM1: somador8bit port map(
  
  S81(0) => OUT_S0(0),
  S81(1) => OUT_S0(1),
  S81(2) => OUT_S0(2),
  S81(3) => OUT_S0(3),
  S81(4) => OUT_S0(4),
  S81(5) => OUT_S0(5),
  S81(6) => '0',
  S81(7) => '0',
  
  
  S82(0) => '0',
  S82(1) => '0',
  S82(2) =>  AUXS2(0),
  S82(3) =>  AUXS2(1),
  S82(4) =>  AUXS2(2),
  S82(5) =>  AUXS2(3),
  S82(6) => '0',
  S82(7) => '0',
  
  Ce => '0',
  Z => OUT_S1); 
  
SUM2: somador8bit port map(
  
  S81(0) => OUT_S1(0),
  S81(1) => OUT_S1(1),
  S81(2) => OUT_S1(2),
  S81(3) => OUT_S1(3),
  S81(4) => OUT_S1(4),
  S81(5) => OUT_S1(5),
  S81(6) => '0',
  S81(7) => '0',
  
  
  S82(0) => '0',
  S82(1) => '0',
  S82(2) => '0',
  S82(3) =>  AUXS2(4),
  S82(4) =>  AUXS2(5),
  S82(5) =>  AUXS2(6),
  S82(6) =>  AUXS2(7),
  S82(7) => '0',
  
  Ce => '0',
  Z => OUT_S2);
  

M_OUT <= OUT_S2;


end ckt_multiplicador4bit;