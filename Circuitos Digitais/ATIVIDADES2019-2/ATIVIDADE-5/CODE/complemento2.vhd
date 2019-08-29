entity complemento2 is
  
  port( C : in bit_vector(6 downto 0);
    
        R : out bit_vector(6 downto 0));
end;

architecture ckt of complemento2 is
 
component somador8bit is
  
  port( X, Y: in bit_vector(7 downto 0);
        Ce: in bit;
        Z: out bit_vector( 7 downto 0);
        Cs: out bit 
         );
end component;


signal I : bit_vector(6 downto 0); 
signal AUX : bit_vector(7 downto 0); 
begin
  
I(0) <= not(C(0));
I(1) <= not(C(1));
I(2) <= not(C(2));
I(3) <= not(C(3));
I(4) <= not(C(4));
I(5) <= not(C(5));
I(6) <= not(C(6));


B1 : somador8bit port map(
  
   X(6 downto 0) => I(6 downto 0),
   X(7) => '0',   
   Y(0) => '1',
   Y(1) => '0',
   Y(2) => '0',
   Y(3) => '0',
   Y(4) => '0',
   Y(5) => '0',
   Y(6) => '0',
   Y(7) => '0',
   Ce   => '0',
   Z(7 downto 0) => AUX(7 downto 0)); 
      
   R <= AUX(6 downto 0);
   
  
end ckt;

