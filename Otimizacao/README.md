# Método Simplex


### 1. INTRODUÇÃO

O método simplex é uma ferramenta computacional para resolver problemas de programação linear. 


O código abaixo é a parte inicial do programa que limpa o console e todas as variáveis. A função uiget é responsável por capturar o arquivo txt do computador e armazenar o conteúdo na variável arq. A variável matriz aumentada recebe a função fscanfMat que converte o conteúdo de arq em uma matriz.


``` scilab

clc //limpra a tela
clear all //limpa todas as variaveis

arq = uigetfile(); // Funcao para pegar um arquivo
matriz_aumentada = fscanfMat(arq);// pega o arquivo de formato especificado 


```
O método a seguir cria a função simplex que recebe como variável de entrada uma matriz.

``` scilab
function metodo = simplex(matriz_aumentada)
```
O conjunto de função a seguir captura a dimensão da matriz aumentada e separa em uma matriz de coneficientes chamada A e um vetor b.

``` scilab
    dim = size(matriz_aumentada);// vetor que tem a qnt de linhas por qnt de colunas
    
    
    A = matriz_aumentada(:,1:dim(2)-1);// Matriz de coeficientes
    b = matriz_aumentada(:,dim(2));// vetor de resultados
``` 
