#include "dsp.h"
#include "oscilloscope.h"
int enableFx = 0;
void setup() {
  pinMode(3,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(2,INPUT);
  digitalWrite(2,HIGH); 
  attachInterrupt(0,toggleButton,CHANGE);
  setupIO();
  //Serial.begin(9600);
}
// Todo , write a way cooler circular buffer.
#define CBLEN 1560
short circleBuffer[CBLEN];
unsigned int cbpos=0;

#define SHIFT(v) (v-500)
#define UNSHIFT(v) (v+500)
void loop() {
  short sample = analogRead(left);
  
  circleBuffer[CBLEN] = sample;
  // DSP goes here.
  #define time 888
  #define wetness 0.5
  sample = UNSHIFT(SHIFT(sample)  + wetness * SHIFT(circleBuffer[(cbpos - time)%CBLEN]));
  
  
  cbpos = (cbpos + 1) % CBLEN;
  
  // write out;
  output(left, sample);
  output(right, sample);
}
void toggleButton(){
  if(digitalRead(2) == 0)
    enableFx =  !enableFx;
  digitalWrite(13,enableFx);
}

