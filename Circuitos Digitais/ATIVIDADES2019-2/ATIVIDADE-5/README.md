# Atv_2715_005
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Projete um circuito um circuito lógico para exibir em um vetor de saída (V) de 8 bits o
valor, em BCD, correspondente ao módulo de um número (B) de 7 bits (Considere o B6 como
o bit de sinal).

O uso do sinal e magnitude é bastante eficientes em alguns casos para representação de valores. Nesta representação, o bit de ordem mais elevada é usado apenas para representar o sinal do número, sendo 0 positivo e 1 como negativo. Os próximos bits representam a magnitude ou módulo do número.
<p align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco do problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/63904305-e1d4ee00-c9e6-11e9-8201-87064fc3df44.png" width="400" heigth="400"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Desenvolver um VHD que imprima o módulo de um número de 7 bits.

### 3. DESENVOLVIMENTO EM BLOCOS <br/> <br/>

#### 3.1 COMPLEMENTO A 2 <br/> <br/>

O processo de fazer o complemento a dois de um número binário é invertendo todos os bits e somando 1. Por exemplo, um número de 4 bits sendo 1001 que em decimal representa -7 para realizar o complemento a dois basta inverter 0110 e depois somar 1 que resultará em 0111 tendo sua representação de 7 em decimal.
A figura 2 apresenta o bloco complemento a dois que consite em um somador de 8 bits que na entrada **A** é o valor de 8 bits e na entrada 1 é o valor em binário de um em 8 bits ao somar 1 e inverter A tem-se o seu complemento.

<p align="center">
  <b>Figura 2.</b>
 <a href="#">Bloco complemento a 2</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64068996-2646d080-cc17-11e9-919c-18fc52718337.png" width="300" heigth="300"> 
 </p>
 
#### 3.2 MULTIPLEXADOR 14x7 <br/> <br/>

O multiplexador é o seletor do problema. Com ele, é possível utilizar dois ou mais valores para abaster a solução de um problema. A figura 3 trata-se de multiplexador 14x7 construido a partir de 7 mux 2x1 com seletores em unidos. 

<p align="center">
  <b>Figura 3.</b>
 <a href="#">Bloco Multiplexador 14x7</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64069108-64dd8a80-cc19-11e9-9902-b3c2cfd4d3ea.png" width="800" heigth="400"> 
 </p>
 
#### 3.3 CONVERSOR BIN-BCD <br/> <br/>

O conversor binário para BCD permite a visualização dos valores em um display de 7 segmentos. A figura 4 apresenta um bloco bin-bcd para representação de valores de até 6 bits.

<p align="center">
  <b>Figura 4.</b>
 <a href="#">Bloco Conversor BIN-BCD</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64129762-857e1f80-cd94-11e9-9702-6036f6c2a0a5.png" width="300" heigth="300"> 
 </p>
### 4. DESCRIÇÃO EM LINGUAGEM DE HARDWARE <br/> <br/>

#### 4.1 VHD ENTIDADE DO MÓDULO <br/> <br/>

``` vhdl
entity modulo is
  
  port( B : in bit_vector(6 downto 0);
    
        VD, VU : out bit_vector(3 downto 0));
end;
```
#### 4.2 VHD ARQUITETURA DO MÓDULO <br/> <br/>

``` vhdl
architecture ckt1 of modulo is
  
component complemento2 is
  
  port( C : in bit_vector(6 downto 0);    
        R : out bit_vector(6 downto 0));
  end component;

component mux14x7 is
  
  port(SELI: in bit;
  AI, BI: in bit_vector(6 downto 0);     
  SI : out bit_vector(6 downto 0));
  
end component;

component bin_bcd is

port(SW : in  bit_vector(7 downto 0);
     HEX0, HEX1, HEX2 : out bit_vector(6 downto 0));
  
end component;

signal  AUX: bit_vector(6 downto 0);
signal AUX2: bit_vector(6 downto 0);
signal AUX3: bit_vector(13 downto 0);

 begin

    
C: complemento2 port map(
    
    C(6 downto 0) => B(6 downto 0),
    R(6 downto 0) => AUX(6 downto 0));
 
  
M: mux14x7 port map(

AI(6 downto 0) => B(6 downto 0),
BI(6 downto 0) => AUX(6 downto 0),
SELI => B(6),
SI(6 downto 0) => AUX2(6 downto 0));
  


BB: bin_bcd port map(
  
    SW(0) => AUX2(0),
    SW(1) => AUX2(1),
    SW(2) => AUX2(2),
    SW(3) => AUX2(3),
    SW(4) => AUX2(4),
    SW(5) => AUX2(5),
    SW(6) => AUX2(6),
    SW(7) => '0',
    
    HEX0(0) => AUX3(0),
    HEX0(1) => AUX3(1),
    HEX0(2) => AUX3(2),
    HEX0(3) => AUX3(3),
    HEX0(4) => AUX3(8),
    HEX0(5) => AUX3(9),
    HEX0(6) => AUX3(10),
    
    HEX1(0) => AUX3(4),
    HEX1(1) => AUX3(5),
    HEX1(2) => AUX3(6),
    HEX1(3) => AUX3(7),
    HEX1(4) => AUX3(11),
    HEX1(5) => AUX3(12),
    HEX1(6) => AUX3(13));
      
  VU <= AUX3(3 downto 0);
  VD <= AUX3(7 downto 4);
  
end ckt1;
```
### 5. CONCLUSÃO <br/> <br/>

<p align="center">
  <b>Figura 5.</b>
 <a href="#">Bloco da Solução</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64054461-7b261080-cb5d-11e9-8968-c3f7a9410550.png" width="400" heigth="200"> 
 </p>


<p align="center">
  <b>Figura 6.</b>
 <a href="#"> Resultado da simulação</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64129940-a3984f80-cd95-11e9-9238-22ca98857972.png" width="800" heigth="400"> 
 </p>
https://carlosrafaelgn.com.br/Aula/Binario.html
