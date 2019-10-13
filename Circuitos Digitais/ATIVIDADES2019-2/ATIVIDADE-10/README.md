# Atv_2715_010
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> 1 - Projete e implemente um circuito lógico, em VHDL, para implementar um registrador
de múltiplas funções. O registrador possuirá seis funções distintas (por ordem de prioridade:
manter, carregar, deslocar a direita, deslocar a esquerda, set síncrono, clear síncrono). Se
load=1, o registrador deverá fazer com que a saída S, após o pulso de clock, receba o valor da
entrada I. Se shr=1, o registrador deverá deslocar, após o pulso de clock, os bits da saída para
a direita com o bit de entrada dado por shr_in. Se shl=1, o registrador deverá deslocar, após o
pulso de clock, os bits da sa´ıda para a esquerda com o bit de entrada dado por shl in. Se set=1,
todos os bits da saída do registrador, após o pulso de clock, devem ir para 1. Por fim, se clr=1,
todos os bits da saída do registrador, após o pulso de clock, devem ir para 0.



<p  align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco Problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/66717974-ff9ebc80-edb4-11e9-9c60-4ef3054604b2.png" width="600" heigth="600"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Projetar um circuito que realize 6 (seis) funções em ordem de prioridade. 

### 3. DESENVOLVIMENTO <br/> <br/>




<p  align="center">
  <b>Figura 2.</b>
 <a href="#">Tabela 1. Codificação de entradas</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/66718807-860bcc00-edbe-11e9-9985-dd5e24bf1d1c.png" width="800" heigth="600"> 
 </p>


<p  align="center">
  <b>Figura 3.</b>
 <a href="#">Tabela 2. Relação das codificações</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/66718828-c0756900-edbe-11e9-94b6-1b6de5d1888f.png" width="800" heigth="600"> 
 </p>
 <br/> <br/>
 Equações resultantes do mapa K de cada saída:
 <br/> <br/>
 
 * **s0 =** shr + ld * set + shl' * set' * clr;
 * **s1 =** ld + shr' * shl' * set;
 * **s2 =** shl + shr + ld;
 
 
 <br/> <br/>
### 4. RESULTADOS <br/> <br/>

<p  align="center">
  <b>Figura 4.</b>
 <a href="#">Bloco Solução</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/66717938-8c954600-edb4-11e9-8c8b-94c3bfe68717.png" width="800" heigth="600"> 
 </p>
 
### 5. CONCLUSÃO <br/> <br/>
