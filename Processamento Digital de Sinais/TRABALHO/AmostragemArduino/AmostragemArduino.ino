#include <ultrasonic.h>// inclui bilioteca ultrassom

// due (41,43)
// esp32(4, 5)
ultra_s sens1(8, 9);// (trig, echo) // pinos de comunicação

#define SAMPLES 128 // Números de amostras 
#define SAMPLING_FREQUENCY 500 //Hz, must be less than 10000 due to ADC Frequencia de amostragem

unsigned  sampling_period_us; unsigned long microseconds;// variaveis de tempo

unsigned  long tempo[SAMPLES];// vetor que armazena os tempos de execucao em microsegundos do for
unsigned dados[SAMPLES];// vetor que armazena os tempos relativo a distancia em microsegundos do for


void setup()
{
  Serial.begin(115200);
  sampling_period_us = round(1000000 * (1.0 / SAMPLING_FREQUENCY));// periodo de amostragem em microsegundos nesse caso 2000us ou 0.002s  
}

void loop()
{

  // AMOSTRAGEM
  for (int i = 0; i < SAMPLES; i++)// executa de acordo com a qnt de amostras que se deseja
  {
    microseconds = micros();//Overflows after around 70 minutes! CUIDADO
    tempo[i] = microseconds;
    dados[i] = sens1.measureDistance('t');
    while (micros() < (microseconds + sampling_period_us)) {
    }
  }

 
  //PASSANDO OS VALORES VIA SERIAL
  for (int j = 0; j < SAMPLES; j++)
  {
    Serial.print(tempo[j]);
    Serial.print("\t");
    Serial.println(dados[j]);
    delay(10);
  }
 
  while (1);// faz somente uma vez

}
