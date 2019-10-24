entity somador1bit is
  
  port( A, B, Cin: in bit;
        S, Cout: out bit
         );
end;

architecture ckt of somador1bit is
  
 begin
   
   S <= (A xor B) xor Cin;
   Cout <= ((A xor B) and Cin) or (A and B);
  
end ckt;
