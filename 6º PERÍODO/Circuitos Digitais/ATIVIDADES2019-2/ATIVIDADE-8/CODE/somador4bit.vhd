entity somador4bit is
  
port(Z, W: in bit_vector(3 downto 0);
  Ci: in bit;
  R: out bit_vector(3 downto 0));
  
end;

architecture ckt_somador of somador4bit is
  
component somador1bit is
  
  port( A, B, Cin: in bit;
        S, Cout: out bit
         );
end component;
 
 signal SS, CO: bit_vector(3 downto 0);
 
  
begin
  
S0: somador1bit port map(
     A => Z(0),
     B => W(0),
     Cin => Ci,
     S => SS(0),
     Cout => CO(0));
     
     S1: somador1bit port map(
     A => Z(1),
     B => W(1),
     Cin => CO(0),
     S => SS(1),
     Cout => CO(1));
     
  S2: somador1bit port map(
     A => Z(2),
     B => W(2),
     Cin => CO(1),
     S => SS(2),
     Cout => CO(2));  
  
    S3: somador1bit port map(
     A => Z(3),
     B => W(3),
     Cin => CO(2),
     S => SS(3),
     Cout => CO(3)); 
     
     R <= SS; 
end ckt_somador;
