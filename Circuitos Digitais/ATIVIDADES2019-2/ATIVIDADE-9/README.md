# Atv_2715_009
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> Projete e implemente um circuito lógico para um pequeno sinalizador luminoso. O circuito
deve apresentar 5 leds de saída os quais são acionados conforme a figura abaixo. Após o instante
10, o ciclo recomeça pelo instante 1 novamente.



<p  align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65844797-f79f4100-e30d-11e9-97e6-3db345d383f1.png" width="400" heigth="400"> 
 </p>
 
## 2. OBJETIVO <br/> <br/>

Construir um circuito que obedeça uma sequência lógica de acendimento de cinco leds.

## 3. DESENVOLVIMENTO  <br/> <br/>

A partir da Figura 1 foi construindo uma tabela verdade que relaciona o estado presente com o futuro e os estados não utilizado foram colocados em dont'care para simplificação do circuito.
<br/> <br/>
<p  align="center">
  <b>Figura 2.</b>
 <a href="#">Diagrama de estados</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65844752-ce7eb080-e30d-11e9-9bf8-940510a09d41.png" width="400" heigth="400"> 
 </p>

O circuito lógico foi construído a partir da tabela da figura 3 e 4.

<br/> <br/>
<p  align="center">  
  <b>Figura 3.</b>
 <a href="#">Tabela verdade</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65918952-61bcf200-e3b1-11e9-9968-e4f60b29d71b.JPG" width="800" heigth="600"> 
 </p>

<p  align="center">  
  <b>Figura 4.</b>
 <a href="#">Tabela verdade</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65918951-61245b80-e3b1-11e9-8f5b-c682aaf9a488.JPG" width="800" heigth="600"> 
 </p>
 
 A partir das figuras 3 e 4 foi extraído as equações que fazerá parte da entrada do registrador de 5 bits.
 
 <br/> <br/>
 * **DA** = D'E + A'BC + ABC'
 * **DB** = D'E + AB' + A'CD + ABC
 * **DC** = A'E + A'CD + A'BC'
 * **DD** = E + A'B'D'
 * **DE** = AE + D'E + A'B'C'E'
 <br/> <br/>
 As figuras 5 e 6 são os circuitos lógicos a partir das equações.
 <br/> <br/>
<p  align="center">  
  <b>Figura 5.</b>
 <a href="#">Circuito lógico</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65845134-54e7c200-e30f-11e9-903e-dfaf3a42ccf4.png" width="600" heigth="400"> 
 </p>
 <br/> <br/>
 <p  align="center">
  <b>Figura 6.</b>
 <a href="#">Diagrama de estados</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65845135-54e7c200-e30f-11e9-9ae5-60e70e766662.png" width="400" heigth="400"> 
 </p>
 <br/> <br/>
<p  align="center">
  <br/> <br/>
 <b>Figura 7.</b>
 <a href="#">Diagrama de estados</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65845136-54e7c200-e30f-11e9-8c9f-d5b9734b2178.png" width="400" heigth="400"> 
 </p>
 <br/> <br/>
 <p  align="center">  
 <b>Figura 8.</b>
 <a href="#">Diagrama de estados</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65845137-54e7c200-e30f-11e9-8d1d-594c57d433c2.png" width="800" heigth="600"> 
 </p>
