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
<img src="https://user-images.githubusercontent.com/42541528/62499735-1d9ae000-b7ba-11e9-9077-81a5440916e3.png" width="400" heigth="200"> 
 </p>
 
 * **S3** = A3'1A2A0 + A3'A2A1 + A3A2'A1';
 * **S2** = A3'A2A1'A0' + A3A2'A1'A0;
 * **S1** = A3'A2'A1' + A3'A1A0 + A3A2'A1'A0';
 * **S0** = A3'A2'A0 + A3'A2A1A0' + A3A2'A1'A0';
 
 ``` vhdl
entity bloco is
  
  port(A : in  bit_vector(3 downto 0);
       S : out bit_vector(3 downto 0));
    
end;
```
 ``` vhdl
 architecture CKT of bloco is 


 begin

 S(3) <= (not(A(3)) and A(2) and A(0)) or (not(A(3)) and A(2) and A(1)) or (A(3) and not(A(2)) and not(A(1)));
 S(2) <= (not(A(3)) and A(2) and not(A(1)) and not (A(0)));
 S(1) <= (not(A(3)) and not (A(2)) and A(1)) or (not(A(3)) and A(1) and A(0)) or (A(3) and not(A(2)) and not(A(1)) and not(A(0)));
 S(0) <= (not(A(3)) and not(A(2)) and A(0)) or (not(A(3)) and A(2) and A(1) and not(A(0))) or (A(3) and not(A(2)) and not(A(1)) and not(A(0)));

end CKT;


 ```
  ``` vhdl
entity main is
  
  port(SW : in  bit_vector(7 downto 0);
       HEX0, HEX1, HEX2 : out bit_vector(6 downto 0));
    
end;
 ```
 ``` vhdl
architecture CKTO of main is 


 component bloco is
   
  port(A : in  bit_vector(3 downto 0);
       S : out bit_vector(3 downto 0));    

end component;

signal bintodec : bit_vector(11 downto 0);

begin

 
end CKTO;
 ```
