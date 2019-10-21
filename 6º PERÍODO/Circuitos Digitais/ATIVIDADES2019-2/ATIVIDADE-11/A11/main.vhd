entity main is
  
  port(c, clock: in bit;
       S, A: in bit_vector(7 downto 0);
       d: out bit);
end;

architecture circuito of main is

component datapath is
  
  port(aa,b: in bit_vector(7 downto 0);
  tot_ld, tot_clr, clkk: in bit;
  tot_It_s: out bit);
  
end component;

component controller is
  
  port(cc, mme, clocck: in bit;
   LD, CL, dd: out bit);
   
end component; 
  
signal ME: bit;
signal AUX: bit_vector(2 downto 0); 
 
begin
  
CLLER: controller port map(

  cc => c,
  mme => ME,
  clocck => clock,
  
  LD => AUX(0),
  CL => AUX(1), 
  dd => AUX(2));
  
DP: datapath port map(
  
  aa => A,
  b => S,
  tot_ld => AUX(0), 
  tot_clr => AUX(1), 
  clkk => clock,
  tot_It_s => ME );  
d <= AUX(2);

end circuito;
