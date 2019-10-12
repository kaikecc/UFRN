entity main is
  
  port( ld, shr, shr_in, shl, shl_in, set, clr, clk : in bit;
    I : in bit_vector(3 downto 0);
    S : out bit_vector(3 downto 0));
end;

architecture ckt of main is
  
component cp4bits is
  
  port(CP : in bit_vector(31 downto 0);
        SELECIONAR: in bit_vector(2 downto 0);
        S_CPP: out bit_vector(3 downto 0));
  
end component;
   
component reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end component;  


signal M, F : bit_vector(3 downto 0);
signal SSS : bit_vector(2 downto 0);

begin
  
  
 SSS(0) <= shr or (ld and set) or (not shl and not set and clr);
 SSS(1) <= ld or (not shr and not shl and set);
 SSS(2) <= shl or shr or ld;
  
  
    
BLOCO1 : cp4bits port map(

    CP(0) => '0',
    CP(1) => '1',
    CP(2) => shl_in,
    CP(3) => shl_in,
    CP(4) => F(2),
    CP(5) => F(2),
    CP(6) => I(3),
    CP(7) => F(3),
    
    CP(8) => '0',
    CP(9) => '1',
    CP(10) => F(3),
    CP(11) => F(3),
    CP(12) => F(2),
    CP(13) => F(2),
    CP(14) => I(2),
    CP(15) => F(2),
    
    
    CP(16) => '0',
    CP(17) => '1',
    CP(18) => F(1),
    CP(19) => F(1),
    CP(20) => F(0),
    CP(21) => F(0),
    CP(22) => I(1),
    CP(23) => F(1),
    
    CP(24) => '0',
    CP(25) => '1',
    CP(26) => F(1),
    CP(27) => F(1),
    CP(28) => shr_in,
    CP(29) => shr_in,
    CP(30) => I(0),
    CP(31) => F(0),  
      
    SELECIONAR => SSS,
    S_CPP => M);
    
    
BLOCO2 : reg4bit port map(
  clock2 => clk,
  RESET => '1',
  ENT => M,
  Qs => F);
  

  

      
end ckt;
    
