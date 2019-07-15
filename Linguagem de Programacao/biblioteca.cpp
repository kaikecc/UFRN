
// bibliotecas usadas no projeto.
#include "biblioteca.h"
#include <cstring>
#include <cmath>
#include <iomanip>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>

using namespace std;


void menu()
{
	system("clear");
	cout << "-----------------------------------------------" << endl;
	cout << "----------------ANALISE DE TURMA---------------" << endl;
	cout << "-----------------------------------------------" << endl;
	cout << endl;
	cout << endl;
	cout << "-----------------------------------------------------------" << endl;
	cout << "---------Digite um numero para acessar o menu abaixo-------" << endl;
	cout << "-----------------------------------------------------------" << endl;
	cout << "1.  Consulta por matricula" << endl;
	cout << "2.  Consulta por nome" << endl;
	cout << "3.  Insercao de um novo aluno" << endl;
	cout << "4.  Remocao de um aluno existente" << endl;
	cout << "5.  Insercao de uma nota" << endl;
	cout << "6.  Insercao ou retirada de falta" << endl;
	cout << "7.  Atribuicao de relacao entre alunos" << endl;
	cout << "8.  Media das faltas dos alunos" << endl;
	cout << "9.  Histograma das media das notas dos alunos" << endl;
	cout << "10. Listagem dos alunos que estao relacionados ou nao com um aluno" << endl;
	cout << "11. Relacao entre dois alunos" << endl;
	cout << "12. Sair \n" << endl;
}

//----------------------------    FUNCAO LER ARQUIVO DADOS DOS ALUNOS ----------------------------

void le_arquivo(char arquivo[], aluno v[], int&nv)// FUNCAO PARA LER ARQUIVO TXT
{
	fstream arq;
	arq.open(arquivo);
	if(arq.is_open())
	{
		arq >> nv;
		arq.ignore();
		for(int i = 0; i < nv; i++)
		{
			arq.getline(v[i].nome, MAX);
			arq.getline(v[i].matricula, MAX);
			for(int cont = 0; cont < 3; cont++)
			{
				arq >> v[i].notas[cont];
			}
			arq >> v[i].faltas;
			arq.ignore();
		}
	}
	arq.close();
}

//-------------------------------- FUNCAO LER ARQUIVO RELAÇÃO ----------------------------


void le_arquivo_relacao(char arquivo[], int  matriz_relacao[][TURMA], int&nv)
{
	fstream arq;
	arq.open(arquivo);
	if(arq.is_open())
	{
		arq >> nv;
		arq.ignore();
		for(int i = 0; i < nv; i++)
		{
			for(int j = 0; j < nv; j++)
			{
				arq >> matriz_relacao[i][j];
			}
		}
	}
	arq.close();
}

//---------------------- FUNCAO CONSULTAR MATRICULA IGUAIS  -----------------

int consulta_matricula(aluno v[], char matricula[], int & nv)
{
	for(int i = 0; i <= nv; i++)
	{
		if(strcmp(v[i].matricula, matricula) == 0)
		{
			return i;
		}
	}
	return -1;
}

// FUNCAO DE CONSULTAR NOMES IGUAIS
void consulta_nome(aluno v[], char nome[], int & nv, int indeci[], int &nindeci)
{
	nindeci = 0;
	for(int i = 0; i <= nv; i++)
	{
		if(strcmp(v[i].nome, nome) == 0)
		{
			indeci[nindeci] = i;
			nindeci++;
		}
	}
}
// FUNCAO DE INCLUIR NOVOS ALUNOS
void insercao_aluno(aluno v[], int & nv)
{

	cout << "Digite a matricula :";
	char matricula_inserida[MAX];
	cin >> matricula_inserida;
	int i =  consulta_matricula(v, matricula_inserida, nv);
	if(i != -1)
	{
		cout << "Matricula existente " << endl;
	}
	else
	{
		strcpy(v[nv].matricula, matricula_inserida);
		cin.ignore();
		cout << "Digite o nome do aluno: ";
		cin.getline(v[nv].nome, MAX);
		int unidades = 1;
		for(int k = 0; k < 3; k++)
		{
			cout << "Digite a nota da " << unidades << " unidade: ";
			cin >> v[nv].notas[k];
			unidades++;
		}
		cin.ignore();
		cout << "Digite as faltas :";
		cin >> v[nv].faltas;
		cout << "Inclusao realizada com sucesso!" << endl;
		nv++;
	}
}

