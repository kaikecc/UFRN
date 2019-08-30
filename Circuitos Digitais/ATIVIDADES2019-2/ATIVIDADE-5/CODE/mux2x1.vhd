entity mux2x1 is
  
  port( Ea, Eb, SEL: in bit;
    
        Saida : out bit);
end;

architecture ckt of mux2x1 is
  
 begin
  
  Saida <= (Ea and not(SEL)) or ( Eb and (SEL));
  
end ckt;

