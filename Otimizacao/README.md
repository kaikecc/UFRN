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
Algumas variáveis são criadas para auxiliar o método.

``` scilab
q = zeros(1,length(b)-1); // vetor do Fator Limitante
//vb = zeros(1,length(b)-1); // variaveis BASICAS
linha1 = A(1,:);// primeira linha da matriz de coeficientes
```
Nesse ponto o código precisa fazer algumas interações até que a linha 1 não tenha mais nenhum elemento negativo.

``` scilab
m = -1;
 while m < length(linha1)
 ```
 O primeiro passo do método começa com a escolha da variável básica com o menor valor da primeira linha da matriz de coeficientes. Em seguida, indentificar o endereço da matriz para iniciar o processo com a variável index e caso tenha uma duplicidade do valor escolha a primeira posição do index.
 
 ``` scilab
  a = min(linha1); // menor valor da primeira linha  (variavel nao basica)  
        
 //***** SÓ PRA SABER O INDICE DE UMA LINHA DE MATRIX
             
 index = find(linha1 == a);

 if length(index) > 1 then
 
      index = index(1);
      
 end
 ``` 
``` scilab
 // tá bom para achar o vetor de fator limitante
        for i = 1:length(b)-1
            if A(i+1,index) <= 0 then // tanto divisao por zero e o denominador negativo dever ser excluido
                q(i) = 100000; // VALOR BEM GRANDE PARA SER EXCLUIDO NA FUNCAO min
            else
                q(i) = b(i+1) / A(i+1,index);
            end
        end
``` 
