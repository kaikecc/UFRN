# Atv_2715_001
#### ESTUDANTE: KAIKE CASTRO CARVALHO



### 1. INTRODUÇÃO

>   O Modelsim é um simulador de HDL (Hardware Description Language) desenvolvido pela Mentor Graphics. Ele suporta a simulação das linguagens VHDL e Verilog e pode simular o código a nível de RTL (Register Transfer Level) e Gate Level. Em nível de RTL é analisado o circuito a nível de comportamento dos registradores e em Gate Level é analisado a nível de netlist com inclusão de atrasos das portas lógicas e etc. 


### 2. IMPLEMETAÇÃO EM VHD DOS CIRCUTOS

#### 2.1 CIRCUITO 1

O circuito CKT1 apresenta quatro variáveis de entrada **A** ,**B** ,**C**  e  **D**. As duas variáveis de saídas do circutos são **S1** e **S2**. A cada saída de uma porta lógica foi atribuida uma variável auxiliar (**m**, **n**, **o**, **p**) para implementar o vhd.
           
 ![C1](https://user-images.githubusercontent.com/42541528/61714934-5bb3f080-ad32-11e9-82af-9896e262179b.png )
 

* Definindo as entradas e saídas do circuito na descrição:

``` vhdl
entity ckt1 is -- ckt1 é o nome da entidade 

port(A,B,C,D: in bit; -- define as entradas do projeto
           S1,S2: OUT bit);  -- define as saídas do projeto             
        end ckt1;
```

* Implementação do projeto fazendo as ligaçoes entre os componentes:

``` vhdl
architecture CKT of ckt1 is -- CKT é o nome do projeto 

signal m,o,n,p : bit;-- declaração das variáveis auxiliares
 begin

    m <= A or B;
    o <= B xnor C;
    n <= A or o;
    p <= o or D;
    S1 <= m xor n;
    S2 <= n or p;

end CKT;
```
* O arquivo .do em que as entradas são forçada para gerar os resultados do circuito:

``` vhdl
vsim ckt1

add wave *

force A 0 0ns, 1 60ns -- force ENTRADA NIVEL LOGICO TEMPO, NIVEL LOGICO TEMPO
force B 0 0ns, 1 40ns -repeat 60ns
force C 0 0ns, 1 20ns -repeat 40ns
force D 0 0ns, 1 10ns -repeat 20ns
run 100ns
```

#### Tabela Verdade 1

A | B | C | D | S1 | S2
--|---|---|---|----|---
0 | 0 | 0 | 0 | 0  | 1
0 | 0 | 0 | 1 | 0  | 1
0 | 0 | 1 | 0 | 0  | 0
0 | 0 | 1 | 1 | 0  | 1
0 | 1 | 0 | 0 | 1  | 0
0 | 1 | 0 | 1 | 1  | 1
0 | 1 | 1 | 0 | 1  | 1
0 | 1 | 1 | 1 | 1  | 1
1 | 0 | 0 | 0 | 0  | 1
1 | 0 | 0 | 1 | 0  | 1
1 | 0 | 1 | 0 | 1  | 0
1 | 0 | 1 | 1 | 1  | 1
1 | 1 | 0 | 0 | 1  | 0
1 | 1 | 0 | 1 | 1  | 1
1 | 1 | 1 | 0 | 0  | 1
1 | 1 | 1 | 1 | 0  | 1


#### 2.2 CIRCUITO 2

O circuito CKT2 apresenta quatro variáveis de entrada **A** ,**B** ,**C**  e  **D**. As duas variáveis de saídas do circutos são **S1** e **S2**. A cada saída de uma porta lógica foi atribuida uma variável auxiliar (**m**, **n**, **o**, **p**) para implementar o vhd.
    
![C2](https://user-images.githubusercontent.com/42541528/61715345-5014f980-ad33-11e9-8ae5-62ff6dec453f.png)

* Definindo as entradas e saídas do circuito na descrição:

``` vhdl
entity ckt2 is
port(A,B,C,D: in bit;
           S1,S2: OUT bit);               
        end ckt2;
```
* Implementação do projeto fazendo as ligaçoes entre os componentes:

``` vhdl
architecture CKT of ckt2 is

signal m,o,n,p : bit;-- declara as variables
 begin

    m <= A xor B;
    o <= B xnor C;
    n <= A and o;
    p <= o xor D;
    S1 <= m and n;
    S2 <= n or p;

end CKT;
```
* O arquivo .do em que as entradas são forçada para gerar os resultados do circuito:

``` vhdl
vsim ckt2

add wave *

force A 0 0ns, 1 60ns -- force ENTRADA NIVEL LOGICO TEMPO, NIVEL LOGICO TEMPO
force B 0 0ns, 1 40ns -repeat 60ns
force C 0 0ns, 1 20ns -repeat 40ns
force D 0 0ns, 1 10ns -repeat 20ns
run 100ns
```
#### Tabela Verdade 2

A | B | C | D | S1 | S2
--|---|---|---|----|---
0 | 0 | 0 | 0 | 0  | 1
0 | 0 | 0 | 1 | 0  | 0
0 | 0 | 1 | 0 | 0  | 0
0 | 0 | 1 | 1 | 0  | 1
0 | 1 | 0 | 0 | 0  | 0
0 | 1 | 0 | 1 | 0  | 1
0 | 1 | 1 | 0 | 0  | 1
0 | 1 | 1 | 1 | 0  | 0
1 | 0 | 0 | 0 | 1  | 1
1 | 0 | 0 | 1 | 1  | 1
1 | 0 | 1 | 0 | 0  | 0
1 | 0 | 1 | 1 | 0  | 1
1 | 1 | 0 | 0 | 0  | 0
1 | 1 | 0 | 1 | 0  | 1
1 | 1 | 1 | 0 | 0  | 1
1 | 1 | 1 | 1 | 0  | 1

#### 2.3 CIRCUITO 3

O circuito CKT3 apresenta quatro variáveis de entrada **A** ,**B** ,**C**  e  **D**. As duas variáveis de saídas do circutos são **S1** e **S2**. A cada saída de uma porta lógica foi atribuida uma variável auxiliar (**m**, **n**, **o**, **p**) para implementar o vhd.
    
![C3](https://user-images.githubusercontent.com/42541528/61715868-61123a80-ad34-11e9-8911-75c6af663117.png)

* Definindo as entradas e saídas do circuito na descrição:

``` vhdl
entity ckt3 is

port(A,B,C,D: in bit;
           S1,S2: OUT bit);               
        end ckt3;
```
* Implementação do projeto fazendo as ligaçoes entre os componentes:

``` vhdl
architecture CKT of ckt3 is

signal m,o,n,p : bit;-- declara as variables
 begin

    m <= D or C;
    n <= B and C;
    o <= D and n;
    p <= A or n;
    S1 <= m xnor o;
    S2 <= p or o;

end CKT;
```
* O arquivo .do em que as entradas são forçada para gerar os resultados do circuito:

``` vhdl
vsim ckt3

add wave *

force A 0 0ns, 1 60ns -- force ENTRADA NIVEL LOGICO TEMPO, NIVEL LOGICO TEMPO
force B 0 0ns, 1 40ns -repeat 60ns
force C 0 0ns, 1 20ns -repeat 40ns
force D 0 0ns, 1 10ns -repeat 20ns
run 100ns
```
#### Tabela Verdade 3

D | C | B | A | S1 | S2
--|---|---|---|----|---
0 | 0 | 0 | 0 | 1  | 0
0 | 0 | 0 | 1 | 1  | 1
0 | 0 | 1 | 0 | 1  | 0
0 | 0 | 1 | 1 | 1  | 1
0 | 1 | 0 | 0 | 0  | 0
0 | 1 | 0 | 1 | 0  | 1
0 | 1 | 1 | 0 | 0  | 1
0 | 1 | 1 | 1 | 0  | 1
1 | 0 | 0 | 0 | 0  | 0
1 | 0 | 0 | 1 | 0  | 1
1 | 0 | 1 | 0 | 0  | 0
1 | 0 | 1 | 1 | 0  | 1
1 | 1 | 0 | 0 | 1  | 0
1 | 1 | 0 | 1 | 1  | 1
1 | 1 | 1 | 0 | 0  | 1
1 | 1 | 1 | 1 | 0  | 1

#### 2.4 CIRCUITO 4

O circuito CKT4 apresenta quatro variáveis de entrada **A** ,**B** ,**C**  e  **D**. As duas variáveis de saídas do circutos são **S1** e **S2**. A cada saída de uma porta lógica foi atribuida uma variável auxiliar (**m**, **n**, **o**, **p**) para implementar o vhd.

![C4](https://user-images.githubusercontent.com/42541528/61716114-d1b95700-ad34-11e9-9a03-c0713584b502.png)

* Definindo as entradas e saídas do circuito na descrição:

``` vhdl
entity ckt4 is

port(A,B,C,D: in bit;
           S1,S2: OUT bit);
               
        end ckt4;
```
* Implementação do projeto fazendo as ligaçoes entre os componentes:

``` vhdl
architecture CKT of ckt4 is

signal m,o,n,p : bit;-- declara as variables
 begin

    m <= D xor C;
    n <= B or C;
    o <= D or n;
    p <= A xor n;
    S1 <= m xnor o;
    S2 <= p or o;

end CKT;
```
*  O arquivo .do em que as entradas são forçada para gerar os resultados do circuito:

``` vhdl
vsim ckt4

add wave *

force A 0 0ns, 1 60ns -- force ENTRADA NIVEL LOGICO TEMPO, NIVEL LOGICO TEMPO
force B 0 0ns, 1 40ns -repeat 60ns
force C 0 0ns, 1 20ns -repeat 40ns
force D 0 0ns, 1 10ns -repeat 20ns
run 100ns
```
#### Tabela Verdade

D | C | B | A | S1 | S2
--|---|---|---|----|---
0 | 0 | 0 | 0 | 1  | 0
0 | 0 | 0 | 1 | 1  | 1
0 | 0 | 1 | 0 | 0  | 1
0 | 0 | 1 | 1 | 0  | 1
0 | 1 | 0 | 0 | 1  | 1
0 | 1 | 0 | 1 | 1  | 1
0 | 1 | 1 | 0 | 1  | 1
0 | 1 | 1 | 1 | 1  | 1
1 | 0 | 0 | 0 | 1  | 1
1 | 0 | 0 | 1 | 1  | 1
1 | 0 | 1 | 0 | 1  | 1
1 | 0 | 1 | 1 | 1  | 1
1 | 1 | 0 | 0 | 0  | 1
1 | 1 | 0 | 1 | 0  | 1
1 | 1 | 1 | 0 | 0  | 1
1 | 1 | 1 | 1 | 0  | 1
