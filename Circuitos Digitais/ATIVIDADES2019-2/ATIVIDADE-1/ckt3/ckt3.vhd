entity ckt3 is

port(A,B,C,D: in bit;
           S1,S2: OUT bit);               
        end ckt3;

architecture CKT of ckt3 is

signal m,o,n,p : bit;-- declara as variables
 begin

    m <= D or C;
    n <= B and C;
    o <= D and n;
    p <= A or n;
    S1 <= m xnor o;
    S2 <= p or o;

end CKT;