// FUNCAO PARA REMOVER ALUNOS EXISTENTES
void remocao_aluno(aluno v[], int & nv)
{
	nv++;
	int aux = 0;
	cout << "Digite a matricula :";
	char matricula_inserida[MAX];
	cin >> matricula_inserida;
	int i =  consulta_matricula(v, matricula_inserida, nv);
	if(i == -1)
	{
		cout << "Aluno inexistente" << endl;
	}
	else
	{
		cout << "Deseja remover aluno?" << endl;
		cout << " 1 - SIM" << endl;
		cout << " 2 - NAO" << endl;
		cin >> aux;

		if(aux == 1)
		{

			for( int p = i; p < nv - 1; p++)
			{
				v[p] = v[p + 1];
			}
			nv--;
			cout << "EXCLUSAO REALIZADA COM SUCESSO!" << endl;
		}

	}
}
// FUNCAO PARA INCLUIR NOTAS PARA OS ALUNOS
void insercao_notas(aluno v[], int nv)
{
	cout << "Digite a matricula :";
	char matricula_inserida[MAX];
	cin >> matricula_inserida;
	int i =  consulta_matricula(v, matricula_inserida, nv);
	if(i == -1)
	{
		cout << "Matricula inexistente!" << endl;
	}
	else
	{
		int unidade;
		cout << "Insira a unidade :" ;
		cin >> unidade;
		if(unidade == 1)
		{
			cout << "Insira a nota da 1 unidade :";
			cin >> v[i].notas[0];
			cout << "Nota incluida com sucesso!" << endl;
		}
		else if(unidade == 2)
		{
			cout << "Insira a nota da 2 unidade :";
			cin >> v[i].notas[1];
			cout << "Nota incluida com sucesso!" << endl;
		}
		else if(unidade == 3)
		{
			cout << "Insira a nota da 3 unidade :";
			cin >> v[i].notas[2];
			cout << "Nota incluida com sucesso!" << endl;
		}


	}
}

// FUNCAO PARA INSERIR OU RETIRAR FALTAS PARA ALUNOS
void insercao_falta(aluno v[], int nv)
{
	int falta = 0;
	int deseja = 0;
	cout << "Digite a matricula :";
	char matricula_inserida[MAX];
	cin >> matricula_inserida;
	int i =  consulta_matricula(v, matricula_inserida, nv);
	if(i == -1)
	{
		cout << "Matricula inexistente!" << endl;
	}
	else
	{
		cout<<"DESEJA: 1 - INCLUIR FALTA:"<<endl;
		cout<<"        2 - RETIRAR FALTA:"<<endl;
		cin>>deseja;
		
		if(deseja == 1)
		{			
		cout << "Insira falta :" ;
		cin >> falta;
		v[i].faltas = v[i].faltas + falta;
		if(v[i].faltas < 0){
            v[i].faltas = 0;
		}
		cout << "Falta incluida com sucesso!" << endl;
		}
		else if(deseja == 2)
		{
 cout << "Retire falta :" ;
		cin >> falta;
		v[i].faltas = v[i].faltas - falta;
		if(v[i].faltas < 0){
            v[i].faltas = 0;			
		}		
		cout << "Falta retirada com sucesso!" << endl;		
	}
}
}

