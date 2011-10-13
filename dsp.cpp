#include "dsp.h"
#include "timers.h"
#include "WProgram.h"

void setupIO() {
  // prepare left
  waveformGenerationMode(3, phaseCorrect);
  timerPrescale(3, 1);
//  analogWrite(3, 0);
  
  // prepare right
  waveformGenerationMode(5, phaseCorrect);
  timerPrescale(5, 1);
//  analogWrite(5, 0);
//  analogWrite(6, 0);
  
  // faster input
  analogReference(INTERNAL);
  analogPrescale(analogPrescale32);
  
  
}
  
void output(int channel, short value) {
  if(channel == left) {
    pwm3 = value >> 2;
    pwm11 = (value & B11) << 6;
  } else if(channel == right) {
    pwm5 = value >> 2;
    pwm6 = (value & B11) << 6;
  }
  /*
    if(channel == left) {
    analogWrite(3,value >> 2);
    analogWrite(11, (value & B11) << 6);
  } else if(channel == right) {
    analogWrite(5 , value >> 2);
    analogWrite(6 , (value & B11) << 6);
  }
  */
}
