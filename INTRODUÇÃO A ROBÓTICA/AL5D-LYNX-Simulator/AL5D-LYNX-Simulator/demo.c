
#include <stdio.h>
#include <unistd.h>
#include "armc_simulator.h"

int main(){

  char *comando;

	ufrn_header();

	int clientID = abre_porta();
	if(clientID  != -1){

  		printf("Servidor conectado!\n");

  		setup(clientID);
  		

      comando = (char*) malloc(sizeof(char)*BUFSIZE);
    	// Enquanto a simulacao for ativa
    	while(simulacao_ativa(clientID)!=-1){

        //////////////////////
        // PRIMEIRO COMANDO //
        //////////////////////

        
        printf("\nPRIMEIRO COMANDO - POSICAL INICIAL\n");

        sprintf(comando,"%s",HOME_POS);


        printf("Envio de comando: %s\n",comando);
  			envia_comando(clientID,comando);
  			
        printf("Pressione enter para continuar...");
        getchar();

        /////////////////////
        // SEGUNDO COMANDO //
        /////////////////////
        printf("\nSEGUNDO COMANDO - MOVER O PUNHO\n");

        printf("Espere 2 segundos...\n");
        sleep(2);
        memset(comando, 0, BUFSIZE);

        sprintf(comando,"#3P2500");

        printf("Envio de comando: %s\n",comando);
        envia_comando(clientID,comando);

        printf("Pressione enter para continuar...");
        getchar();

        //////////////////////
        // TERCEIRO COMANDO //
        //////////////////////
        printf("\nTERCEIRO COMANDO - MOVER A GARRA\n");

        printf("Espere 2 segundos...\n");
        sleep(2);
        memset(comando, 0, BUFSIZE);

        sprintf(comando,"#%dP%d",4,500);
        printf("Envio de comando: %s\n",comando);
        envia_comando(clientID,comando);

        // FIM DO PROGRAMA DEMO //
        fecha_porta(clientID);
        printf("\nAcesso a simulador finalizado\n");

    	}

    //	fecha_porta(clientID);


  	}
  	else {
  		printf("Servidor não foi conectado!\n");
  		return 0;
  	}


	
}
