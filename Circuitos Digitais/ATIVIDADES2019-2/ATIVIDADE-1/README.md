# Atv_2715_001
#### ESTUDANTE: KAIKE CASTRO CARVALHO




### 1. INTRODUÇÃO

>   O Modelsim é um simulador de HDL (Hardware Description Language) desenvolvido pela Mentor Graphics. Ele suporta a simulação das linguagens VHDL e Verilog e pode simular o código a nível de RTL (Register Transfer Level) e Gate Level. Em nível de RTL é analisado o circuito a nível de comportamento dos registradores e em Gate Level é analisado a nível de netlist com inclusão de atrasos das portas lógicas e etc. 


### 2. IMPLEMETAÇÃO DOS CIRCUTIOS

#### 2.1 CIRCUITO 1

![C1](https://user-images.githubusercontent.com/42541528/61714934-5bb3f080-ad32-11e9-82af-9896e262179b.png)

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

Signal m,o,n,p : bit;-- declaração das variáveis auxiliares
 begin

    m <= A or B;
    o <= B xnor C;
    n <= A or o;
    p <= o or D;
    S1 <= m xor n;
    S2 <= n or p;

end CKT;
```
* O arquivo .do:

``` vhdl
vsim ckt1

add wave *

force A 0 0ns, 1 60ns -- force ENTRADA NIVEL LOGICO TEMPO, NIVEL LOGICO TEMPO
force B 0 0ns, 1 40ns -repeat 60ns
force C 0 0ns, 1 20ns -repeat 40ns
force D 0 0ns, 1 10ns -repeat 20ns
run 100ns
```
#### 2.2 CIRCUITO 2
![C2](https://user-images.githubusercontent.com/42541528/61715345-5014f980-ad33-11e9-8ae5-62ff6dec453f.png)
