#include "dsp.h"
#include "oscilloscope.h"
int enableFx = 0;
// Todo , write a way cooler circular buffer.
unsigned int CBLEN =0;
unsigned short *circleBuffer;
unsigned int cbpos=0;

#define SHIFT(v) ((float)(v-500.0))
#define UNSHIFT(v) ((int)(v+500))
#define getCBSample(n) (circleBuffer[(time+(n))%CBLEN])
void setup() {

  pinMode(3,OUTPUT); // Left LOW bits
  pinMode(11,OUTPUT);  // Left HIGH bits
  pinMode(5,OUTPUT); // Right LOW bits
  pinMode(6,OUTPUT); // Right HIGH bits
  pinMode(13,OUTPUT); // Super-fun-LED!
  
  pinMode(2,INPUT);
  digitalWrite(2,HIGH); 

  setupIO();
  //Serial.begin(9600);
  useCircleBuffer(512);
}
#define SINEPASS(x,o,w) (0.5+sin((o)+(x)*(w))/2)
#define PHASEf(t) ((time % (t) ) / (t))
#define PHASEsin(t) (0.5+sin(PHASEf(t)*2*PI)/2)
unsigned long time = 0;

void loop() {
  short sample = analogRead(left);
  {// Sound Effects
  
    updateCircleBuffer(sample);
    
    if(true){
      // Polynominal Distortion
      //float s = SHIFT(sample) / 500.f;
      //sample = UNSHIFT( (1.5f * s - 0.5f * s*s *s) * 500 );  
    }
    //Clamp between 0 and 1000 , No really, don't do this.. 
    //sample = min(1000,max(0,sample));
  
  }
  // write out;
  time++;
  output(left, sample);
  //output(right, sample); // Mono left only for now. 
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


