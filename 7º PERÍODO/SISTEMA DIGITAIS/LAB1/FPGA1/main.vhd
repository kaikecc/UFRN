--        Máquina de vendas
--
-- A_main --> VALOR DA MOEDA INSERIDA
-- S_main --> VALOR DO PRODUTO
-- c_main --> INDICAR QUE A MOEDA FOI DEPOSITADA
-- d_main --> INDICA QUE FOI LIBERADA O PRODUTO



library ieee;
use ieee.std_logic_1164.all;

entity main is
  
port(c_main, clk_main, clr_main  : in std_logic;
     S_main : in std_logic_vector(7 downto 0);
     d_main: out std_logic;
	  A_0, A_1: out std_logic_vector(6 downto 0);
     tot_0, tot_1, tot_2: out std_logic_vector(6 downto 0));
  
  
end;

architecture ckt of main is

component datapath is
  
  port(a_dat,s_dat: in std_logic_vector(7 downto 0);
  tot_ld_dat, tot_clr_dat, clk_dat: in std_logic;
  tot_It_s_dat: out std_logic;
  out_reg8bit: out std_logic_vector(7 downto 0));
  
end component;

 
component mde_b is
port ( clk , r , c, tot_It_s: in std_logic ;
d_mde, tot_ld, tot_clr : out std_logic);

end component;
 
component bin_bcd is

port(SW : in  std_logic_vector(7 downto 0);
     HEX0, HEX1, HEX2 : out std_logic_vector(6 downto 0));
  
end component;

component inverte is
generic(n : integer := 7);

port(v : in std_logic_vector(n-1 downto 0);

		o : out std_logic_vector(n-1 downto 0));

end component;

component contador8bit is
  port( 
  clk_contador8bit: in std_logic;
  clr_contador8bit: in std_logic;
  SEL_contador8bit: in std_logic;
  Qs_contador8bit: out std_logic_vector(7 downto 0));
  
end component;

component mainROM is
PORT ( address : in std_logic_vector (5 DOWNTO 0);
clock : in std_logic ;
q : out std_logic_vector (7 DOWNTO 0));
end component;

component CLK_Div is
port ( clk_in : in std_logic;
clk_out : out std_logic );
end component;

component botao is
    port (clk , r, bi: in std_logic ;
            bo : out std_logic);
end component;

 signal clr, ld, tot_s, moeda, aux, depositar : std_logic; 
 signal REG, A_main: std_logic_vector(7 downto 0);
 signal H0,H1, H2, NH0, NH1, NH2: std_logic_vector(6 downto 0);
 signal A0, A1: std_logic_vector(6 downto 0);
 signal addr : std_logic_vector(7 downto 0); -- 6 bits : 64 posicoes de memoria
 
begin

SW: botao port map(clk_main, not depositar, c_main, aux);

moeda <= not aux;
  
 OPERACIONAL: datapath port map(
 
 -- in
 a_dat => A_main,
 s_dat => S_main,
 tot_ld_dat => ld,
 tot_clr_dat => clr,
 clk_dat => clk_main,
 -- out
 out_reg8bit => REG, -- somente para imprimir
 tot_It_s_dat => tot_s);
 
 MOORE: mde_b port map( 
 clk => clk_main, 
 r => clr_main, 
 c => c_main, 
 tot_It_s => tot_s,
 d_mde => depositar, 
 tot_ld => ld, 
 tot_clr =>  clr);
 
ACUMULADOR_REG: bin_bcd port map(
   
   SW => REG,
   HEX0 => H0, 
   HEX1 => H1, 
   HEX2 => H2);
	
--TEMPO: CLK_Div port map(
--clk_in => clk_fpga,
--clk_out => clk_main);
  
ENTRADA_A: bin_bcd port map(
   
   SW => a_main,
   HEX0 => A0, 
   HEX1 => A1);
	
	
  
COUNTER: contador8bit port map(
  
  clk_contador8bit => clk_main,
  clr_contador8bit => clr_main,
  SEL_contador8bit => moeda, -- 0 está UP, 1 está PARADO
  Qs_contador8bit => addr);

MEMORIA: mainROM port map( 

address => addr(5 downto 0),
clock => clk_main,
q => A_main);  
  
--INVERSAO: inverte port map(H0, NH0);
 
d_main <= depositar;

tot_0 <= H0;
tot_1 <= H1;
tot_2 <= H2;

A_0 <= A0;
A_1 <= A1;


end ckt;