// FUNCAO QUE ADCIONA RELACAO ENTRE DOIS ALUNOS NA MATRIZ DE RELACAO
void relacao(aluno v[], int & nv, int matriz[][TURMA])
{
	int indice_aluno_1, indice_aluno_2;
	cout << "Digite a matricula do 1 aluno :";
	char matricula_1[MAX], matricula_2[MAX];
	cin >> matricula_1;
	indice_aluno_1 = consulta_matricula(v, matricula_1, nv);
	if(indice_aluno_1 == -1){
        cout  << "Matricula inexistente!" << endl;
	}
	else {
        cout << "Digite a matricula do 2 aluno :";
        cin >> matricula_2;
        indice_aluno_2 = consulta_matricula(v, matricula_2, nv);
        if(indice_aluno_2 == -1){
            cout  << "Matricula inexistente!" << endl;
        }
        else if(indice_aluno_1 != indice_aluno_2)
        {
            cout << "-----------------------------------------------" << endl;
            cout << "---------------Relacao de turma----------------" << endl;
            cout << "-----------------------------------------------" << endl;
            cout << endl;
            cout << endl;
            cout << "-----------------------------------------------------------------" << endl;
            cout << "----digite um numero para atribuir a relacao ao aluno-------" << endl;
            cout << "-----------------------------------------------------------------" << endl;
            cout << "0: NAO SE CONHECEM" << endl;
            cout << "1: SE CONHECEM, MAS NAO SE RELACIONAM MUITO" << endl;
            cout << "2: SE RELACIONAM BASTANTE" << endl;
            int relacao;
            cin >> relacao;
            matriz[indice_aluno_1][indice_aluno_2] = relacao;
            matriz[indice_aluno_2][indice_aluno_1] = relacao;
            cout << "Operacao realizado com sucesso!" << endl;
        }
        else
        {
            cout << "Matricula iguais!" << endl;
        }
    }
}
// FUNCAO QUE CALCULA A MÉDIA DAS FALTAS DA TURMA
void media_faltas(aluno v[], int & nv)
{
	float falta = 0.0;
	float resultado = 0.0;
	for(int i = 0; i < nv; i++)
	{

		falta += v[i].faltas;
		//	cout<<falta<<endl;
	}
	resultado = float((falta / nv));
	cout << "Media de falta :" << resultado << endl;
}
// FUNCAO QUE CONSTROI O HISTOGRAMA DAS NOTAS DOS ALUNOS
void histograma(aluno v[], int & nv)
{
	float medias_alunos[TURMA];
	int classes[10];
	for(int i = 0; i < nv; i++)
	{
		medias_alunos[i] = (v[i].notas[0] + v[i].notas[1] + v[i].notas[2] + v[i].notas[3]) / 4;
	}
	classe(medias_alunos, classes, nv);
	impri_classe(classes);
}
// FUNCAO QUE LISTA A RELACAO DE ALUNO COM OS DEMAIS
void listagem_relacao(aluno v[], int & nv, int matriz[][TURMA])
{
	int indice_aluno_1, indice_aluno_2;
	int relacao;
	cout << "Digite a matricula do aluno :";
	char matricula_1[MAX], matricula_2[MAX];
	cin >> matricula_1;
    int i = consulta_matricula(v,matricula_1,nv);
    if(i == -1){
        cout << "Aluno inexistente! " << endl;
    }
    else {
        cout << "Digite a relacao: \n" << endl;
        cout << "0: nao se conhecem" << endl;
        cout << "1: se conhecem, mas nao se relacionam muito" << endl;
        cout << "2: se relacionam bastante" << endl;
        cin >> relacao;

        if(relacao == 0)
        {
            for(int j = 0; j < nv; j++)
            {
                if(matriz[i][j] == 0)
                {
                    cout << "NOME: ";
                    cout << v[j].nome << endl;
                }
            }

        }
        else if(relacao == 1)
        {
            for(int j = 0; j < nv; j++)
            {
                if(matriz[i][j] == 1)
                {
                    cout << "NOME: ";
                    cout << v[j].nome << endl;
                }
            }

        }
        else
        {
            for(int j = 0; j < nv; j++)
            {
                if(matriz[i][j] == 2)
                {
                    cout << "NOME: ";
                    cout << v[j].nome << endl;
                }
            }

        }

    }
}
// FUNCAO QUE SALVA O ARQUIVO DA RELACAO EM RELACAO.TXT
void salva_arquivo_relacao(char arquivo[], int  matriz_relacao[][TURMA], int&nv)
{
	fstream arq;
	arq.open(arquivo);
	if(arq.is_open())
	{
		arq << nv << endl;
		for(int i = 0; i < nv; i++)
		{
			for(int j = 0; j < nv; j++)
			{
				arq << matriz_relacao[i][j] << " ";
			}
			arq << endl;
		}
	}
	arq.close();
}

// FUNCAO PARA SALVAR ALTERACOES DO ARQUIVO ALUNO.TXT
void salva_arquivo(char arquivo[], aluno v[], int nv)
{
	fstream arq;
	arq.open(arquivo);
	if(arq.is_open())
	{
		arq << nv << endl;
		for(int i = 0; i < nv; i++)
		{
			arq << v[i].nome << endl;
			arq << v[i].matricula << endl;
			for(int cont = 0; cont < 3; cont++)
			{
				arq << v[i].notas[cont] << " ";
			}
			arq << endl;
			arq << v[i].faltas << endl;
		}
	}
	arq.close();
}

