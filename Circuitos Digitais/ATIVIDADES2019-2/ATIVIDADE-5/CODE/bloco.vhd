entity bloco is
 
 port(A : in  bit_vector(3 downto 0);
      S : out bit_vector(3 downto 0));
   
end;

 architecture CKT of bloco is 
 begin
        S(3) <= A(3) OR (A(2) AND A(0)) OR (A(2) AND A(1));
        S(2) <= (A(3) AND A(0)) OR (A(2) AND (not A(1)) AND (not A(0)));        
        S(1) <= ((not A(2)) AND A(1)) OR (A(1) AND A(0)) OR (A(3) AND (not A(0)));        
        S(0) <= (A(3) AND (not A(0))) OR ((not A(3)) AND (not A(2)) AND A(0)) OR (A(2) AND A(1) AND (not A(0)));  
end CKT;
