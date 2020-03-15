library ieee;
use ieee.std_logic_1164.all;

entity fifo is
  
port(clk_fifo, wr_fifo, rd_fifo, reset_fifo: in std_logic;
		em, fu, ss: out std_logic;
		CF, CT: out std_logic_vector(3 downto 0);
		wr_data_fifo: in std_logic_vector(12 downto 0);
		rd_data_fifo: out std_logic_vector(12 downto 0));
	  
end;

architecture ckt of fifo is

component mde_b is
port (clk , wr, rd, reset, eq: in std_logic ;
rear_clr, rear_inc, front_clr, front_inc, rf_wr, rf_rd, full, empty : out std_logic );
end component;

component mainram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
	);
END component;

component ffd IS
port ( clk ,D ,P , C : IN std_logic ;
q : OUT std_logic );
END component;

component contador8bit is
  port( 
  clk_contador8bit: in std_logic;
  clr_contador8bit: in std_logic;
  SEL_contador8bit: in std_logic;
  Qs_contador8bit: out std_logic_vector(7 downto 0));
  
end component;

component comparador4bit is
  
  port(A, B : in std_logic_vector(3 downto 0);
      AeqB, A_maior_B, A_menor_B: out std_logic);
 end component;
 
 component mux8x4 is
  
  port( Ea_4bits, Eb_4bits: in std_logic_vector(3 downto 0);
		  SEL_4bits: in std_logic;
    
        S_4bits : out std_logic_vector(3 downto 0));
end component;
  
signal eq_cont, rear_clr_cont, rear_inc_cont, front_clr_cont, front_inc_cont: std_logic;
signal rf_rd_ram, rf_wr_ram: std_logic;
signal sel_ram: std_logic;
signal cheio, vazio: std_logic;
signal F, T, M: std_logic_vector(3 downto 0);

begin


MOORE: mde_b port map(clk_fifo, wr_fifo, rd_fifo, reset_fifo, 
eq_cont, rear_clr_cont, rear_inc_cont, front_clr_cont, front_inc_cont, rf_wr_ram, rf_rd_ram, cheio, vazio);
								
								
FRENTE: contador8bit port map(clk_fifo, not front_clr_cont, not front_inc_cont, Qs_contador8bit(3 downto 0) => F(3  downto 0));

TRAZEIRA: contador8bit port map(clk_fifo, not rear_clr_cont, not rear_inc_cont, Qs_contador8bit(3 downto 0) => T(3  downto 0));

IGUALDADE: comparador4bit port map(A => F, B => T, AeqB => eq_cont);
												
FLIPFLOPD: ffd port map(clk_fifo, '0', not rf_wr_ram, not rf_rd_ram, sel_ram);

MEMORIA_RAM: mainram port map(M, clk_fifo, wr_data_fifo, sel_ram, rd_data_fifo);

MUX: mux8x4 port map(F, T, sel_ram, M); -- A B, SEL, MUX

CF <= F;
CT <= T;

fu <= cheio;
em <= vazio;

ss <= sel_ram;
end ckt;