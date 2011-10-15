#include "dsp.h"
#include "oscilloscope.h"
int enableFx = 0;
// Todo , write a way cooler circular buffer.
#define CBLEN 768
unsigned short *circleBuffer;
unsigned int cbpos=0;

#define SHIFT(v) ((float)(v-500.0))
#define UNSHIFT(v) ((int)(v+500))

void setup() {
  circleBuffer = (unsigned short*)malloc(CBLEN);
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

void loop() {
  short sample = analogRead(left);
  circleBuffer[cbpos] = sample;
  
  // DSP goes here.
  if(enableFx){
    #define time 20
    #define wetness 0.2
    sample = UNSHIFT(SHIFT(sample) *(1-wetness) + wetness * (SHIFT(circleBuffer[(cbpos - time)%CBLEN])));
    //sample = circleBuffer[(cbpos - time)%CBLEN];
  };
  cbpos = (cbpos + 1) % CBLEN;
  
  // write out;
  output(left, sample);
  output(right, sample);
}
void toggleButton(){
  enableFx = !digitalRead(2);
  digitalWrite(13,enableFx);
}

