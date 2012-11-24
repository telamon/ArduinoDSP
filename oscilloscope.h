/*
 * oscilloscope.h
 *
 * Gives a visual rendering of a value (typically analog pin 0) in realtime.
 * 
 * This is an object-oriented version of the Poorman's oscilloscope as explained here:
 * http://accrochages.drone.ws/node/90
 * 
 * (c) 2008 Sofian Audry | info(@)sofianaudry(.)com
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef OSCILLOSCOPE_INC
#define OSCILLOSCOPE_INC

#include "Arduino.h"

void writeOscilloscope(int channel, int value) {
  Serial.write( 0xff );                // send init byte
  Serial.write( channel & 0xff);       // Send channel ID;
  Serial.write( (value >> 8) & 0xff ); // send first part
  Serial.write( value & 0xff);        // send second part
}
void writeOscilloscope(int value){
  writeOscilloscope(0,value);
}
#define OSC(c,v) (writeOscilloscope(c,v))
#endif

/* An example of Arduino code. */
/*
#include "oscilloscope.h"

#define ANALOG_IN 0

void setup() {
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(ANALOG_IN);
  writeOscilloscope(val);
}

*/

/* The Processing code */
/*
import processing.serial.*;

Serial port;  // Create object from Serial class
int val;      // Data received from the serial port
int[] values;
float zoom;

void setup() 
{
  size(640, 480);
  // Open the port that the board is connected to and use the same speed (9600 bps)
  port = new Serial(this, Serial.list()[0], 9600);
  values = new int[width];
  zoom = 1.0f;
  smooth();
}

int getY(int val) {
  return (int)(height - val / 1023.0f * (height - 1));
}

int getValue() {
  int value = -1;
  while (port.available() >= 3) {
    if (port.read() == 0xff) {
      value = (port.read() << 8) | (port.read());
    }
  }
  return value;
}

void pushValue(int value) {
  for (int i=0; i<width-1; i++)
    values[i] = values[i+1];
  values[width-1] = value;
}

void drawLines() {
  background(0);
  stroke(255);
  
  int displayWidth = (int) (width / zoom);
  
  int k = values.length - displayWidth;
  
  int x0 = 0;
  int y0 = getY(values[k]);
  for (int i=1; i<displayWidth; i++) {
    k++;
    int x1 = (int) (i * (width-1) / (displayWidth-1));
    int y1 = getY(values[k]);
    line(x0, y0, x1, y1);
    x0 = x1;
    y0 = y1;
  }
}

void keyReleased() {
  switch (key) {
    case '+':
      zoom *= 2.0f;
      println(zoom);
      if ( (int) (width / zoom) <= 1 )
        zoom /= 2.0f;
      break;
    case '-':
      zoom /= 2.0f;
      if (zoom < 1.0f)
        zoom *= 2.0f;
      break;
  }
}

void draw()
{
  val = getValue();
  if (val != -1) {
    pushValue(val);
    drawLines();
  }
}
*/
