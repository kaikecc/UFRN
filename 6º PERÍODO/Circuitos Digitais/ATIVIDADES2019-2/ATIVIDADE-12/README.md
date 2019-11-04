# Atv_2715_012
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Projete um circuito lógico para uma m´aquina de vendas. A máquina possui duas entradas
de dados, sendo uma para informar o valor da moeda inserida (A) e uma outra para entrar
com o valor do produto (S). Também conta uma entrada para indicar quando uma moeda foi
depositada (c=1) e uma sa´ıda (d=1) para liberar o produto.

<p  align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco Problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/68160384-79e4db80-ff32-11e9-88cb-42f9cefceeb1.png" width="600" heigth="400"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Desenvolver um VHD que compara o valor de entrada com o preço do produto e libera ou não a compra.

<br/> <br/>

### 3. DESENVOLVIMENTO <br/> <br/>

O projeto obedeceu o passo a passo em Nível de Transferência entre Registradores (RTL) que organizar a forma do bloco de controle se comunicar com o bloco operacional. As seções a seguir são as fases de extrair a solução de acordo com o enuciado do problema.

<br/> <br/>
#### 3.1 CRIAR UMA MÁQUINA DE ESTADOS DE ALTO NÍVEL <br/> <br/>

A máquina de estados foi desenvolvida pensando no processo que seria: **início**, **esperar**, **somar** e **fornecer**. As entradas **c** (bit), **a** (8 bits) e **s** (8bits). As saída é: **d** (bit).

<p  align="center">
  <b>Figura 2.</b>
 <a href="#">Máquina de Estados </a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/67233935-876e7180-f41a-11e9-9bc6-c2e95ef7d3f3.JPG" width="400" heigth="400"> 
 </p>

<br/> <br/>

<p  align="center">
  <b>Tabela 1.</b>
 <a href="#"> Relação entre entradas e saídas</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/67233685-1af37280-f41a-11e9-8e1f-325b5c0f89ab.JPG" width="800" heigth="600"> 
 </p>
<br/> <br/>

* Equações das saídas resultante da tabela 1: <br/> <br/>

* **d =** s1*s0;
* **tot_ld=** s1' * s0';
* **tot_clr=** s1' * s0';
* **n1=** s1' * s0 * c'*tot_lt_s'  + s1' * s0 * c;
* **n0=** s0' + s1' * s0 * c';

<br/> <br/>

#### 3.2 CRIAR UM BLOCO OPERACIONAL

As entradas **s** e **a** são de 8 bits e representar o valor do produto e a quantia que será inserido na máquina de refrigerante, respectivamente. As outras entradas tot_ld, tot_clr, tot_It_s são **LD**, **LC** e **ME**, respectivamente.

<p  align="center">
  <b>Figura 3.</b>
 <a href="#">Bloco Operacional </a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/67234345-56427100-f41b-11e9-9aa0-19eeac4ef24b.JPG" width="400" heigth="400"> 
 </p>
 
 
 #### 3.3 CONECTAR O BLOCO OPERACIONAL AO BLOCO DE CONTROLE <br/> <br/>
 

 A construção do bloco de controle possui um bloco lógico e um registrador de 2 bits que **c** representa quando uma moeda é inserida.
 <p  align="center">
  <b>Figura 3.</b>
 <a href="#">Visão completada dos blocos </a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/68160575-e4961700-ff32-11e9-9773-0b0ee8e7efa7.JPG" width="400" heigth="400"> 
 </p>
 
 ### 4. RESULTADOS <br/> <br/>
 
 
 
 ### 5. CONCLUSÃO <br/> <br/>
 
 O circuito foi desenvolvido de acordo com o proposto pelo enuciado do problema.
 

