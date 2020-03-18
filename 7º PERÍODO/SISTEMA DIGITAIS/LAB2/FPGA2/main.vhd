
library ieee;
use ieee.std_logic_1164.all;

entity main is
  
  port(SW0, SW1: in std_logic;
		  clk_main, clk_rom: in std_logic;
		  KEY3: in std_logic;
		  H0, H1, H2, H3: out std_logic_vector(6 downto 0);
		  HX0, HX1: out std_logic_vector(6 downto 0);
		  LEDR0, LEDR1: out std_logic);
			
end;

architecture ckt of main is
  
  
component fifo is
  
port(clk_fifo, wr_fifo, rd_fifo, reset_fifo: in std_logic;
		em, fu, ss: out std_logic;
		CF, CT: out std_logic_vector(3 downto 0);
		wr_data_fifo: in std_logic_vector(12 downto 0);
		rd_data_fifo: out std_logic_vector(12 downto 0));
	  
end component;

component mainrom IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
	);
END component;

component bin_bcd is

port(SW : in  std_logic_vector(7 downto 0);
     HEX0, HEX1, HEX2 : out std_logic_vector(6 downto 0));
  
end component;

component contador8bit is
  port( 
  clk_contador8bit: in std_logic;
  clr_contador8bit: in std_logic;
  SEL_contador8bit: in std_logic;
  Qs_contador8bit: out std_logic_vector(7 downto 0));
  
end component;


signal WR_DATA, RD_DATA: std_logic_vector(12 downto 0);
signal endereco: std_logic_vector(5 downto 0);

 begin
  
FILA: fifo port map(clk_fifo => clk_main, wr_fifo => SW1, rd_fifo => SW0,
reset_fifo => not KEY3, em => LEDR1, fu => LEDR0, wr_data_fifo => WR_DATA, rd_data_fifo => RD_DATA);

CONTADOR: contador8bit port map(clk_main, KEY3, not SW1, Qs_contador8bit(5 downto 0) => endereco);

ROM: mainrom port map(endereco, clk_rom, WR_DATA);

H0123: bin_bcd port map(RD_DATA(7 downto 0), H0, H1, H2);

H4: bin_bcd port map(
							SW(4 downto 0) => RD_DATA(12 downto 8), 
							SW(5) => '0',
							SW(6) => '0',
							SW(7) => '0',
							
							HEX0 => H3);
							
SEGMENTOS: bin_bcd port map(SW(5 downto 0) => endereco, 
									 SW(6) => '0',
						          SW(7) => '0',						      	 
									 HEX0 => HX0, HEX1 => HX1);

 
  
end ckt;
