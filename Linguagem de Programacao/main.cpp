
// PROJETO FINAL:  Sistema de Gerenciamento de Alunos de Linguagem de Programação
//ALUNOS: JHONAT HEBERSON AVELINO DE SOUZA - SUB: 04B  e KAIKE CASTRO CARVALHO - SUB: 04D


// bibliotecas usadas no projeto
#include <iostream>
#include "biblioteca.h"
#include <stdlib.h>
#include <ctime>
#include <iomanip>
#include <cmath>
#include <unistd.h>
#include <stdio.h>



//---------------------- variaveis globais ----------------------------
aluno v[TURMA];
int numero_alunos;
int matriz_relacao[TURMA][TURMA];
//---------------------- variaveis globais ----------------------------

using namespace std;

int main()
{
	menu();
//---------------------- lendo aquivo ----------------------------
	le_arquivo("alunos.txt", v, numero_alunos);
	le_arquivo_relacao("relacao.txt", matriz_relacao, numero_alunos);
//---------------------- lendo aquivo ----------------------------

//---------------------- menu ------------------------------------

	int opcao;
	do
	{
		cin >> opcao;
		switch(opcao)// Após a escolha no menu a função é escolhida nesse switch
		{
		case 1:
		{
			matricula(v, numero_alunos);
			////sleep(10);
			menu();
			break;
		}
		case 2:
		{
			nome(v, numero_alunos);
			//sleep(10);
			menu();
			break;
		}
		case 3:
		{
			insercao_aluno(v, numero_alunos);
			//sleep(3);
			menu();
			break;
		}
		case 4:
		{
			remocao_aluno(v, numero_alunos);
			//sleep(3);
			menu();
			break;
		}
		case 5:
		{
			insercao_notas(v, numero_alunos);
			//sleep(3);
			menu();
			break;
		}
		case 6:
		{
			insercao_falta(v, numero_alunos);
			//sleep(3);
			menu();
			break;
		}
		case 7:
		{
			relacao(v, numero_alunos, matriz_relacao);
			//sleep(3);
			menu();
			break;
		}
		case 8:
		{
			media_faltas(v, numero_alunos);
			//sleep(5);
			menu();
			break;
		}
		case 9:
		{
			histograma(v, numero_alunos);
			//sleep(10);
			menu();
			break;
		}
		case 10:
		{
			listagem_relacao(v, numero_alunos, matriz_relacao);
			//sleep(10);
			menu();
			break;
		}
		case 11:
		{
			relacao_dois(v, numero_alunos, matriz_relacao);
			//sleep(10);
			menu();
			break;
		}
		case 12:
		{
			cout << "Voce saiu do programa!" << endl;
			salva_arquivo("alunos.txt", v, numero_alunos);
			salva_arquivo_relacao("relacao.txt", matriz_relacao, numero_alunos);
			break;
		}
		default:
		{
			cout << "Digite incorreto, por favor digite novamente:" << endl;
			//sleep(3);
			menu();
			break;
		}
		}
	}
	while(opcao != 12);

//---------------------- FIM ------------------------------------
}
