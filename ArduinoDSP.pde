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
#define cblen 1024

short cbuffer[cblen];

int sn=0;
void loop() {
  short input = analogRead(left);
  cbuffer[sn]=input;
  
  if(enableFx){
    input = (input + cbuffer[(sn-333) % cblen])/2;
  }
  output(left, input);
  output(right, input);
  sn++;
  if(sn < cblen)
    sn=0;
}
void toggleButton(){
  enableFx = digitalRead(2) == 1 ? 0 : 1;
  digitalWrite(13,enableFx);
}
