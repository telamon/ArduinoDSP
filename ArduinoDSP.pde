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

void loop() {
  short input = analogRead(left);
  output(left, input);
  output(right, input);
}
void toggleButton(){
  enableFx = digitalRead(2) == 1 ? 0 : 1;
  digitalWrite(13,enableFx);
}