// FUNCAO QUE RETORNA O INDICE DA MATRICULA DE CADA ALUNO
int matricula(aluno v[], int & numero_alunos)
{
	char matricula[MAX];
	cout << "Digite a matricula:";
	cin >> matricula;
	int i =  consulta_matricula(v, matricula, numero_alunos);
	if(i == -1)
	{
		cout << "Matricula inexistente!" << endl;
	}
	else
	{
		cout << v[i].nome << endl;
		cout << v[i].matricula << endl;
		for(int k = 0; k < 3; k++)
		{
			cout << v[i].notas[k] << " " << endl;
		}
		cout << v[i].faltas << endl;
	}
}
// FUNCAO QUE LISTA TODOS OS NOMES IGUAIS NA TURMA
char nome(aluno v[], int & numero_alunos)
{
	char nome[MAX];
	int n_dim = 0;
	int vet[MAX];
	cout << "Digite a nome do aluno:";
	cin.ignore();
	cin.getline(nome, MAX);
	consulta_nome(v, nome, numero_alunos, vet, n_dim);
	if(n_dim == 0)
	{
		cout << "Aluno inexistente!" << endl;
	}
	else
	{
		for(int i = 0; i < n_dim; i++)
		{
			cout << v[vet[i]].nome << endl;
			cout << v[vet[i]].matricula << endl;
			for(int k = 0; k < 3; k++)
			{
				cout << v[vet[i]].notas[k] << " " << endl;
			}
			cout << v[vet[i]].faltas << endl;
		}
	}

}
//FUNCAO QUE CONSTROI CLASSE PARA O HISTOGRAMA 
void classe(float vetor[], int vetor_ocorrencia[], int nv)
{
	for(int i = 0; i < 10; i++)
	{
		vetor_ocorrencia[i] = 0;
	}
	for(int i = 0; i < nv; i++)
	{
		if(vetor[i] < 1)
		{
			vetor_ocorrencia[0] += 1;
		}
		else if(vetor[i] < 2)
		{
			vetor_ocorrencia[1] += 1;
		}
		else if(vetor[i] < 3)
		{
			vetor_ocorrencia[2] += 1;
		}
		else if(vetor[i] < 4)
		{
			vetor_ocorrencia[3] += 1;
		}
		else if(vetor[i] < 5)
		{
			vetor_ocorrencia[4] += 1;
		}
		else if(vetor[i] < 6)
		{
			vetor_ocorrencia[5] += 1;
		}
		else if(vetor[i] < 7)
		{
			vetor_ocorrencia[6] += 1;
		}
		else if(vetor[i] < 8)
		{
			vetor_ocorrencia[7] += 1;
		}
		else if(vetor[i] < 9)
		{
			vetor_ocorrencia[8] += 1;
		}
		else
		{
			vetor_ocorrencia[9] += 1;
		}
	}
}
// FUNCAO QUE DESENHA O HISTOGRAMA
void impri_classe(int vetor_classes[])
{

	cout << "Frequencia das notas dos alunos: " << endl;
	cout << "0 - 1: ";
	for(int i = 0; i < vetor_classes[0]; i++)
	{
		cout << "*";
	}
	cout << "\n1 - 2: ";
	for(int i = 0; i < vetor_classes[1]; i++)
	{
		cout << "*";
	}
	cout << "\n2 - 3: ";
	for(int i = 0; i < vetor_classes[2]; i++)
	{
		cout << "*";
	}
	cout << "\n3 - 4: ";
	for(int i = 0; i < vetor_classes[3]; i++)
	{
		cout << "*";
	}
	cout << "\n4 - 5: ";
	for(int i = 0; i < vetor_classes[4]; i++)
	{
		cout << "*";
	}
	cout << "\n5 - 6: ";
	for(int i = 0; i < vetor_classes[5]; i++)
	{
		cout << "*";
	}
	cout << "\n6 - 7: ";
	for(int i = 0; i < vetor_classes[6]; i++)
	{
		cout << "*";
	}
	cout << "\n8 - 9: ";
	for(int i = 0; i < vetor_classes[7]; i++)
	{
		cout << "*";
	}
	cout << "\n10 - >>>: ";
	for(int i = 0; i < vetor_classes[8]; i++)
	{
		cout << "*";
	}
	cout << "\n9 - 10: ";
	for(int i = 0; i < vetor_classes[9]; i++)
	{
		cout << "*";
	}

}
// FUNCAO QUE MOSTRA A RELACAO DE DOIS ALUNOS QUALQUES
void relacao_dois(aluno v[], int & nv, int matriz[][TURMA])
{
	int indice_aluno_1, indice_aluno_2;
	cout << "Digite a matricula do 1 aluno :";
	char matricula_1[MAX], matricula_2[MAX];
	cin >> matricula_1;
	cout << "Digite a matricula do 2 aluno :";
	cin >> matricula_2;
	indice_aluno_1 = consulta_matricula(v, matricula_1, nv);
	indice_aluno_2 = consulta_matricula(v, matricula_2, nv);
	if(indice_aluno_1 == indice_aluno_2)
	{
		cout << "Mesmo alunos, por favor digite novamente!" << endl;
	}
	else if(indice_aluno_1 == -1)
	{
		cout << "MATRICULA NAO ENCONTRADA" << endl;
	}
	else if(indice_aluno_2 == -1)
	{
		cout << "MATRICULA NAO ENCONTRADA" << endl;
	}
	else
	{
		cout << "A RELACAO DOS DOIS ALUNOS E: " << endl;
		cout << matriz[indice_aluno_1][indice_aluno_2] << endl;

	}
}
// FIM



