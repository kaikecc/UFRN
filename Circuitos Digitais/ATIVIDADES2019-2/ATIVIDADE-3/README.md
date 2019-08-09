# Atv_2715_003
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Projete um circuito lógico para exibir em um conjunto de displays de 7 segmentos o valor
em BCD de um número binário qualquer com 8 bits. O aluno deverá utilizar um vetor SW[7:0]
para o valor binário de entrada e a saída será direcionada para os displays de 7 segmentos
(três vetores HEX0[6:0], HEX1[6:0] e HEX2[6:0], sendo HEX0 para as unidades, HEX1 para as
dezenas e HEX2 para as centenas).


<p align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco do problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62499610-b3823b00-b7b9-11e9-92eb-84c196656166.png" width="200" heigth="200"> 
 </p>
 
 
 
 <p align="center">
  <b>Figura 3.</b>
 <a href="#">Diagrama da conversão binário-BCD</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62499735-1d9ae000-b7ba-11e9-9077-81a5440916e3.png" width="600" heigth="400"> 
 </p>
 
 ### 2. OBJETIVO <br/> <br/>
 
 Criar um conversor de número binário para dois display de sete segmentos para a sequência da figura 3.
 
 ### </br>  </br> 3. O PROCESSO DE PROJETO LÓGICO COMBINACIONAL <br/> <br/>
 
 #### </br>  </br> 3.1 Criar uma tabela-verdade para descrever o problema. <br/> <br/>
 
 <p align="center">
  <b>Figura 2.</b>
 <a href="#">Tabela Verdade BCD</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62499665-e298ac80-b7b9-11e9-8795-b0c3fc0375a2.png" width="200" heigth="200"> 
 </p>
 
 #### </br>  </br>  3.2 Criar uma equação para cada saída.<br/> <br/>
 
  Expressão decorrente da figura 2.
 
 * **S3** = A3'A2A0 + A3'A2A1 + A3A2'A1';
 * **S2** = A3'A2A1'A0' + A3A2'A1'A0;
 * **S1** = A3'A2'A1' + A3'A1A0 + A3A2'A1'A0';
 * **S0** = A3'A2'A0 + A3'A2A1A0' + A3A2'A1'A0';
 
### </br> </br> 4. DESCRIÇÃO EM LINGUAGEM DE HARDWARE

#### </br> </br> 4.1 VHD COMPONENTE BLOCO

O código a seguir faz parte da entidade do bloco em que as entradas e saídas são declaradas. 

``` vhdl
entity bloco is -- entidade chamada bloco
  
  port(A : in  bit_vector(3 downto 0); -- vetor de 4 posicoes como entrada
       S : out bit_vector(3 downto 0)); -- vetor de 4 posicoes como saida
    
end;
```
Essa segunda parte do código diz a respeito da arquitetura, isto é, onde acontece as ligações entres as portas lógicas.

``` vhdl
 architecture CKT of bloco is -- CKT nome da arquitetura do bloco
 begin
 
 -- Faz parte do conjunto de expressões da figura 2
 
  S(3) <= (not(A(3)) and A(2) and (A(0)) or A(1))) or (A(3) and not(A(2)) and not(A(1)));
  S(2) <= (not(A(3)) and A(2) and not(A(1)) and not (A(0)));
  S(1) <= ((not(A(2)) and not (A(1)) and (not(A(3)) or A(3) and not(A(0))) or (not(A(3)) and A(1) and A(0)));
  S(0) <= (not(A(3)) and not(A(2)) and A(0)) or (A(1) and not(A(0))) and (not(A(3) and A(2) or A(3) and not (A(2)));
end CKT;
 ```
 

 
 
 #### </br> </br> 4.2 VHD MAIN
 
 A figura 4 
 
 <p align="center">
 <b>Figura 4.</b>
 <a href="#">Bloco de conversão com labels</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62580305-44214f80-b87c-11e9-857b-1eef0c99665f.png"  width="600" heigth="400"> 
 </p>
 
 
 * entidade da main
  ``` vhdl
entity main is
  
  port(SW : in  bit_vector(7 downto 0);
       HEX0, HEX1, HEX2 : out bit_vector(6 downto 0));
    
end;
 ```
 * Arquitetura da main:
 ``` vhdl
architecture CKTO of main is 


component bloco is
 
port(A : in  bit_vector(3 downto 0);
     S : out bit_vector(3 downto 0));    

end component;

signal bintodec : bit_vector(11 downto 0);
signal AUX1, AUX2, AUX3, AUX4, AUX5, AUX6, AUX7: bit_vector(3 downto 0);


begin
  
 
B1: bloco port map(
A(2 downto 0) => SW(7 downto 5),
A(3) => '0', 
S => AUX1);
   
B2: bloco port map( 
A(0) => SW(4),
A(3 downto 1) => AUX1(2 downto 0),
S => AUX2);
   
B3: bloco port map(
A(0) => SW(3),
A(3 downto 1) => AUX2(2 downto 0),
S => AUX3);

B4: bloco port map(
A(0) => AUX3(3),
A(1) => AUX2(3),
A(2) => AUX1(3),
A(3) => '0',
S => AUX4);
  
B5: bloco port map(
A(0) => SW(2),
A(3 downto 1) => AUX3(2 downto 0),
S => AUX5);
  
   
B6: bloco port map( 
A(0) => AUX5(3),
A(3 downto 1) => AUX4(2 downto 0),
S => AUX6 );

B7: bloco port map( 
A(0) => SW(1), 
A(3 downto 1) => AUX5(2 downto 0),
S => AUX7);

-- PRIMIERO DIGITO
   bintodec(0) <= SW(0);
   bintodec(1) <= AUX7(0);
   bintodec(2) <= AUX7(1);
   bintodec(3) <= AUX7(2);
-- SEGUNDO DIGITO
   bintodec(4) <= AUX7(3);
   bintodec(5) <= AUX6(0);
   bintodec(6) <= AUX6(1);
   bintodec(7) <= AUX6(2);
--TERCEIRO DIGITO
   bintodec(8) <= AUX6(3);
   bintodec(9) <= AUX4(3);
   bintodec(10) <= '0';
   bintodec(11) <= '0';
   
   
   HEX0(3 downto 0) <= bintodec(3 downto 0);
   HEX0(6 downto 4) <= '0';  
   
   
   HEX1(3 downto 0) <= bintodec(7 downto 4);
   HEX1(6 downto 4) <= '0';
   
   
   HEX2(3 downto 0) <= bintodec(11 downto 8);
   HEX2(6 downto 4) <= '0';

end CKTO;
 ```
 * Arquivo .do:
``` vhdl
vsim main

add wave *

force SW(0) 0 0, 1 2 -repeat 4
force SW(1) 0 0, 1 4 -repeat 8
force SW(2) 0 0, 1 8 -repeat 16
force SW(3) 0 0, 1 16 -repeat 32
force SW(4) 0 0, 1 32 -repeat 64
force SW(5) 0 0, 1 64 -repeat 128
force SW(6) 0 0, 1 128 -repeat 256
force SW(7) 0 0, 1 256 -repeat 512


run 512
 ```
###</br> </br> 5. CONCLUSÃO

 <p align="center">
  <b>Figura 5.</b>
 <a href="#">Tabela Verdade BCD</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62778746-971b2280-ba87-11e9-93e7-f23112afb061.png" width="200" heigth="200"> 
 </p>
