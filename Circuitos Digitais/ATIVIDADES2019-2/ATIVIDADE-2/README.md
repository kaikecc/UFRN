# Atv_2715_002
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> Implemente um circuito lógico para exibir em um display de 7 segmentos o valor decimal
correspondente a um valor binário de 3 bits. O circuito deve fazer uso apenas de CIs do tipo
7400, 7432, 7408 e 7404. A figura 1 demonstra o circuito do problema.



 
<p align="center">
 <b>Figura 1.</b>
 <a href="#">Bloco entrada-saída</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62086978-7dcbd800-b236-11e9-932a-6ee290b8c627.png" width="100" heigth="100"> 
</p>

O display consiste em sete segmentos luminosos, cada um dos quais pode ser aceso independentemente dos demais. Ao exibir o dígito desejado os sinais de entrada a, b, c, d, e, f e g deve ser ligados seguindo uma tabela-verdade que mapea as entradas de até 4 bits que em um display aparecerá os valores em hexadecimal de 0 a 15. A figura 2 exibe a sequência em que deve ser construido a solução baseado em tabela verdade.

<p align="center">
  <b>Figura 2.</b>
 <a href="#">Sequência de exibição</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62086997-88866d00-b236-11e9-9756-0626e24ee752.png" width="400" heigth="400"> 
 </p>
 
<p align="center">
  <b>Figura 3.</b>
 <a href="#">Configuração do display 7 segmentos</a> 
 <br><br>
<img src="https://http2.mlstatic.com/display-led-7-segmentos-D_NQ_NP_312305-MLB20868058153_082016-F.jpg" width="200" heigth="200"> 
 </p>


### 2. O PROCESSO DE PROJETO LÓGICO COMBINACIONAL <br/> <br/>


#### 2.1 Criar uma tabela-verdade para descrever o problema. <br/> <br/>

A tabela 1 descreve a conversão de cada número binário em sinais para o display de 7 segmentos.

**TABELA 1.** Tabela-verdade da conversão entre um número binário de 3 bits e um display de sete segmentos <br/> <br/>


 
A2| A1| A0| a | b | c | d | e | f | g
--|---|---|---|---|---|---|---|---|---
0 | 0 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 1
0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0
0 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1
0 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0
1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 1 | 0
1 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1
1 | 1 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 1
1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1



#### </br>  </br>  2.2 Criar uma equação para cada saída.<br/> <br/>

As expressões abaixo são resultados da simplificação por mapa K em que as letras de **a** a **g** são entradas display de 7 segmentos.</p>

* **a** = A1' + A2A0</p>
* **b** = A0 + A2'A1' + A2A1</p>
* **c** = A2' + A1</p>
* **d** = A2 + A1'A0 + A1A0'</p>
* **e** = A1' + A0'</p>
* **f** = A2'A1' + A2'A0' + A1'A0'</p>
* **g** = A2'A0' + A1A0' + A2A0</p>

#### 2.3 Criar uma circuito lógico correspondente à equação das saídas.<br/><br/>

<p align="center">
 <b>Figura 4.</b>
 <a href="#">Circuito lógico</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62177151-420a3e80-b31a-11e9-83c7-f0e733b96e1c.png"> 
 </p>
