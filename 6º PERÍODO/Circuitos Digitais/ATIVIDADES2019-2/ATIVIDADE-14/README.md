# Atv_2715_014
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> Projete um circuito digital (Ver Figura 1) que ao receber um pulso de início (C=1) calcule
o somatório (Sad) do valor absoluto da diferença entre 8 valores de A e B, ou seja, O circuito
deve, após realizar o cálculo, atualizar o valor do Sad e fazer o bit de saída D=1. É importante
notar que durante a realização do calculo D deve ser 0.


<p  align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco Problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69076447-4023d280-0a12-11ea-9ec6-623556b1ceb4.png" width="600" heigth="400"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Construir um circuito que realize somatório do valor absoluto entre dois valores.

### 3. DESENVOLVIMENTO <br/> <br/>

A computação da soma das diferenças absolutas (SAD) é algo que requer um certo esforço computacional. Desse modo, é necessário um ciruito otimizado para que em nível de software possa haver mais simplificações de operações de diferenças. 


A Figura 2 mostra a máquina de estados de alto nível em pode-se entender o funcionamento do comportamento da SAD. Na parte superior, estão declaradas as entradas, as saídas e os registradores locias soma, i e sad_reg que serão usados.
 O estado S0 é o de espera e fica aguardando go (comece) ser verdadeiro para prosseguir. Em S1, inicializa soma e o index, no estado S3 checa se i é maior ou igual a 256 e em seguida em S3 realiza a soma da diferença e incrementa em index.
 Por fim, em S4 escreve na saída o resultados (sad_reg) e retorna para S0.
 
<p  align="center">
  <b>Figura 2.</b>
 <a href="#">Bloco controle</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69077845-53846d00-0a15-11ea-8788-ce53119c61b1.JPG" width="600" heigth="400"> 
 </p>
 
 No projeto RTL tem o bloco operacional em que apartir do bloco de controle as operações básicas como subtrair, somador e o cálculo do modulo absoluto são realizados nesse bloco. 
 
<p  align="center">
  <b>Figura 3.</b>
 <a href="#">Bloco datapath</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69077134-b4ab4100-0a13-11ea-9248-7ee5c509e3e2.JPG" width="600" heigth="400"> 
 </p>
 
 ### 4. RESULTADOS <br/> <br/>
 

 O controlador não foi possível de desenvolver por dificuldades na parte de sinal de referência, porém na Figura 4 mostra o esquemático do fluxo do projeto em que o bloco datapath está constrúido.
 <br/> <br/>
 <p  align="center">
  <b>Figura 4.</b>
 <a href="#">Visão geral da solução</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69079195-4026d100-0a18-11ea-8d4c-479e22bbca6f.JPG" width="600" heigth="400"> 
 </p>
 <br/> <br/>
  A solução para o datapath baseou-se no CI 74181 que opera uma unidade lógica aritmética de 4 bitso o qual pode operar 16 operações. A Figura 5 mostra os componentes utilizados em que 7485 é um comparador que as suas saídas atuam na seletor e o strobe do 74157 que é um mux 8x4 e dessa forma o somatório é realizado.
<br/> <br/>

  <p  align="center">
  <b>Figura 5.</b>
 <a href="#">Visão do datapath</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69079692-52edd580-0a19-11ea-9345-268d7eb1d2c9.JPG" width="600" heigth="400"> 
 </p>
  <br/> <br/>
  
  ### 5. CONCLUSÃO <br/> <br/>
  
  Esse trabalhou mostrou-se bastante trabalhoso, porém rico em informações de como um computador processa imagens e videos e como a compactação é feita para otimizar memória. Infelizmente não foi possível construir uma solução completa para o projeto, mas deixa o aprendizado do funcionamento de uma SAD.
