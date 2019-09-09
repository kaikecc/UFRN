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

Desenvolver em VHD um circuito Y que receba um valor de 4 bits e repasse para outro circuito X via serial o valor de 4 bits.

### 3. DESCRIÇÃO EM LINGUAGEM DE HARDWARE <br/> <br/>



#### 3.1 REGISTRADORES <br/> <br/>

Um registrador de **N** bits de base 2 é um componente que armazena bits. O nome comum de armazenar os valores é **carregar**, mas também se utiliza as palavras escrever e armazenar. É possível fazer a leitura de um registrador atráves de suas saídas. Um circuito simples de registrador consiste em conjunto de flip-flops que são carregados a cada ciclo de relógio.

#### 3.1.1 REGISTRADOR DE CARGA PARALELA <br/> <br/>

A utilização de carga paralela permite com que uma informação seja carregada em paralela em um registrador e possibilita uma maior flexibilidade no controle do tipo, manter a informação, carregar e deslocar os bits nele armazenado.




#### 3.2 CIRCUITO Y <br/> <br/>

O circuito Y é responsável por receber um valor de 4 bits e para isso foi desenvolvido um componente de carga paralela que executará alguns funcionalidades de: **Manter**, **Carga Paralela**, **Deslocar a Direita** e **Zerar as saídas dos registradores**. O circuito também terá como entrada um valor K de 2 bits que executará a lógica do circuito carga paralela. <br/> <br/>

**Tabela 1** - Funcionalidades do circuito

K(0) | K(1) | Operação
--|---|---------------------
0 | 0 | Manter o valor atual
0 | 1 | Carga paralela
1 | 0 | Deslocar a direita
1 | 1 | Zerar o registrador

<br/> <br/>

* Entidade do circuito Y:

<br/> <br/>
``` vhdl
entity circuitoY is
  
port ( I: in bit_vector(3 downto 0);
      P: in bit_vector(1 downto 0);
      CLR2: in bit;
      clock1: in bit;
      S: out bit); 
  
end;
```
<br/> <br/>
 Arquitetura do circuito Y contará com dois componentes. O primeiro será um **reg4bit** (registrador de 4 bits) que terá o papel de armazenar os bits proviniente da chave **A** e o segundo **cp4bits** (carga paralela de 4 bits) que tornará as funções de manter, deslocar e carregar possível de ser executadas no circuito Y. 
A figura 2 mostra o bloco do circuito em bloco com a entrada **I** de 4 bits que recebe os valores da entrada **A** e a saída de **Q** de 4 bits terá seu bit menos significativo responsável pelo canal serial com o circuito X. A entrada **shr_in** fica configurada em 0, pois não receberá nenhum dado via serial e as entradas **s0** e **s1** são proviniente da entrada do circuito como **K**.
<br/> <br/>
<p align="center">
  <b>Figura 2.</b>
 <a href="#">Circuito Y</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64476399-83d1a480-d164-11e9-92fd-cd20033a2b51.png" width="300" heigth="300"> 
 </p>

<br/> <br/>
``` vhdl
architecture cktY of circuitoY is
  
component reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end component; 

component cp4bit is
  port (
    E0: in bit_vector(3 downto 0);
    E1: in bit_vector(3 downto 0);
    E2: in bit_vector(3 downto 0);
    E3: in bit_vector(3 downto 0);    
    SS: in bit_vector(1 downto 0); -- SELETOR 2 BITS
    
    V: out bit_vector(3 downto 0));
end component;

signal OUTI: bit_vector(3 downto 0);
signal Qo: bit_vector(3 downto 0);

begin
  
   REG: reg4bit port map(
     
   clock2 => clock1,
   ENT(3 downto 0) => OUTI(3 downto 0),
   RESET => CLR2, -- MODIFICANDO
   Qs(3 downto 0) => Qo(3 downto 0));

 CP0: cp4bit port map(
  
  E0(3 downto 0) => Qo(3 downto 0),
  E1(3 downto 0) => I(3 downto 0),
  E2(2 downto 0) => Qo(3 downto 1),
  E2(3) => '0', -- VER ISSO
  
  E3(0) => '0',
  E3(1) => '0',
  E3(2) => '0',
  E3(3) => '0', -- testando
  SS(1 downto 0) => P(1 downto 0),
  V(3 downto 0) => OUTI(3 downto 0));
 

S <= Qo(0);

end cktY;
```


#### 3.2 CIRCUITO X <br/> <br/>

* Entidade do circuito X:

``` vhdl
entity circuitoX is
  
port ( U: in bit;
      CLR1: in bit;
      clckk: in bit;
      
      L: out bit_vector(3 downto 0));
  
end;
```
A figura 3

<p align="center">
  <b>Figura 3.</b>
 <a href="#">Registrador 4 bits com carga paralela</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64476288-5afcdf80-d163-11e9-9a77-f6d8e0f5cdab.png" width="300" heigth="300"> 
 </p>
``` vhdl
architecture cktX of circuitoX is
  
component reg4bit is
  port( 
  clock2: in bit;
  RESET: in bit;
  ENT: in bit_vector(3 downto 0);
  Qs: out bit_vector(3 downto 0));
  
end component;

component cp2bit is
  port (EE: in bit_vector(3 downto 0);
        B : in bit_vector(3 downto 0);
        SLC: in bit;
        W : out bit_vector(3 downto 0));
   end component;

signal F: bit_vector(3 downto 0);
signal H: bit_vector(3 downto 0);


  begin
    
RR: reg4bit port map(
  
  clock2 => clckk,
  ENT(3 downto 0) => H(3 downto 0),
  RESET => CLR1, -- MODIFICANDO
  Qs(3 downto 0) => F(3 downto 0));
  
CP: cp2bit port map(
  
  EE(3 downto 0) => F(3 downto 0),
  B(2 downto 0) => F(3 downto 1),
  B(3) => U,
  SLC => '1', -- MUDAR ISSO LOGO
  W => H(3 downto 0));
  
  L <= F;
  
end cktX;
```

 
 #### 3.3 MAIN <br/> <br/>
``` vhdl 
entity com_serial is
  
  port(A : in bit_vector(3 downto 0);
       K : in bit_vector(1 downto 0);
       clockk : in bit;
       Z : out bit_vector(3 downto 0));
  
end;

```
 ``` vhdl 
 architecture ckt_serial of com_serial is
  
component circuitoX is
  
port ( U: in bit;
      CLR1: in bit;
      clckk: in bit;
      
      L: out bit_vector(3 downto 0));
  
end component;

component circuitoY is
  
port (I: in bit_vector(3 downto 0);
      P: in bit_vector(1 downto 0);
      CLR2: in bit;
      clock1: in bit;
      S: out bit); 
  
end component;

signal R: bit;
signal SERIAL: bit;
signal VALOR: bit_vector(3 downto 0);

begin

R <= not(K(0)) or not(K(1));

CY: circuitoY port map(
I(3 downto 0) => A(3 downto 0),
P(1 downto 0) => K(1 downto 0),
CLR2 => R,
clock1 =>  clockk,
S => SERIAL);

CX: circuitoX port map(
  U => SERIAL,
  CLR1 => R,
  clckk =>  clockk,
  L => VALOR);
  
  Z <= VALOR;
  
end ckt_serial;
```
### 4. CONCLUSÃO <br/> <br/>

<p align="center">
  <b>Figura 4.</b>
 <a href="#">Bloco solução</a> 
 <br><br>
<img src="https://user-images.githubusercontent.com/42541528/64451824-65639e80-d0bb-11e9-94f7-113ea5eb3b76.png" width="600" heigth="600"> 
 </p>
