# Atv_2715_003
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Projete um circuito lógico para exibir em um conjunto de displays de 7 segmentos o valor
em BCD de um n´umero binário qualquer com 8 bits. O aluno deverá utilizar um vetor SW[7:0]
para o valor binário de entrada e a saída será direcionada para os displays de 7 segmentos
(três vetores HEX0[6:0], HEX1[6:0] e HEX2[6:0], sendo HEX0 para as unidades, HEX1 para as
dezenas e HEX2 para as centenas).


<p align="center">
  <b>Figura 1.</b>
 <a href="#">Configuração do display 7 segmentos</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62499610-b3823b00-b7b9-11e9-92eb-84c196656166.png" width="200" heigth="200"> 
 </p>
 
  
 <p align="center">
  <b>Figura 2.</b>
 <a href="#">Configuração do display 7 segmentos</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62499665-e298ac80-b7b9-11e9-8795-b0c3fc0375a2.png" width="200" heigth="200"> 
 </p>
 
 
 <p align="center">
  <b>Figura 3.</b>
 <a href="#">Configuração do display 7 segmentos</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62499735-1d9ae000-b7ba-11e9-9077-81a5440916e3.png" width="600" heigth="400"> 
 </p>
 
 * **S3** = A3'1A2A0 + A3'A2A1 + A3A2'A1';
 * **S2** = A3'A2A1'A0' + A3A2'A1'A0;
 * **S1** = A3'A2'A1' + A3'A1A0 + A3A2'A1'A0';
 * **S0** = A3'A2'A0 + A3'A2A1A0' + A3A2'A1'A0';
 
* Entidade do componente bloco:

 ``` vhdl
entity bloco is
  
  port(A : in  bit_vector(3 downto 0);
       S : out bit_vector(3 downto 0));
    
end;
```
* Arquictetura do bloco 

``` vhdl
 architecture CKT of bloco is 
 begin
  S(3) <= (not(A(3)) and A(2) and A(0)) or (not(A(3)) and A(2) and A(1)) or (A(3) and not(A(2)) and not(A(1)));
  S(2) <= (not(A(3)) and A(2) and not(A(1)) and not (A(0)));
  S(1) <= (not(A(3)) and not (A(2)) and A(1)) or (not(A(3)) and A(1) and A(0)) or (A(3) and not(A(2)) and not(A(1)) and not(A(0)));
  S(0) <= (not(A(3)) and not(A(2)) and A(0)) or (not(A(3)) and A(2) and A(1) and not(A(0))) or (A(3) and not(A(2)) and not(A(1)) and not(A(0)));
end CKT;
 ```
 * entidade da main
  ``` vhdl
entity main is
  
  port(SW : in  bit_vector(7 downto 0);
       HEX0, HEX1, HEX2 : out bit_vector(6 downto 0));
    
end;
 ```
 * arquitura da main
 ``` vhdl
architecture CKTO of main is 


component bloco is
  
 port(A : in  bit_vector(3 downto 0);
      S : out bit_vector(3 downto 0));    

end component;

signal bintodec : bit_vector(11 downto 0);
signal AUX1     : bit_vector(3 downto 0);
signal AUX2     : bit_vector(3 downto 0);
signal AUX3     : bit_vector(3 downto 0);
signal AUX4     : bit_vector(3 downto 0);
signal AUX5     : bit_vector(3 downto 0);
signal AUX6     : bit_vector(3 downto 0);
signal AUX7     : bit_vector(3 downto 0);

begin
 
B1: bloco port map(
 A(0) => SW(5),
   A(1) => SW(6), 
   A(2) => SW(7),
   A(3) => '0',
   S(0) => AUX1(0),
   S(1) => AUX1(1),
   S(2) => AUX1(2),
   S(3) => AUX1(3) );
   
   B2: bloco port map(
 A(0) => SW(4),
   A(1) => AUX1(0), 
   A(2) => AUX1(1),
   A(3) => AUX1(2),
   S(0) => AUX2(0),
   S(1) => AUX2(1),
   S(2) => AUX2(2),
   S(3) => AUX2(3) );
   
   B3: bloco port map(
 A(0) => SW(3),
   A(1) => AUX2(0), 
   A(2) => AUX2(1),
   A(3) => AUX2(2),
   S(0) => AUX3(0),
   S(1) => AUX3(1),
   S(2) => AUX3(2),
   S(3) => AUX3(3) );
   
   B4: bloco port map(
 A(0) => AUX3(3),
   A(1) => AUX2(3), 
   A(2) => AUX1(3),
   A(3) => '0',
   S(0) => AUX4(0),
   S(1) => AUX4(1),
   S(2) => AUX4(2),
   S(3) => AUX4(3) );
   
   B5: bloco port map(
 A(0) => SW(2),
   A(1) => AUX3(0), 
   A(2) => AUX3(1),
   A(3) => AUX3(2),
   S(0) => AUX5(0),
   S(1) => AUX5(1),
   S(2) => AUX5(2),
   S(3) => AUX5(3) );
   
   B6: bloco port map(
 A(0) => AUX5(3),
   A(1) => AUX4(0), 
   A(2) => AUX4(1),
   A(3) => AUX4(2),
   S(0) => AUX6(0),
   S(1) => AUX6(1),
   S(2) => AUX6(2),
   S(3) => AUX6(3) );
   
 B7: bloco port map(
 A(0) => SW(1),
   A(1) => AUX5(0), 
   A(2) => AUX5(1),
   A(3) => AUX5(2),
   S(0) => AUX7(0),
   S(1) => AUX7(1),
   S(2) => AUX7(2),
   S(3) => AUX7(3) );
   
   bintodec(0) <= SW(0);
   bintodec(1) <= AUX7(0);
   bintodec(2) <= AUX7(1);
   bintodec(3) <= AUX7(2);
   bintodec(4) <= AUX7(3);
   bintodec(5) <= AUX6(0);
   bintodec(6) <= AUX6(1);
   bintodec(7) <= AUX6(2);
   bintodec(8) <= AUX6(3);
   bintodec(9) <= AUX4(3);
   bintodec(10) <= '0';
   bintodec(11) <= '0';
   
   
   HEX0(0) <= bintodec(0);
   HEX0(1) <= bintodec(1);
   HEX0(2) <= bintodec(2);
   HEX0(3) <= bintodec(3);
   HEX0(4) <= '0';
   HEX0(5) <= '0';
   HEX0(6) <= '0';
   
   HEX1(0) <= bintodec(4);
   HEX1(1) <= bintodec(5);
   HEX1(2) <= bintodec(6);
   HEX1(3) <= bintodec(7);
   HEX1(4) <= '0';
   HEX1(5) <= '0';
   HEX1(6) <= '0';
   
   HEX2(0) <= bintodec(8);
   HEX2(1) <= bintodec(9);
   HEX2(2) <= bintodec(10);
   HEX2(3) <= bintodec(11);
   HEX2(4) <= '0';
   HEX2(5) <= '0';
   HEX2(6) <= '0';
   
   

end CKTO;
 ```
