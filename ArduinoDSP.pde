#include "dsp.h"
#include "oscilloscope.h"
int enableFx = 0;
// Todo , write a way cooler circular buffer.
unsigned int CBLEN =0;
unsigned short *circleBuffer;
unsigned int cbpos=0;

#define SHIFT(v) ((float)(v-500.0))
#define UNSHIFT(v) ((int)(v+500))

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
  //useCircleBuffer(256);
}
#define SINEPASS(x,o,w) (0.5+sin((o)+(x)*(w))/2)
unsigned long time = 0;

void loop() {
  short sample = analogRead(left);
  {// DSP GOES HERE:
    //updateCircleBuffer(sample);
    
    if(true){
      // volume boost
      sample= UNSHIFT(SHIFT(sample)*3);
      
      // Polynominal Distortion
      float s = SHIFT(sample) / 500.f;
      sample = UNSHIFT( (1.5f * s - 0.5f * s*s *s) * 500 );  
    }
    //Clamp between 0 and 1000
    sample = min(1000,max(0,sample));
  
  }
  // write out;
  time++;
  output(left, sample);
  output(right, sample);
}
void toggleButton(){
  enableFx = !digitalRead(2);
  digitalWrite(13,enableFx);
}
/** Call during setup(). 
 * allocates memory to the circular buffer 
 * param samples size of buffer to allocate
 */
void useCircleBuffer(int samples){
  CBLEN=samples;
  circleBuffer = (unsigned short*)malloc(CBLEN);
}


/** Call during loop to save current sample into the buffer
*/
void updateCircleBuffer(short sample){
  circleBuffer[time%CBLEN] = sample;
}
