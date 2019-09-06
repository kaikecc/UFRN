entity mux4x1 is
  
  port( E: in bit_vector(3 downto 0);
      SEL: in bit_vector(1 downto 0);
    
        Saida : out bit);
end;

architecture ckt_mux4x1 of mux4x1 is
 
 
 signal O: bit_vector(3 downto 0);
  
 begin
  
O(0) <= E(0) and not SEL(1) and not SEL(0);
O(1) <= E(1) and not SEL(1) and SEL(0);
O(2) <= E(2) and SEL(1) and not SEL(0);
O(3) <= E(3) and SEL(1) and SEL(0);

Saida <= O(0) or O(1) or O(2) or O(3); 
  
end ckt_mux4x1;
