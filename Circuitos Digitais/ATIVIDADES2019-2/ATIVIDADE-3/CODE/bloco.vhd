entity bloco is
  
  port(A : in  bit_vector(3 downto 0);
       S : out bit_vector(3 downto 0));
    
end;

architecture CKT of bloco is 


 begin

  S(3) <= (not(A(3)) and A(2) and A(0)) or (not(A(3)) and A(2) and A(1)) or (A(3) and not(A(2)) and not(A(1)));
  S(2) <= (not(A(3)) and A(2) and not(A(1)) and not (A(0)));
  S(1) <= (not(A(3)) and not (A(2)) and A(1)) or (not(A(3)) and A(1) and A(0)) or (A(3) and not(A(2)) and not(A(1)) and not(A(0)));
  S(0) <= (not(A(3)) and not(A(2)) and A(0)) or (not(A(3)) and A(2) and A(1) and not(A(0))) or (A(3) and not(A(2)) and not(A(1)) and not(A(0)));

end CKT;
