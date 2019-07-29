# Atv_2715_002
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO



### 1. INTRODUÇÃO

> - Implemente um circuito lógico para exibir em um display de 7 segmentos o valor decimal
correspondente a um valor binário de 3 bits. O circuito deve fazer uso apenas de CIs do tipo
7400, 7432, 7408 e 7404.


![disp](https://user-images.githubusercontent.com/42541528/62086978-7dcbd800-b236-11e9-932a-6ee290b8c627.png)

![prob](https://user-images.githubusercontent.com/42541528/62086997-88866d00-b236-11e9-9756-0626e24ee752.png)

#### Tabela Verdade 1

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

**a** = A1' + A2A0
**b** = A0 + A2'A1' + A2A1
**c** = A2' + A1
**d** = A2 + A1'A0 + A1A0'
**e** = A1' + A0'
**f** = A2'A1' + A2'A0' + A1'A0'
**g** = A2'A0' + A1A0' + A2A0


