library ieee;
use ieee.std_logic_1164.all;

entity main is
  
port(c_main, clk_main, clr_main  : in std_logic;
     A_main, S_main : in std_logic_vector(7 downto 0);
     d_main: out std_logic);
  
  
end;

architecture ckt of main is

component datapath is
  
  port(a_dat,s_dat: in std_logic_vector(7 downto 0);
  tot_ld_dat, tot_clr_dat, clk_dat: in std_logic;
  tot_It_s_dat: out std_logic;
  teste: out std_logic_vector(7 downto 0));
  
end component;

component controller is
  
  port(c_controller, tot_It_s_controller, clk_controller, clr_controller: in std_logic;                               
   tot_ld_controller, tot_clr_controller, d_controller: out std_logic);
   
 end component; 
 
component mde_b is
port ( clk , r , c, tot_It_s: in std_logic ;
d_mde, tot_ld, tot_clr : out std_logic );

end component;
 
 signal clr, ld, tot_s, disp : std_logic; 
 signal REG: std_logic_vector(7 downto 0);
begin
  
 OPERACIONAL: datapath port map(
 
 -- in
 a_dat => A_main,
 s_dat => S_main,
 tot_ld_dat => ld,
 tot_clr_dat => clr,
 clk_dat => clk_main,
 -- out
 teste => REG,
 tot_It_s_dat => tot_s);
 
 MOREE: mde_b port map( 
 clk => clk_main, 
 r => clr_main, 
 c => c_main, 
 tot_It_s => tot_s,
 d_mde => disp, 
 tot_ld => ld, 
 tot_clr =>  clr);
  
--CONTROLADOR: controller port map(

--c_controller => c_main,
--clr_controller => clr_main,
--tot_It_s_controller => tot_s,
--clk_controller => clk_main,
--tot_ld_controller => ld, 
--tot_clr_controller => clr, 
--d_controller => d);

d_main <= disp;
 
end ckt;
