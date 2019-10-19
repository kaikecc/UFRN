# Atv_2715_004
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> Implemente um circuito para somar dois valores de 2 bit (A,B) e apresentar o resultado em
um display de 7 segmentos (O circuito deverá utilizar apenas um tipo de CI. Ex se o aluno
escolher o 7408, ele poderá utilizar quantas unidades forem necessárias, por´em apenas deste
CI).

Um somador de **N** bits é um componente de bloco operacional que adiciona dois números **A** e **B** gerando uma  **S** de **N** bits e um transporte carry out de 1 bit. A figura 1 apresenta o bloco de um somador de 1 bit.



<p align="center">
 <b>Figura 1.</b>
 <a href="#">Bloco entrada-saída</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/63171694-81bb7080-c012-11e9-855f-4c7f71ca1049.png" width="300" heigth="100"> 
</p>


### 2. OBJETIVO <br/> <br/>

Construir um somador de 2 bits utilizando um tipo de porta lógica.


### 3. SOMADOR COMPLETO DE 2 BITs <br/> <br/>

A partir de um somador completo de 1 bit é possível concatenar a saída carry out na entrada carry in e assim formando um somador de 2 bits. A figura 2 mostra-se o diagrama em que se deve desenvolver o projeto, no retângulo pontilhado está o somador que tem como entradas **A0**, **A1**, **B0** e **B1** com saída direto em decodificador BCD 7448 que representará o resultado da soma no display de 7 segmentos.

<p align="center">
 <b>Figura 2.</b>
 <a href="#">Diagrama dos blocos</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/63171864-d65eeb80-c012-11e9-8ea9-bc616d6fd01e.png" width="400" heigth="200"> 
</p>

Uma porta **XOR** pode ser representada a partir de um reanjo de portas **NANDs** e na figura 3 exemplifica as ligações.

<p alexign="center">
 <b>Figura 3.</b>
 <a href="#">Porta XOR formado a partir de Nands</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/63178971-7885d000-c021-11e9-812d-07ca802cc3b9.png" width="600" heigth="400"> 
</p>

 
 A figura 4 abaixo representa o bloco de somador de 1 bit completo com portas NANDs que é base para a construção do trabalho em questão.

<p align="center">
 <b>Figura 4.</b>
 <a href="#">Somador de 1 bit com portas NANDs</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/63179037-a834d800-c021-11e9-98a9-6f8d2a9ad40c.png" width="600" heigth="400"> 
</p>

#### 3.1 Capturar a função <br/> <br/>

A função para o desevolvimento do projeto baseou-se na construção da tabela-verdade 1. As entradas da tabela são **Cin**, **A1**, **A0**, **B1** e **B0**. As saídas da tabela são **Co**, **S1** e **S0**.



**1. Tabela-verdade** - Somador de 2 bits

Cin | A1 | A0 | B1 | B0  | Co | S1 | S0
----|----|----|----|-----|----|----|---
0   | 0  | 0  | 0  |  0  | 0  | 0  | 0
0   | 0  | 0  | 0  |  1  | 0  | 0  | 1
0   | 0  | 0  | 1  |  0  | 0  | 1  | 0
0   | 0  | 0  | 1  |  1  | 0  | 1  | 1
0   | 0  | 1  | 0  |  0  | 0  | 0  | 1
0   | 0  | 1  | 0  |  1  | 0  | 1  | 0
0   | 0  | 1  | 1  |  0  | 0  | 1  | 1
0   | 0  | 1  | 1  |  1  | 1  | 0  | 0 
0   | 1  | 0  | 0  |  0  | 0  | 1  | 0
0   | 1  | 0  | 0  |  1  | 0  | 1  | 1
0   | 1  | 0  | 1  |  0  | 1  | 0  | 0
0   | 1  | 0  | 1  |  1  | 1  | 0  | 1
0   | 1  | 1  | 0  |  0  | 0  | 1  | 1
0   | 1  | 1  | 0  |  1  | 1  | 0  | 0
0   | 1  | 1  | 1  |  0  | 1  | 0  | 1
0   | 1  | 1  | 1  |  1  | 0  | 0  | 0
1   | 0  | 0  | 0  |  0  | 0  | 0  | 0
1   | 0  | 0  | 0  |  1  | 0  | 0  | 0
1   | 0  | 0  | 1  |  0  | 0  | 0  | 0
1   | 0  | 0  | 1  |  1  | 0  | 0  | 0
1   | 0  | 1  | 0  |  0  | 0  | 0  | 0
1   | 0  | 1  | 0  |  1  | 0  | 0  | 0
1   | 0  | 1  | 1  |  0  | 0  | 0  | 0
1   | 0  | 1  | 1  |  1  | 0  | 0  | 0
1   | 1  | 0  | 0  |  0  | 0  | 0  | 0
1   | 1  | 0  | 0  |  1  | 0  | 0  | 0
1   | 1  | 0  | 1  |  0  | 0  | 0  | 0
1   | 1  | 0  | 1  |  1  | 0  | 0  | 0
1   | 1  | 1  | 0  |  0  | 0  | 0  | 0
1   | 1  | 1  | 0  |  1  | 0  | 0  | 0
1   | 1  | 1  | 1  |  0  | 0  | 0  | 0
1   | 1  | 1  | 1  |  1  | 0  | 0  | 0

#### 3.2 Converta para equações <br/> <br/>

A partir do mapa K das saídas da tabela-verdade 1 foi construído as equações das saídas em função das entradas.

* **S0** = A0 xor B0 xor Cin;
* **Co1** = A0*B0 + Cin * (A0 xor B0);

* **S1** = A1 xor B1 xor (A0*B0 + Cin*(A0 xor B0));
* **Co2** = A1*B1 + A0*B0 + Cin * (A0 xor B0)*(A0 xor B0);

#### 3.3 Criar o circuito <br/> <br/>

O circuito da figura 5 foi construído no programa Proteus na versao 8.0 e nele foi possível fazer a simulação e a posteriori a montagem em protoboard. As portas lógicas utilizadas foram da série 4000, portanto todos os componentes são do tipo CMOs. O desenvolvimento do circuito foi a partir das equações proviniente do mapa K das saídas.


<p align="center">
 <b>Figura 5.</b>
 <a href="#">Somador completo de 2 bit com portas NANDs</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/63179842-6311a580-c023-11e9-9061-839d999dc72a.png" width="1000" heigth="800"> 
</p>



### 4. CONCLUSÃO <br/> <br/>

A montagem do circuito foi devidamente feita e testada e assim atendendo o objetivo da questão que é a soma de 2 bits.

