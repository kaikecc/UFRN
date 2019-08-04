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


O display consiste em sete segmentos luminosos, cada um dos quais pode ser aceso independentemente dos demais. Ao exibir o dígito desejado os sinais de entrada a, b, c, d, e, f e g devem ser ligados seguindo uma tabela-verdade que mapea as entradas de até 4 bits que em um display aparecerá os valores em hexadecimal de 0 a 15. A figura 2 exibe a estrutura dos segmentos com as entradas de a-g.

<p align="center">
  <b>Figura 2.</b>
 <a href="#">Configuração do display 7 segmentos</a> 
 <br><br>
<img src="https://http2.mlstatic.com/display-led-7-segmentos-D_NQ_NP_312305-MLB20868058153_082016-F.jpg" width="200" heigth="200"> 
 </p>
 
### </br>  </br> 2. OBJETIVO

Criar um conversor de número binário para um display de sete segmentos para a sequência da figura 3.

 </br>  </br>
<p align="center">
  <b>Figura 3.</b>
 <a href="#">Sequência de exibição</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62086997-88866d00-b236-11e9-9756-0626e24ee752.png" width="400" heigth="400"> 
 </p>
 

### </br>  </br> 3. O PROCESSO DE PROJETO LÓGICO COMBINACIONAL <br/> <br/>

O método direto para projetar lógica combinacional segue as seções a seguir.

#### </br>  </br> 3.1 Criar uma tabela-verdade para descrever o problema. <br/> <br/>

A tabela 1 descreve a conversão de cada número binário em sinais para o display de 7 segmentos. Os bits A0, A1 e A2 formam a entrada de 000-111 e as letras de a-g a saída correspondente a ordem da sequência da figura 3.

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



#### </br>  </br>  3.2 Criar uma equação para cada saída.<br/> <br/>

As expressões abaixo são resultados da simplificação por mapa K em que as letras de **a** a **g**. Dessa forma, o circuito lógico pode ser criado.</p>

* **a** = A1' + A2A0</p>
* **b** = A0 + A2'A1' + A2A1</p>
* **c** = A2' + A1</p>
* **d** = A2 + A1'A0 + A1A0'</p>
* **e** = A1' + A0'</p>
* **f** = A2'A1' + A2'A0' + A1'A0'</p>
* **g** = A2'A0' + A1A0' + A2A0</p>

#### </br>  </br> 3.3 Criar um circuito lógico correspondente à equação das saídas.<br/><br/>
 
 
 O circuito abaixo foi desenvolvido no logisim seguindo a lógica de expressões.<br/><br/>
<p align="center">
 <b>Figura 4.</b>
 <a href="#">Circuito lógico</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/62177151-420a3e80-b31a-11e9-83c7-f0e733b96e1c.png"> 
 </p>

### 4. CONCLUSÃO <br/> <br/>

O desenvolvimento desse trabalho possibilitou o contato com montagem de circuito em protoboard e o início de projeto em que a partir de um problema foi construido uma solução baseado em um projeto lógico.
 
