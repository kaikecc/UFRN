
-- contruir um bloco de design   
entity aula1 is -- aula é o nome da entidade

-- enderaçamento de entradas
  port (A,B,C : in bit; -- (signal_name, signal_name : mode type
         x,y  : OUT bit);
end aula1;


Architecture CKT of aula1 is

Signal m,n : bit;-- declara as variables
begin 
  
  m <= A and B;   
  
  n <= B or C;
  
  x <= m xor n;
  
  y  <= n; 
  
  
  
end CKT;