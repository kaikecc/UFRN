entity somador8bit is --
  
  port( X, Y: in bit_vector(7 downto 0);
        Ce: in bit;
        Z: out bit_vector( 7 downto 0);
        Cs: out bit);
end;

architecture ckt of somador8bit is
  
component somador1bit is
  
  port( A, B, Cin: in bit;
        S, Cout: out bit
         );
end component;


signal Co: bit_vector(7 downto 0);--Cout
signal O: bit_vector(7 downto 0); -- saída

begin
 
S0: somador1bit port map(

    A => X(0),
    B => Y(0),
    Cin => Ce,
    S => O(0),
    Cout => Co(0));  
   
S1: somador1bit port map(

    A => X(1),
    B => Y(1),
    Cin => Co(0),
    S => O(1),
    Cout => Co(1));  
S2: somador1bit port map(

    A => X(2),
    B => Y(2),
    Cin => Co(1),
     S => O(2),
    Cout => Co(2)); 
S3: somador1bit port map(

    A => X(3),
    B => Y(3),
     S => O(3),
    Cin => Co(2),
    Cout => Co(3));   
S4: somador1bit port map(

    A => X(4),
    B => Y(4),
    Cin => Co(3),
     S => O(4),
    Cout => Co(4));
S5: somador1bit port map(

    A => X(5),
    B => Y(5),
    Cin => Co(4),
     S => O(5),
    Cout => Co(5));
S6: somador1bit port map(

    A => X(6),
    B => Y(6),
    Cin => Co(5),
     S => O(6),
    Cout => Co(6));
S7: somador1bit port map(

    A => X(7),
    B => Y(7),
    Cin => Co(6),
     S => O(7),
    Cout => Co(7));
    
  Cs <= Co(7);    
  Z <= O;  
      
end ckt;


