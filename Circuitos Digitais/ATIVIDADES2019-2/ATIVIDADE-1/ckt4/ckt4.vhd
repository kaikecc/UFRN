entity ckt4 is

port(A,B,C,D: in bit;
           S1,S2: OUT bit);
               
        end ckt4;

architecture CKT of ckt4 is

signal m,o,n,p : bit;-- declara as variables
 begin

    m <= D xor C;
    n <= B or C;
    o <= D or n;
    p <= A xor n;
    S1 <= m xnor o;
    S2 <= p or o;

end CKT;
