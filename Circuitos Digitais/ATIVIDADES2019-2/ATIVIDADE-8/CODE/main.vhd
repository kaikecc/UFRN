entity main is
  
  port(A,B: in bit_vector(3 downto 0);
    EN, CLR, clock: in bit;
    C: out bit_vector(3 downto 0));
end;

architecture ckto of main is
 
component comparador4bit is
  
  port(X, Y : in bit_vector(3 downto 0);
      AeqB, A_maior_B, A_menor_B: out bit);
      
end component; 
  
component mux8x4 is
  
  port(E1, E2: in bit_vector(3 downto 0);
      SELEC: in bit;
      M: out bit_vector(3 downto 0));
      
end component; 

component cp4bit is
  port (
    E0: in bit_vector(3 downto 0); -- recebem as saidas do flipflop
    E1: in bit_vector(3 downto 0); -- recebe o valor pra iniciar
    E2: in bit_vector(3 downto 0); -- E2(3) => '0', e o resto recebe as saidas do flipflops
    E3: in bit_vector(3 downto 0); -- por enquanto tudo zero
       
    SS: in bit_vector(1 downto 0); -- SELETOR 2 BITS
    
    V: out bit_vector(3 downto 0)); -- entradas do flipflops
    
end component;

 component reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end component;

component ffd IS
port ( clk ,D ,P , C : IN BIT ;
q : OUT BIT );

 end component;

component somador4bit is
  
port(Z, W: in bit_vector(3 downto 0);
  Ci: in bit;
  R: out bit_vector(3 downto 0));
  
end component;


signal A1, A2, A3, B1, B2, B3, AA1, AA2, AA3, AAA1, A11: bit;
signal menor_valor, maior_valor: bit_vector(3 downto 0);
signal Qmais, Qmenos: bit_vector(3 downto 0);
signal s0, s1, ss0, ss1: bit;
signal mux_saida: bit_vector(3 downto 0);
signal QQ: bit_vector(3 downto 0);


begin 
 
----------- COMPARACAO PARA O MENOR VALOR ------------- 
comparador_4_bits_A_menor_B: comparador4bit port map(
  
      X => A,
      Y => B,
      A_menor_B => A1);

AA1 <= A1;

MX8X4: mux8x4 port map(
    
     E1 => B,
     E2 => A,
     SELEC => AA1,
     M => menor_valor);
 ------------ FIM ------------------
 
 
 --------- COMPARAÇÃO PARA O MAIOR VALOR ----------    
     
  comparador_4_bits_A_maior_B: comparador4bit port map(
  
      X => A,
      Y => B,
      A_maior_B => A11);

AAA1 <= A11;

multiplixeador8x4: mux8x4 port map(
    
     E1 => B,
     E2 => A,
     SELEC => AAA1,
     M => maior_valor);   
-------- FIM ------------------------
     
carga_paralela: cp4bit port map(

    E0 => menor_valor,
    E1 => Qmais,
    E2 => Qmenos,
  --  E3(0) => '0', 
  --  E3(1) => '0', 
  --  E3(2) => '0', 
 --   E3(3) => '0', 
 E3 => QQ,
    SS(0) => ss0, -- MODIFIFCADO DE s0 para ss0
    SS(1) => ss1, -- MODIFICADO DE s1 para ss1
    
    V => mux_saida);
  
registrador_4_bits: reg4bit port map(
  
  clock2 => clock,
  RESET => CLR,
  ENT => mux_saida,
  Qs => QQ); -- saida do registrador
 
 ------------ COMPARADOR PARA MENOR VALOR ---------
 comparador_4_bits_igualdade_1: comparador4bit port map(
  
      X => menor_valor,
      Y => QQ,
      AeqB => A3); 
 ---------------------------------

   AA3 <= A3;
 
 ----- COMPARADOR 
  comparador_4_bits_igualdade_2: comparador4bit port map(
  
      X => maior_valor,
      Y => QQ,
      AeqB => A2); 
      
      AA2 <= A2;
   ---------------------   
      B1 <= not(AA2);
  ---------------------------    
  flip_flop_D0: ffd port map(
  
      clk => AA2,
      D => AA2,
      P => '1',
      C => B2,
      q => s1);
    
     B2 <= not(AA3);
     
    flip_flop_D1: ffd port map(
  
      clk => AA3,
      D => AA3,
      P => '1',
      C => B1,
      q => s0);  
      
 ss0 <= EN or (s0 and not EN); -- colocado agora
 ss1 <= EN or (s1 and not EN); -- colocado agora     
      
somador_4_bit_0: somador4bit port map(

    Z => QQ,
    W(0) => '1',
    W(1) => '0',
    W(2) => '0',
    W(3) => '0', 
    Ci => '0',
    R => Qmais);
    
  somador_4_bit_1: somador4bit port map(

    Z => QQ,
    W(0) => '1',
    W(1) => '1',
    W(2) => '1',
    W(3) => '1', 
    Ci => '0',
    R => Qmenos);
          
  C <= QQ;
  
end ckto;

