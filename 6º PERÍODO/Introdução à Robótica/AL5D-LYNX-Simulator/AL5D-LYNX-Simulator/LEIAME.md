# AL5D-LYNX-Simulator v1.0 BETA
Simulador AL5D LYNX no V-REP usando linguagem C versão 1.0 BETA

## Guia do Usuário

1. Baixe o V-REP PLAYER [nessa página](http://www.coppeliarobotics.com/downloads.html) 
2. Acesse a pasta do V-REP PLAYER. No terminal, execute o V-REP:
```
user@host:~/V-REP_PLAYER$ ./vrep.sh
```
3. Na tela do V-REP PLAYER, clique **File ---> Open scene**. Navegue até a pasta do repositório **AL5D-LYNX-Simulator ---> scene**, e escolha o arquivo *al5d_lynx.ttt*.
4. No topo da tela, aperte o botão **Start/resume simulation** para rodar a simulação.
5. Navegue até a pasta do repositório **AL5D-LYNX-Simulator ---> build**. No terminal, execute os comandos *cmake* and *make* como exposto abaixo:
```
user@host:~/AL5D-LYNX-Simulator/build$ cmake ../

user@host:~/AL5D-LYNX-Simulator/build$ make

```
6. Agora, execute a aplicação *demo*:

```
user@host:~/AL5D-LYNX-Simulator/build$ ./demo

```
7. Se você fizer qualquer alteração no arquivo *demo.c*, é preciso **repetir o passo 5**.

8. Como é uma versão *BETA*, pode apresentar erros/bugs durante a operação. Caso identifique algum, por favor, reportar via email para: **jean@dca.ufrn.br**. Sua contribuição é **muito** importante para o desenvolvimento e melhoria desse programa!

9. Mais informações sobre o braço robótimo AL5D-LYNX [nesse material](https://www.dca.ufrn.br/~jean/apostila_al5dv2.pdf).


