/*

UFRN-CT-DCA

AL5D-LYNX 2.0 SIMULATOR ON V-REP

DEVELOPED BY: Eng. Msc. Jean M. M. Lima.

*/



#ifndef _ARMC_SIMULATOR_H_
#define _ARMC_SIMULATOR_H_

	#include "extApi.h"
	#include <stdio.h>
	#include <string.h>
	#include <math.h>
	#include <stdlib.h>
	#include <stdbool.h>
	#include "v_repConst.h"
	#include "v_repLib.h"

	#define HOME_POS "#0P1500#1P1500#2P1500#3P1500#4P1500"

	#define BUFSIZE 1024

	// SERVOS //

	// Servo da base HS-485HB //
	#define BAS_SERVO 0
	#define BAS_MIN 500
	#define BAS_MAX	2380

	// Servo do ombro HS-805BB //
	#define SHL_SERVO 1
	#define SHL_MIN 1200
	#define SHL_MAX 2000

	// Servo do cotovelo HS-755HB//
	#define ELB_SERVO 2
	#define ELB_MIN 1100
	#define ELB_MAX 2100

	// Servo do punho HS-645MG //
	#define WRI_SERVO 3
	#define WRI_MIN 500
	#define WRI_MAX	2500
	
	// Servo da garra HS-322HD //
	#define GRI_SERVO 4
	#define GRI_MIN 1300
	#define GRI_MAX 2400

	//Tempo em ms para execução das instruções
	#define TIME 500
	
	void ufrn_header();
	int abre_porta();
	void setup(int);
	void fecha_porta(int);
	int simulacao_ativa(int);
	void envia_comando(int,char[]);
	float getPos(int,int);
	


#endif
