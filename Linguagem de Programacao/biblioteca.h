#ifndef BIBLIOTECA_H_INCLUDED
#define BIBLIOTECA_H_INCLUDED
#define MAX 51
#define TURMA 101

//---------------------- definindo estrutura --------------------------
struct aluno
{
	char nome[MAX];
	char matricula[MAX];
	float notas[4];
	int faltas;
};
//---------------------- definindo estrutura --------------------------

//---------------------- declarando as funcoes ----------------------------
void le_arquivo(char arquivo[], aluno v[], int & nv);
void salva_arquivo(char arquivo[], aluno v[], int nv);
int consulta_matricula(aluno v[], char matricula[], int & nv);
int matricula(aluno v[], int & numero_alunos);
void insercao_aluno(aluno v[], int & nv);
void remocao_aluno(aluno v[], int & nv);
void insercao_notas(aluno v[], int nv);
void classe(float vetor[], int vetor_ocorrencia[], int nv);
void impri_classe(int vetor_classes[]);
void histograma(aluno v[], int & nv);
void le_arquivo_relacao(char arquivo[], int  matriz_relacao[][TURMA], int&nv);
char nome(aluno v[], int & numero_alunos);
void insercao_falta(aluno v[], int nv);
void media_faltas(aluno v[], int & nv);
void menu();
void consulta_nome(aluno v[], char nome[], int & nv, int indeci[], int &nindeci);
void relacao(aluno v[], int & nv, int matriz[][TURMA]);
void menu();
void salva_arquivo_relacao(char arquivo[], int  matriz_relacao[][TURMA], int&nv);
void listagem_relacao(aluno v[], int & nv, int matriz[][TURMA]);
void relacao_dois(aluno v[], int & nv, int matriz[][TURMA]);


#endif // BIBLIOTECA_H_INCLUDED
//---------------------- FIM ----------------------------