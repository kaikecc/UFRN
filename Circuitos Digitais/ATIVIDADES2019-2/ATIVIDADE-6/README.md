# Atv_2715_006
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Implemente dois circuitos lógicos (X e Y) para exibir na saída Z (4 Bits) os valores definidos
em uma entrada A (4 Bits). Os dados da entrada A devem ser transmitidos do circuito Y para
o circuito X de forma serial, ou seja, 1 bit por vez. Uma outra entrada K (2 Bits) deverá ser
adicionada para zerar a saída dos registradores do circuito X ou Y. <br/> <br/>



<p align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64452107-0c483a80-d0bc-11e9-8bc4-21733da550b1.png" width="600" heigth="600"> 
 </p>


### 2. OBJETIVO <br/> <br/>

### 3. DESCRIÇÃO EM LINGUAGEM DE HARDWARE <br/> <br/>

#### 3.1 REGISTRADORES <br/> <br/>

Um registrador de **N** bits de base 2 é um componente que armazena bits. O nome comum de armazenar os valores é **carregar**, mas também se utiliza as palavras escrever e armazenar. É possível fazer a leitura de um registrador atráves de suas saídas. Um circuito simples de registrador consiste em conjunto de flip-flops que são carregados a cada ciclo de relógio.

#### 3.1.1 REGISTRADOR DE CARGA PARALELA <br/> <br/>

A utilização de carga paralela permite com que uma informação seja carregada em paralela em um registrador e possibilita uma maior flexibilidade no controle do tipo, manter a informação, carregar e deslocar os bits nele armazenado.



#### 3.2 CIRCUITO Y <br/> <br/>

<p align="center">
  <b>Figura 2.</b>
 <a href="#">Circuito Y</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64476399-83d1a480-d164-11e9-92fd-cd20033a2b51.png" width="400" heigth="400"> 
 </p>


#### 3.2 CIRCUITO X <br/> <br/>

<p align="center">
  <b>Figura 3.</b>
 <a href="#">Registrador 4 bits com carga paralela</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64476288-5afcdf80-d163-11e9-9a77-f6d8e0f5cdab.png" width="400" heigth="400"> 
 </p>

<p align="center">
  <b>Figura 4.</b>
 <a href="#">Bloco solução</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64451824-65639e80-d0bb-11e9-94f7-113ea5eb3b76.png" width="600" heigth="600"> 
 </p>
