library ieee;
use ieee.std_logic_1164.all;

entity multiplicador8bit is
  
  port( M8_A, M8_B: in std_logic_vector(7 downto 0);
        M8_OUT: out std_logic_vector(15 downto 0));
        
end;

architecture ckt_multiplicador8bit of multiplicador8bit is

component multiplicador4bit is
  
  port( M_A, M_B: in std_logic_vector(3 downto 0);
        M_OUT: out std_logic_vector(7 downto 0));
        
end component;

component somador8bit is
  
  port( S81, S82: in std_logic_vector(7 downto 0);
        Ce: in std_logic;
        Z: out std_logic_vector( 7 downto 0);
        Cs: out std_logic);
end component;

signal p: std_logic_vector(15 downto 0);
signal ADDER0, ADDER1, ADDER2: std_logic_vector(15 downto 0);
signal SUM_OUT0, SUM_OUT1, SUM_OUT2 : std_logic_vector(7 downto 0);
signal carry1, carry2, carry3 : std_logic; 
begin

M4_0: multiplicador4bit port map(
		
		M_A(0) => M8_A(0),
		M_A(1) => M8_A(1),
		M_A(2) => M8_A(2),
		M_A(3) => M8_A(3),

		M_B(0) => M8_B(0),
		M_B(1) => M8_B(1),
		M_B(2) => M8_B(2),
		M_B(3) => M8_B(3),

		M_OUT(0) => p(0),
		M_OUT(1) => p(1),
		M_OUT(2) => p(2),
		M_OUT(3) => p(3),
		M_OUT(4) => ADDER1(0),
		M_OUT(5) => ADDER1(1),
		M_OUT(6) => ADDER1(2),
		M_OUT(7) => ADDER1(3));

M4_1: multiplicador4bit port map(
		
		M_A(0) => M8_A(0),
		M_A(1) => M8_A(1),
		M_A(2) => M8_A(2),
		M_A(3) => M8_A(3),

		M_B(0) => M8_B(4),
		M_B(1) => M8_B(5),
		M_B(2) => M8_B(6),
		M_B(3) => M8_B(7),

		M_OUT(0) => ADDER0(0),
		M_OUT(1) => ADDER0(1),
		M_OUT(2) => ADDER0(2),
		M_OUT(3) => ADDER0(3),
		M_OUT(4) => ADDER0(4),
		M_OUT(5) => ADDER0(5),
		M_OUT(6) => ADDER0(6),
		M_OUT(7) => ADDER0(7));

M4_2: multiplicador4bit port map(
		
		M_A(0) => M8_A(4),
		M_A(1) => M8_A(5),
		M_A(2) => M8_A(6),
		M_A(3) => M8_A(7),

		M_B(0) => M8_B(0),
		M_B(1) => M8_B(1),
		M_B(2) => M8_B(2),
		M_B(3) => M8_B(3),

		M_OUT(0) => ADDER0(8),
		M_OUT(1) => ADDER0(9),
		M_OUT(2) => ADDER0(10),
		M_OUT(3) => ADDER0(11),
		M_OUT(4) => ADDER0(12),
		M_OUT(5) => ADDER0(13),
		M_OUT(6) => ADDER0(14),
		M_OUT(7) => ADDER0(15));
		

M4_3: multiplicador4bit port map(
		
		M_A(0) => M8_A(4),
		M_A(1) => M8_A(5),
		M_A(2) => M8_A(6),
		M_A(3) => M8_A(7),

		M_B(0) => M8_B(4),
		M_B(1) => M8_B(5),
		M_B(2) => M8_B(6),
		M_B(3) => M8_B(7),

		M_OUT(0) => ADDER2(8),
		M_OUT(1) => ADDER2(9),
		M_OUT(2) => ADDER2(10),
		M_OUT(3) => ADDER2(11),
		M_OUT(4) => ADDER2(12),
		M_OUT(5) => ADDER2(13),
		M_OUT(6) => ADDER2(14),
		M_OUT(7) => ADDER2(15));



		

		SUM0: somador8bit port map(

		S81 => ADDER0(7 downto 0),
		S82 => ADDER0(15 downto 8),
		Ce => '0',
		Cs => carry1,
		Z => SUM_OUT0(7 downto 0));
		
SUM1: somador8bit port map(

		S81(0) => ADDER1(0),
		S81(1) => ADDER1(1),
		S81(2) => ADDER1(2),
		S81(3) => ADDER1(3),
		S81(4) => '0',
		S81(5) => '0',
		S81(6) => '0',
		S81(7) => '0',
		
		S82 => SUM_OUT0(7 downto 0),
		
		Ce => '0',
		Cs => carry2,
		Z => SUM_OUT1(7 downto 0));
	
	p(7 downto 4) <= SUM_OUT1(3 downto 0);
	
	SUM2: somador8bit port map(

		S81(3 downto 0) => SUM_OUT1(7 downto 4),
		S81(4) => carry1,
		S81(5) => '0',
		S81(6) => '0',
		S81(7) => '0',
		
		S82 => ADDER2(15 downto 8), -- ADDER2(7 downto 0)
		
		Ce => '0',
		Cs => carry3,
		Z => p(15 downto 8));
		
		
M8_OUT <= p;	
	
end ckt_multiplicador8bit;