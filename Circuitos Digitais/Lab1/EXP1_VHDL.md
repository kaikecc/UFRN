# Implemetando no MODELSIM circuitos lógicos





>   O Modelsim é um simulador de HDL (Hardware Description Language) desenvolvido pela Mentor Graphics. Ele suporta a simulação das linguagens VHDL e Verilog e pode simular o código a nível de RTL (Register Transfer Level) e Gate Level. Em nível de RTL é analisado o circuito a nível de comportamento dos registradores e em Gate Level é analisado a nível de netlist com inclusão de atrasos das portas lógicas e etc. 

**Segue o tutorial para o modelsim:** https://www.embarcados.com.br/tutorial-de-modelsim-vhdl-fpga/

### Circuito 1:

![C1](https://user-images.githubusercontent.com/42541528/60891309-7024c300-a233-11e9-9b37-cd4339a59fe8.png)

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
