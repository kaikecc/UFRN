entity comparador4bit is
  
  port(X, Y : in bit_vector(3 downto 0);
      AeqB, A_maior_B, A_menor_B: out bit);
    end;
    
architecture ckt_comparador4bits of comparador4bit is
  
  
  signal AUX0,AUX1: bit_vector(3 downto 0);
  signal AgtB, A_igual_B: bit; -- MAIOR, MENOR
   
  
  begin
    
    AUX0(0) <= X(3) xnor Y(3);
    AUX0(1) <= X(2) xnor Y(2);
    AUX0(2) <= X(1) xnor Y(1);
    AUX0(3) <= X(0) xnor Y(0);
          
    
    
    
    AUX1(0) <= X(3) and not Y(3);
    AUX1(1) <= AUX0(0) and not Y(2) and X(2);
    AUX1(2) <= AUX0(0) and AUX0(1) and not Y(1) and X(1);
    AUX1(3) <= AUX0(0) and AUX0(1) and AUX0(2) and not Y(0) and X(0);    
   
   A_igual_B <= AUX0(0) and AUX0(1) and AUX0(2) and AUX0(3);
   
   AgtB <= AUX1(0) or AUX1(1) or AUX1(2) or AUX1(3);
   
    
    
    AeqB <= AUX0(0) and AUX0(1) and AUX0(2) and AUX0(3);
    
    A_maior_B <= AUX1(0) or AUX1(1) or AUX1(2) or AUX1(3);
    
    A_menor_B <= A_igual_B nor AgtB;
    
end ckt_comparador4bits;


