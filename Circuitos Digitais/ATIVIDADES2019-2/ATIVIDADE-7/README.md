# Atv_2715_007
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Implemente um circuito para contar em ordem crescente até um valor qualquer colocado
na entrada A (A3, A2, A1, A0). Ao atingir o valor da entrada A, o contador deverá contar em
ordem decrescente até 0. Ao chegar em 0, deverá contar em ordem crescente até chegar em
A novamente. Este circuito deve repetir este procedimento sempre que a entrada EN estiver
em nível alto. Por fim, sempre que a entrada CLR estiver em nível alto, o contador deverá ir
imediatamente para 0. O circuito pode fazer uso de CIs do tipo 7400, 7432, 7408, 7404, 7448,
7476 e 7485.


<p align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65080525-e2263080-d977-11e9-8a39-0a806ecaefa3.png" width="200" heigth="200"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Implementar um circuito lógico que conta em um em um até um certo valor de 4 bits definido na chave A.

### 3. CONTADOR <br/> <br/>

Os circuitos contadores são formados por configurações biestáveis denominadas flip-flops e são disponíveis na forma de circuitos integrados de diversas famílias lógicas. A família TTL (Transistor-Transistor Logic) , que é uma das mais comuns e fáceis de usar, tem circuitos contadores que podem ser interligados de modo a contar até o número que desejarmos. 
Assim, trabalhando com circuitos integrados como os da família TTL podemos escolher as funções que desejamos e montar aparelhos digitais de diversos graus de complexidade. Um circuito integrado especialmente interessante dessa família é o 7490 (quase todos os integrados desta família começam por 74, assim é ela comumente denominada família 74 ou 74xx). Este circuito integrado consiste num contador de década, ou seja, num conjunto de flip-flops e outros circuitos que são capazes de contar até 10, ou ainda, fazer divisões lógicas até 10. A saída deste circuito integrado é codificada em binário, ou seja, BCD (Binary Coded Decimal).

#### 3.1 REGISTRADOR <br/> <br/>

O conjunto de registradores possui 4 flip-flops JK da família SN76 e o funcionamento está descrito da figura 2.

 <br/> <br/>
<p align="center">
  <b>Figura 2.</b>
 <a href="#">Topologia do componente (esquerda) e a tabela verdade (direita) .</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65080905-c3746980-d978-11e9-97d3-9da840c9f8c4.png" width="600" heigth="600"> 
 </p>
  <br/> <br/>
 A figura 3 mostra o conjunto de flip-flops JK (7476) que forma o bloco registrador do contador. As entradas J e K de cada flip-flop são unidas e recebe do multiplexador o estado de subida (up) e descida (down). As saídas do registrador QA, QB, QC e QD são os bits que dará a representação em BCD no display.
 <br/> <br/>
<p align="center">
  <b>Figura 3.</b>
 <a href="#">Diagrama de ligação dos flip-flops</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65081010-046c7e00-d979-11e9-8f59-eea92a47b9ba.png" width="800" heigth="600"> 
 </p>
  <br/> <br/>
 
 #### 3.2 COMPARADORES  <br/> <br/>
  <br/> <br/>
  O componente lógicos que opera igualdade e desigualdades são chamados de compradores. O problema do contador possui dois comparadores de 4 bits de igualdade que recebe uma entrada da chave de 4 bits e o outro compara com zero para que a lógica de repetição entre o valor da chave e zero fique cíclico.  O componente U8 da figura 4 recebe as saídas QA, QB, QC e QD do registrador de 4 bits para comparar com zero e o elemento U6 recebe para comparar as saídas do registrador e a entrada da chave de 4 bits A0, A1, A2 e A3.
	Os dois comparadores têm como saída SEL1 proveniente da comparação com zero e SEL2  resultante da comparação com o valor da chave. 

 <br/> <br/>
<p align="center">
  <b>Figura 4.</b>
 <a href="#">Diagrama de ligação dos comparadores.</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65081335-cb80d900-d979-11e9-909e-d5ed464321f9.png" width="400" heigth="400"> 
 </p>
  <br/> <br/>
#### 3.3 MULTIPLEXADOR 6x3  <br/> <br/>
 <br/> <br/>
 O circuito contador foi utilizado uma lógica de multiplexador que possui seis entradas que converte em três saídas. A figura 5 mostra o esquemático do multiplexador em que as entradas AUX_A, AUX_B e QD são resultados de uma lógica combinacional up e as entradas AUX_A’, AUX_B’ e QD’ fazem parte do circuito down.
	As saídas A, B e C são entradas do registrador de 4 bits.
	
 <br/> <br/>
<p align="center">
  <b>Figura 5.</b>
 <a href="#">Diagrama de ligação do multiplexador.</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65081514-2c101600-d97a-11e9-8535-3b58d351ee6d.png" width="400" heigth="400"> 
 </p>
  <br/> <br/>
### 4. RESULTADOS <br/> <br/>
 <br/> <br/>
Após a construção dos blocos operacionais todos foram conectados no diagrama em bloco para uma melhor visualização do projeto conforme a figura 6.
 <br/> <br/>
<p align="center">
  <b>Figura 6.</b>
 <a href="#">Diagrama em bloco do contador de 4 bits.</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65081737-b3f62000-d97a-11e9-926a-83810c51c08f.png" width="400" heigth="400"> 
 </p>
  <br/> <br/>
### 5. CONCLUSÃO <br/> <br/> 
 <br/> <br/>
O trabalho do contador até um número binário colocado na chave de 4 bits mostrou-se bastante trabalhoso, mas foi possível ter um melhor contato com o flip-flop JK e entender seu funcionamento.
