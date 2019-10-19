entity ckt1 is -- ckt1 é o nome da entidade 

port(A,B,C,D: in bit; -- define as entradas do projeto
           S1,S2: OUT bit);  -- define as saídas do projeto             
        end ckt1;

architecture CKT of ckt1 is -- CKT é o nome do projeto 

signal m,o,n,p : bit;-- declaração das variáveis auxiliares
 begin

    m <= A or B;
    o <= B xnor C;
    n <= A or o;
    p <= o or D;
    S1 <= m xor n;
    S2 <= n or p;

end CKT;
