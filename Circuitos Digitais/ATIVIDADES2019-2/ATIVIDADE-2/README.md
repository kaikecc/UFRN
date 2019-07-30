# Atv_2715_002
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO



### 1. INTRODUÇÃO <br/> <br/>

> > - Implemente um circuito lógico para exibir em um display de 7 segmentos o valor decimal
correspondente a um valor binário de 3 bits. O circuito deve fazer uso apenas de CIs do tipo
7400, 7432, 7408 e 7404.


<p align="center">
<img src="https://user-images.githubusercontent.com/42541528/62086978-7dcbd800-b236-11e9-932a-6ee290b8c627.png" width="100" heigth="100"> 
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/42541528/62086997-88866d00-b236-11e9-9756-0626e24ee752.png" width="400" heigth="400"> 
 </p>

### 2. O PROCESSO DE PROJETO LÓGICO COMBINACIONAL
>
>

#### 2.1 Criar uma tabela-verdade para descrever o problema.

#### Tabela-verdade da conversão entre um número binário de 3 bits e um display de sete segmentos


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

#### 2.2 Criar uma equação para cada saída.

As expressões abaixo são resultados da simplificação por mapa K em que as entradas de **a** a **g** são entradas display de 7 segmentos.</p>
* **a** = A1' + A2A0</p>
* **b** = A0 + A2'A1' + A2A1</p>
* **c** = A2' + A1</p>
* **d** = A2 + A1'A0 + A1A0'</p>
* **e** = A1' + A0'</p>
* **f** = A2'A1' + A2'A0' + A1'A0'</p>
* **g** = A2'A0' + A1A0' + A2A0</p>

#### 2.3 Criar uma circuito lógico correspondente à equação das saídas.

![A002-1](https://user-images.githubusercontent.com/42541528/62088854-1c5b3780-b23d-11e9-8af0-0bd08e849068.png)
