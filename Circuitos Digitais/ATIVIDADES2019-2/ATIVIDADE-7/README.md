# Atv_2715_0067
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
<img src="https://user-images.githubusercontent.com/42541528/65080525-e2263080-d977-11e9-8a39-0a806ecaefa3.png" width="400" heigth="400"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Implementar um circuito lógico que conta em um em um até um certo valor de 4 bits definido na chave A.

### 3. CONTADOR <br/> <br/>

Os circuitos contadores são formados por configurações biestáveis denominadas flip-flops e são disponíveis na forma de circuitos integrados de diversas famílias lógicas. A família TTL (Transistor-Transistor Logic) , que é uma das mais comuns e fáceis de usar, tem circuitos contadores que podem ser interligados de modo a contar até o número que desejarmos. 
Assim, trabalhando com circuitos integrados como os da família TTL podemos escolher as funções que desejamos e montar aparelhos digitais de diversos graus de complexidade. Um circuito integrado especialmente interessante dessa família é o 7490 (quase todos os integrados desta família começam por 74, assim é ela comumente denominada família 74 ou 74xx). Este circuito integrado consiste num contador de década, ou seja, num conjunto de flip-flops e outros circuitos que são capazes de contar até 10, ou ainda, fazer divisões lógicas até 10. A saída deste circuito integrado é codificada em binário, ou seja, BCD (Binary Coded Decimal).

#### 3.1 REGISTRADOR <br/> <br/>

O conjunto de registradores possui 4 flip-flops JK da família SN76 e o funcionamento está descrito da figura 2.


<p align="center">
  <b>Figura 2.</b>
 <a href="#">Topologia do componente (esquerda) e a tabela verdade (direita) .</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65080905-c3746980-d978-11e9-97d3-9da840c9f8c4.png" width="600" heigth="600"> 
 </p>
 
 A figura 3 mostra o conjunto de flip-flops JK (7476) que forma o bloco registrador do contador. As entradas J e K de cada flip-flop são unidas e recebe do multiplexador o estado de subida (up) e descida (down). As saídas do registrador QA, QB, QC e QD são os bits que dará a representação em BCD no display.




<p align="center">
  <b>Figura 3.</b>
 <a href="#">Diagrama de ligação dos flip-flops</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65081010-046c7e00-d979-11e9-8f59-eea92a47b9ba.png" width="800" heigth="600"> 
 </p>
