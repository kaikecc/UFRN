# Atv_2715_015
#### PROFESSOR Dr.: SAMAHERNI MORAIS DIAS 
#### ESTUDANTE    : KAIKE CASTRO CARVALHO


### 1. INTRODUÇÃO <br/> <br/>

> Projete um circuito digital para um marcapasso (ver Figura 1). O marcapasso é um dispositivo de aplicação médica que tem o objetivo de regular os batimentos cardíacos. Isto é
conseguido através de um estímulo elétrico emitido pelo dispositivo quando o número de batimentos, em um certo intervalo de tempo, está abaixo do normal por algum problema na
condução do estímulo natural. O clock do circuito será fornecido por uma entrada chamada clk e o circuito deverá apresentar comportamento semelhante ao especificado pela Figura 2, ou seja,
sempre que o circuito perceber a ausˆencia do batimento do átrio (Sa) ou ventrículo (Sv) deverá produzir um sinal paou pv, respectivamente, para estimular o músculo cardíaco. O marcapasso
deverá garantir o estímulo de acordo com os tempos pré-determinados (ver Figura 2), assim,mesmo que não ocorra nenhum batimento pelo átrio ou ventrículo, os estímulos deverão ser aplicados respeitando estes tempos.



<p  align="center">
  <b>Figura 1.</b>
 <a href="#">Bloco Problema</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69567751-dfa80e80-0f98-11ea-8acc-3be93077c3bf.png" width="800" heigth="600"> 
 </p>



<p  align="center">
  <b>Figura 2.</b>
 <a href="#">Comportamento esperado</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69567884-331a5c80-0f99-11ea-9fd1-af5c55a15f1f.png" width="800" heigth="600"> 
 </p>

### 2. OBJETIVO <br/> <br/>

Construir um circuito que funcione como marcapasso respeitando a operação descrito na Figura 2.

### 3. LINGUAGEM DE DESCRIÇÃO DE HARDWARE <br/> <br/>



<p  align="center">
  <b>Figura 3.</b>
 <a href="#">Diagrama de bloco do ciclo de pulso ÁTRIO e VENTRÍCULO</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69585403-63c0bd00-0fbe-11ea-84a0-257ef81c4ceb.png" width="600" heigth="600"> 
 </p>
 
* Datapath:  <br/> <br/>

 ``` vhdl
entity datapath is
  
port(cclk, t_a, t_v, SSA, SSV : in bit;
   z_a, z_v: out bit);
end;

architecture ckt of datapath is
  
component contador5bits is
  
port(R, cloock: in bit;
    C : out bit_vector(4 downto 0));
end component; 

component comparador5bit is
  
  port(X, Y : in bit_vector(4 downto 0);
      AeqB, A_maior_B, A_menor_B: out bit);
end component;


signal S_counter_Sa, S_counter_Sv : bit_vector(4 downto 0);

signal AUX1, AUX2: bit;
signal cinco, vinte : bit_vector(4 downto 0);
signal clrA, clrV : bit;
begin
  
  
cinco(0) <= '1';
cinco(1) <= '0';
cinco(2) <= '1';
cinco(3) <= '0';
cinco(4) <= '0';

vinte(0) <= '0';
vinte(1) <= '0';
vinte(2) <= '1';
vinte(3) <= '0';
vinte(4) <= '1';

clrA <= not ((AUX2 and not(SSA)) or t_a);
clrV <= not ((AUX1 and not(SSV)) or t_v);

contador_Sa: contador5bits port map( -- contador para Sa
  
  R => clrA, -- se t_a = 1 : nao reset, se t_a = 0 : reset
  cloock => cclk,
  C => S_counter_Sa);
  
contador_Sv: contador5bits port map( -- contador para Sv
  
  R => clrV,
  cloock => cclk,
  C => S_counter_Sv);
    
comparador_Sa: comparador5bit port map(
  
  X => S_counter_Sa,
  Y => cinco, -- 5
  AeqB => AUX1);
  
comparador_Sv: comparador5bit port map(
  
  X => S_counter_Sv,
  Y => vinte, -- 20
  AeqB => AUX2);
 
z_v <= AUX1 and not(SSV);
z_a <= AUX2 and not(SSA);

end ckt;
 ```
  <br/> <br/>
 * Controlador: 
  <br/> <br/>
 ``` vhdl 
 library ieee;
use ieee.std_logic_1164.all;

entity mde_controller is
port (clk , r, sa, za, sv, zv: in bit ;
               pa, ta, pv, tv: out bit);
end mde_controller;

architecture ckt of mde_controller is
  
type state_type is (ResetTimerA , WaitA, PaceA, ResetTimerV, WaitV, PaceV);
  
signal y_present, y_next: state_type ;

begin
  process (sv, sa, za, zv, y_present)
  
  begin
  
case y_present is
  
when ResetTimerA =>
y_next <= WaitA;
  
when WaitA =>
if (not(sa) and not(za)) = '1' then y_next <= WaitA;
elsif(not(sa) and za) = '1' then y_next <= PaceA;
elsif sa = '1' then y_next <= ResetTimerV; end if ;
  
when PaceA =>
y_next <= ResetTimerV;

when ResetTimerV =>
 y_next <= WaitV;

when WaitV =>
if (not(sv) and not(zv)) = '1' then y_next <= WaitV;
elsif(not(sv) and zv) = '1' then y_next <= PaceV;
elsif sv = '1' then y_next <= ResetTimerA; end if ;

when PaceV =>
y_next <= ResetTimerA;
  
end case;

end process ;
process ( clk , r)
begin
  
if r = '0' then
y_present <= ResetTimerA;

elsif ( clk ' event and clk = '1') then
y_present <= y_next ;

end if ;
 ```
 


<p  align="center">
  <b>Figura 4.</b>
 <a href="#">Diagrama de blocos</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/69586107-4ab90b80-0fc0-11ea-8527-cbc50c963403.JPG" width="800" heigth="600"> 
 </p>
 <br/> <br/>
### 4. CONCLUSÃO <br/> <br/>
