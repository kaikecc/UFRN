entity ckt2 is
port(A,B,C,D: in bit;
           S1,S2: OUT bit);               
        end ckt2;

architecture CKT of ckt2 is

signal m,o,n,p : bit;-- declara as variables
 begin

    m <= A xor B;
    o <= B xnor C;
    n <= A and o;
    p <= o xor D;
    S1 <= m and n;
    S2 <= n or p;

end CKT;
