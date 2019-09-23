# Atv_2715_008
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> - Implemente, em VHDL, um circuito contador que oscila sua contagem entre valores colocados
em suas entradas A (A3, A2, A1, A0) e B (B3, B2, B1, B0). E importante notar que o contador ´
sempre iniciará do valor menor e contará de forma crescente até a atingir o valor maior, neste
momento o contador passar´a a contar de forma decrescente até o valor menor. Assim, o contador
ficará sempre crescendo e decrescendo no intervalo dado pelos valores das entradas. Este circuito
deve repetir este procedimento sempre que a entrada EN estiver em níıvel alto. Por fim, sempre
que a entrada CLR estiver em n´ıvel alto, o contador dever´a ir imediatamente para 0 (estando
em zero, se este n˜ao faz parte do intervalo, o contador contar´a de forma crescente até atingir o
maior valor).


<p  align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65446743-627ee280-de0b-11e9-812f-8ae02559c97a.png" width="400" heigth="400"> 
 </p>
 
 ### 2. OBJETIVO <br/> <br/>
 
 Desenvolver um circuito em vhd que identifica de dois números o menor e inicia a contagem até o maior valor e depois retorna para o menor.
 
  ### 3. LINGUAGEM DE DESCRIÇÃO DE HARDWARE <br/> <br/>
 
 O programa principal é onde todos os blocos se unem para gerar o circuito do problema. A entidade abaixa mostra as entradas e saídas do circuito.
 
 ``` vhdl
 entity main is
  
  port(A,B: in bit_vector(3 downto 0);
    EN, CLR, clock: in bit;
    C: out bit_vector(3 downto 0));
end;
  ```
 
 
 ### 4. RESULTADOS <br/> <br/>
 
O multiplexador 8x4 recebe as entradas **A** e **B** que através de um compaador de A menor B determina o menor valor que será carregado no registrador de 4 bit. O menor valor entre A e B entra no bit menos signitificativo da carga paralela de 4 bits 4x1 e a segunda entrada recebe saída do registrado somado mais 1 e a terceira entrada recebe a saída do multiplexador menos 1 e por fim a saída mais signficativa do multiplexado recebe a saída atual do mux.

A seleção para entrada para o registrador de 4 bits vem de dois flip-flops tipo D que são ativadas de acordo com a comparação entre o maior e menor valor com a saída do registrador.

 
<p align="center">
  <b>Figura 2.</b>
 <a href="#">Bloco solução</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/65467567-244be800-de38-11e9-95b8-12d11d2f3408.png" width="600" heigth="600"> 
 </p>
 
 
 ### 5. CONCLUSÃO <br/> <br/>
